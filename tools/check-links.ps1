<#
.SYNOPSIS
  Valide les liens (URL) de references.bib par requêtes HTTP réelles, en local.

.DESCRIPTION
  Extrait toutes les URL de references.bib, teste chacune (HEAD, repli GET) en parallèle
  avec un User-Agent de navigateur (réduit les faux 403), puis affiche un résumé par
  catégorie et la liste des liens non-2xx. Écrit un CSV complet.

  À exécuter TOI-MÊME (l'agent n'a pas l'accès réseau shell) :
      pwsh tools/check-links.ps1
  Options :
      pwsh tools/check-links.ps1 -Throttle 24 -TimeoutSec 20 -Csv build/liens.csv

  Prérequis : PowerShell 7+ (ForEach-Object -Parallel). Vérifier : $PSVersionTable.PSVersion.

.NOTES
  Conforme à CLAUDE.md §7 : sert à confirmer/infirmer l'accessibilité des références et à
  apposer le marqueur « % À VÉRIFIER » sur tout lien réellement mort (404/410).
#>
[CmdletBinding()]
param(
  [string]$Bib       = "references.bib",
  [string]$Csv       = "build/link-check.csv",
  [int]   $Throttle  = 20,
  [int]   $TimeoutSec = 15
)

$ErrorActionPreference = 'Continue'
try { [Console]::OutputEncoding = [Text.Encoding]::UTF8 } catch {}

if ($PSVersionTable.PSVersion.Major -lt 7) { Write-Error "PowerShell 7+ requis (ForEach-Object -Parallel)."; exit 1 }
if (-not (Test-Path $Bib)) { Write-Error "Fichier introuvable : $Bib"; exit 1 }

$bibText = Get-Content $Bib -Raw
$urls = [regex]::Matches($bibText, 'url\s*=\s*\{([^}]+)\}') |
        ForEach-Object { $_.Groups[1].Value.Trim() } |
        Where-Object { $_ } | Select-Object -Unique
Write-Host "URLs à vérifier : $($urls.Count)  (parallélisme $Throttle, timeout ${TimeoutSec}s)"

$results = $urls | ForEach-Object -ThrottleLimit $Throttle -Parallel {
  $u  = $_
  $to = $using:TimeoutSec
  $ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Safari/537.36"

  function Probe([string]$uri, [string]$method, [int]$to, [string]$ua) {
    try {
      $r = Invoke-WebRequest -Uri $uri -Method $method -TimeoutSec $to -MaximumRedirection 6 -UserAgent $ua -ErrorAction Stop
      return @([int]$r.StatusCode, 'OK')
    } catch {
      $c = $null
      if ($_.Exception.Response) { try { $c = [int]$_.Exception.Response.StatusCode.value__ } catch { try { $c = [int]$_.Exception.Response.StatusCode } catch {} } }
      $m = ($_.Exception.Message -replace '\s+', ' ')
      return @($c, $m.Substring(0, [Math]::Min(90, $m.Length)))
    }
  }

  $res = Probe $u 'Head' $to $ua
  if (-not $res[0] -or $res[0] -in 405, 501) { $res = Probe $u 'Get' $to $ua }
  [pscustomobject]@{ code = $res[0]; url = $u; detail = $res[1] }
}

$dir = Split-Path $Csv -Parent
if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }
$results | Sort-Object code | Export-Csv $Csv -NoTypeInformation -Encoding UTF8

function Categorie($c) {
  if     ($c -ge 200 -and $c -lt 300) { '1. 2xx OK' }
  elseif ($c -ge 300 -and $c -lt 400) { '2. 3xx redirect' }
  elseif ($c -in 401, 403, 429)       { '3. 401/403/429 bloqué-robot' }
  elseif ($c -in 404, 410)            { '4. 404/410 MORT' }
  elseif ($c -ge 500)                 { '5. 5xx serveur' }
  else                                { '6. erreur / timeout / DNS' }
}

Write-Host "`n=== RÉSUMÉ ($($results.Count)) ==="
$results | Group-Object { Categorie $_.code } | Sort-Object Name |
  ForEach-Object { '{0,5}  {1}' -f $_.Count, $_.Name }

$bad = $results | Where-Object { -not ($_.code -ge 200 -and $_.code -lt 300) } | Sort-Object code
if ($bad) {
  Write-Host "`n=== NON-2xx (code, url) ==="
  $bad | ForEach-Object { '{0,4}  {1}  [{2}]' -f $_.code, $_.url, $_.detail }
}
Write-Host "`nCSV complet : $Csv"
Write-Host "Rappel §7 : marquer « % À VÉRIFIER » dans references.bib tout lien 404/410 confirmé mort."

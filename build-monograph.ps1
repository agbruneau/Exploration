# Build script — L'Entreprise Agentique monograph PDF
# Pre-processes 21 .md files (strip YAML frontmatter, HTML comments), concatenates,
# converts to Typst via pandoc, then compiles to PDF via Typst.

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot

# Ordered list of source files (intro -> chapters -> annexes)
$files = @(
    '00-introduction.md',
    'ch01-from-automation-to-agents.md',
    'ch02-business-case.md',
    'ch03-mapping-high-impact.md',
    'ch04-roi-risk-readiness.md',
    'ch05-protocols-interoperability.md',
    'ch06-orchestration-memory-tools.md',
    'ch07-agentops.md',
    'ch08-trustworthy-systems.md',
    'ch09-agentic-security.md',
    'ch10-scaling-without-lockin.md',
    'ch11-redesigning-work.md',
    'ch12-lessons-failed.md',
    'ch13-road-ahead.md',
    'ch14-build-your-agentic-os.md',
    'annexe-A-architecture-review.md',
    'annexe-B-use-case-canvas.md',
    'annexe-C-agentops-maturity.md',
    'annexe-D-governance-raci.md',
    'annexe-E-glossaire-lectures.md',
    'glossaire.md',
    'references.md'
)

# French chapter / annexe display titles (override frontmatter)
$titles = @{
    '00-introduction.md'                  = 'Introduction — Pourquoi ce livre, pourquoi maintenant'
    'ch01-from-automation-to-agents.md'   = 'Chapitre 1 — De l''automatisation aux agents'
    'ch02-business-case.md'               = 'Chapitre 2 — Le cas d''affaires de l''IA agentique'
    'ch03-mapping-high-impact.md'         = 'Chapitre 3 — Cartographie des cas à fort impact'
    'ch04-roi-risk-readiness.md'          = 'Chapitre 4 — Évaluer ROI, risque et maturité'
    'ch05-protocols-interoperability.md'  = 'Chapitre 5 — Protocoles et interopérabilité'
    'ch06-orchestration-memory-tools.md'  = 'Chapitre 6 — Orchestration, mémoire, outils'
    'ch07-agentops.md'                    = 'Chapitre 7 — AgentOps : opérer des agents à longue durée d''exécution'
    'ch08-trustworthy-systems.md'         = 'Chapitre 8 — Construire des systèmes dignes de confiance'
    'ch09-agentic-security.md'            = 'Chapitre 9 — Sécurité agentique'
    'ch10-scaling-without-lockin.md'      = 'Chapitre 10 — Croître sans verrouillage'
    'ch11-redesigning-work.md'            = 'Chapitre 11 — Redessiner le travail, pas l''augmenter'
    'ch12-lessons-failed.md'              = 'Chapitre 12 — Leçons des 60 % qui ont échoué'
    'ch13-road-ahead.md'                  = 'Chapitre 13 — La route devant'
    'ch14-build-your-agentic-os.md'       = 'Chapitre 14 — Construire son OS agentique sur mesure (Claude Code)'
    'annexe-A-architecture-review.md'     = 'Annexe A — Liste de contrôle de revue d''architecture'
    'annexe-B-use-case-canvas.md'         = 'Annexe B — Use Case Canvas'
    'annexe-C-agentops-maturity.md'       = 'Annexe C — Modèle de maturité AgentOps (N1–N5)'
    'annexe-D-governance-raci.md'         = 'Annexe D — Gouvernance RACI agentique'
    'annexe-E-glossaire-lectures.md'      = 'Annexe E — Glossaire et lectures recommandées'
    'glossaire.md'                        = 'Glossaire principal'
    'references.md'                       = 'Bibliographie consolidée'
}

function Strip-Frontmatter {
    param([string]$content)
    # Remove leading YAML frontmatter (---\n ... \n---\n)
    $pattern = '^---\r?\n(?:.*\r?\n)*?---\r?\n'
    return [regex]::Replace($content, $pattern, '', 'Singleline')
}

function Strip-HtmlComments {
    param([string]$content)
    # Remove HTML comments (notes de recherche)
    return [regex]::Replace($content, '<!--[\s\S]*?-->', '', 'Singleline')
}

function Demote-Headers {
    param([string]$content)
    # Demote all # headers by one level: # -> ##, ## -> ###, etc. Up to ###### max.
    # Process from highest depth down to avoid double-demoting.
    $lines = $content -split "`r?`n"
    for ($i=0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match '^(#{1,5})(\s+)(.+)$') {
            $lines[$i] = '#' + $matches[1] + $matches[2] + $matches[3]
        }
    }
    return ($lines -join "`n")
}

# Build consolidated markdown
$build = Join-Path $root 'build'
if (-not (Test-Path $build)) { New-Item -ItemType Directory -Path $build | Out-Null }
$consolidated = Join-Path $build 'consolidated.md'
$sb = [System.Text.StringBuilder]::new()

foreach ($f in $files) {
    $path = Join-Path $root $f
    if (-not (Test-Path $path)) {
        Write-Warning "Fichier manquant : $f (sauté)"
        continue
    }
    $raw = Get-Content -Raw -Path $path -Encoding UTF8
    $clean = Strip-Frontmatter $raw
    $clean = Strip-HtmlComments $clean
    $clean = Demote-Headers $clean

    $title = $titles[$f]
    if ($title) {
        [void]$sb.AppendLine('')
        [void]$sb.AppendLine('# ' + $title)
        [void]$sb.AppendLine('')
    }
    [void]$sb.AppendLine($clean.Trim())
    [void]$sb.AppendLine('')
}

Set-Content -Path $consolidated -Value $sb.ToString() -Encoding UTF8
Write-Host "Consolidated markdown : $consolidated ($((Get-Item $consolidated).Length) bytes)"

# Convert to Typst body via pandoc
$body = Join-Path $build 'body.typ'
& pandoc $consolidated -o $body --from=gfm --to=typst --wrap=preserve
if ($LASTEXITCODE -ne 0) { throw "pandoc failed" }
Write-Host "Body Typst : $body ($((Get-Item $body).Length) bytes)"

# Compile final monograph
$out = Join-Path $root 'monograph.pdf'
& typst compile (Join-Path $root 'monograph.typ') $out
if ($LASTEXITCODE -ne 0) { throw "typst compile failed" }
Write-Host "PDF : $out ($((Get-Item $out).Length) bytes)"

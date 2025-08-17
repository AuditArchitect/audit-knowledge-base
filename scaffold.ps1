# Define root path
$root = "C:\Users\virta\Documents\Github\Project\audit-knowledge-base\docs\programs"

# Define folder structure
$structure = @{
    "iso9001" = @("overview.md", "procedures", "records", "audit-ready.md")
    "iso14001" = @("overview.md", "impact-assessment", "records", "audit-ready.md")
    "social-responsibility" = @("smeta.md", "wrap.md", "slcp.md")
    "security-sustainability" = @("c-tpat.md", "higg-fem.md", "facc.md")
}

# Create folders and files
foreach ($program in $structure.Keys) {
    $programPath = Join-Path $root $program
    New-Item -Path $programPath -ItemType Directory -Force | Out-Null

    foreach ($item in $structure[$program]) {
        $itemPath = Join-Path $programPath $item
        if ($item -like "*.md") {
            New-Item -Path $itemPath -ItemType File -Force | Out-Null
        } else {
            New-Item -Path $itemPath -ItemType Directory -Force | Out-Null
        }
    }
}

Write-Host "✅ Audit documentation scaffold created at $root"

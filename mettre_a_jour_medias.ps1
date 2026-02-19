# Script pour mettre à jour les références aux fichiers médias dans les fichiers HTML

$fichiersHTML = Get-ChildItem -Path . -Filter "*.html" -File

$extensionsMedias = @("\.mp4", "\.avif", "\.webp", "\.jpeg", "\.jpg", "\.png", "\.svg")

foreach ($fichier in $fichiersHTML) {
    $contenu = Get-Content $fichier.FullName -Raw -Encoding UTF8
    $modifie = $false
    
    # Mettre à jour les références src et href pour les médias
    foreach ($ext in $extensionsMedias) {
        # Pattern pour src="fichier.ext" ou src='fichier.ext'
        $pattern1 = "(src=[`"'])([^`"']+$ext)([`"'])"
        if ($contenu -match $pattern1) {
            $contenu = $contenu -replace $pattern1, {
                param($match)
                $fichierMedia = $match.Groups[2].Value
                # Vérifier si le fichier existe dans medias/
                if (Test-Path "medias\$fichierMedia") {
                    $match.Groups[1].Value + "medias/" + $fichierMedia + $match.Groups[3].Value
                } else {
                    $match.Value
                }
            }
            $modifie = $true
        }
        
        # Pattern pour <source src="fichier.ext">
        $pattern2 = "(<source\s+src=[`"'])([^`"']+$ext)([`"'])"
        if ($contenu -match $pattern2) {
            $contenu = $contenu -replace $pattern2, {
                param($match)
                $fichierMedia = $match.Groups[2].Value
                if (Test-Path "medias\$fichierMedia") {
                    $match.Groups[1].Value + "medias/" + $fichierMedia + $match.Groups[3].Value
                } else {
                    $match.Value
                }
            }
            $modifie = $true
        }
    }
    
    if ($modifie) {
        Set-Content -Path $fichier.FullName -Value $contenu -Encoding UTF8 -NoNewline
        Write-Host "  [OK] Mis a jour: $($fichier.Name)" -ForegroundColor Green
    }
}

Write-Host "`nTermine!" -ForegroundColor Green


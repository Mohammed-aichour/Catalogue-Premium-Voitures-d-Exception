# Script pour restaurer les fichiers HTML corrompus

$fichiers = @("page-audi.html", "page-bmw.html", "page-porsche.html", "page-porsche-test.html", "page-mercedes.html")

foreach ($fichier in $fichiers) {
    if (Test-Path $fichier) {
        $contenu = Get-Content $fichier -Raw -Encoding UTF8
        
        # Supprimer le code PowerShell corrompu et restaurer les références correctes
        $contenu = $contenu -replace '(?s)\s+param\(\$match\).*?else\s+\{\s+\$match\.Value\s+\}\s+', ' src="'
        
        # Mettre à jour les références aux médias
        $contenu = $contenu -replace 'src="(rs3-vd|bmw-vd|vd-porsche|mrc)\.mp4"', 'src="medias/$1.mp4"'
        $contenu = $contenu -replace 'src="(rs33|bmw-m2|m4|Z4|m5|x6m|18|19|20|21|24|img13|img14|img15|17|etron|rs6|rsq8|s5lim)\.(avif|webp|jpeg|jpg)"', 'src="medias/$1.$2"'
        
        Set-Content -Path $fichier -Value $contenu -Encoding UTF8 -NoNewline
        Write-Host "[OK] Restaure: $fichier" -ForegroundColor Green
    }
}

Write-Host "`nTermine!" -ForegroundColor Green


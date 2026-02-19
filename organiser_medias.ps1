# Script pour rassembler toutes les photos et vidéos dans un dossier

# Créer le dossier medias s'il n'existe pas
$dossierMedias = "medias"
if (-not (Test-Path $dossierMedias)) {
    New-Item -ItemType Directory -Path $dossierMedias | Out-Null
    Write-Host "Dossier '$dossierMedias' créé."
}

# Extensions d'images
$extensionsImages = @("*.jpg", "*.jpeg", "*.png", "*.gif", "*.webp", "*.avif", "*.svg", "*.bmp", "*.ico")

# Extensions de vidéos
$extensionsVideos = @("*.mp4", "*.avi", "*.mov", "*.webm", "*.mkv", "*.flv", "*.wmv", "*.ts", "*.m4v")

# Fonction pour déplacer les fichiers
function DeplacerFichiers {
    param($extensions, $type)
    
    foreach ($ext in $extensions) {
        $fichiers = Get-ChildItem -Path . -Filter $ext -File -ErrorAction SilentlyContinue
        
        foreach ($fichier in $fichiers) {
            # Ignorer les fichiers dans les sous-dossiers (comme bootstrap)
            if ($fichier.DirectoryName -eq (Get-Location).Path) {
                $destination = Join-Path $dossierMedias $fichier.Name
                
                # Gérer les conflits de noms
                if (Test-Path $destination) {
                    $nomSansExt = [System.IO.Path]::GetFileNameWithoutExtension($fichier.Name)
                    $extension = $fichier.Extension
                    $nouveauNom = "$nomSansExt`_$(Get-Date -Format 'yyyyMMddHHmmss')$extension"
                    $destination = Join-Path $dossierMedias $nouveauNom
                }
                
                Move-Item -Path $fichier.FullName -Destination $destination -Force
                Write-Host "Déplacé: $($fichier.Name) -> $dossierMedias\$($fichier.Name)"
            }
        }
    }
}

# Déplacer les images
Write-Host "`nDéplacement des images..."
DeplacerFichiers -extensions $extensionsImages -type "image"

# Déplacer les vidéos
Write-Host "`nDéplacement des vidéos..."
DeplacerFichiers -extensions $extensionsVideos -type "video"

Write-Host "`nTerminé! Tous les fichiers médias ont été déplacés dans le dossier '$dossierMedias'."


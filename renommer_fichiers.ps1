# Script pour renommer les fichiers HTML, CSS et JS selon leur fonctionnalité

Write-Host "Renommage des fichiers HTML..." -ForegroundColor Cyan

# Fichiers HTML
$renommagesHTML = @{
    "page-audi-html.html" = "page-audi.html"
    "page-bmw-html.html" = "page-bmw.html"
    "page-porsche-html.html" = "page-porsche.html"
    "page-merco.html" = "page-mercedes.html"
    "page-contact-html.html" = "page-contact.html"
    "page-reservation-html.html" = "page-reservation.html"
    "test.html" = "page-porsche-test.html"
    "test2.html" = "index-test.html"
    "js.html" = "page-test-js.html"
}

foreach ($ancien in $renommagesHTML.Keys) {
    $nouveau = $renommagesHTML[$ancien]
    if (Test-Path $ancien) {
        Rename-Item -Path $ancien -NewName $nouveau -Force
        Write-Host "  [OK] $ancien -> $nouveau" -ForegroundColor Green
    }
}

Write-Host "`nRenommage des fichiers CSS..." -ForegroundColor Cyan

# Fichiers CSS
$renommagesCSS = @{
    "login-css.css" = "styles-login.css"
    "collection-css.css" = "styles-collection.css"
    "page-audi-css.css" = "styles-audi.css"
    "page-bmw-css.css" = "styles-bmw.css"
    "page-porsche-css.css" = "styles-porsche.css"
    "page-merco-css.css" = "styles-mercedes.css"
    "test-css.css" = "styles-porsche-test.css"
    "test2-css.css" = "styles-index-test.css"
    "Projet_web_css.css" = "styles-main.css"
}

foreach ($ancien in $renommagesCSS.Keys) {
    $nouveau = $renommagesCSS[$ancien]
    if (Test-Path $ancien) {
        Rename-Item -Path $ancien -NewName $nouveau -Force
        Write-Host "  [OK] $ancien -> $nouveau" -ForegroundColor Green
    }
}

Write-Host "`nRenommage des fichiers JS..." -ForegroundColor Cyan

# Fichiers JS
$renommagesJS = @{
    "js-login.js" = "script-login.js"
    "js-test.js" = "script-test.js"
}

foreach ($ancien in $renommagesJS.Keys) {
    $nouveau = $renommagesJS[$ancien]
    if (Test-Path $ancien) {
        Rename-Item -Path $ancien -NewName $nouveau -Force
        Write-Host "  [OK] $ancien -> $nouveau" -ForegroundColor Green
    }
}

Write-Host "`nTermine! Tous les fichiers ont ete renommes." -ForegroundColor Green


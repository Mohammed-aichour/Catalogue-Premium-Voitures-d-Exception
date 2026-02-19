document.addEventListener('DOMContentLoaded', function() {
    const toggle = document.getElementById('reg-log');
    const body = document.body;
    // Cible le premier span dans le h6 pour changer le texte du mode
    const modeTextSpan = document.querySelector('.section h6 span:first-child'); 
    
    // --- Fonction pour appliquer le thème (Couleurs et Sauvegarde) ---
    function applyTheme(isDark) { 
        // isDark est VRAI lorsque la case est cochée (pour passer en mode sombre)
        if (isDark) {
            body.classList.remove('light-mode');
            body.classList.add('dark-mode');
            modeTextSpan.textContent = 'Dark Mode '; 
            localStorage.setItem('theme', 'dark');
        } else {
            body.classList.remove('dark-mode');
            body.classList.add('light-mode');
            modeTextSpan.textContent = 'Light Mode '; 
            localStorage.setItem('theme', 'light');
        }
    }

    // --- 1. Charger le thème sauvegardé ---
    const savedTheme = localStorage.getItem('theme');
    // Si le thème sauvegardé est 'dark', nous l'appliquons et cochons la case.
    if (savedTheme === 'dark') {
        applyTheme(true);
        toggle.checked = true; 
    } else {
        // Sinon, nous restons en mode clair (Light Mode).
        applyTheme(false); 
        toggle.checked = false; 
    }

    // --- 2. Écouter le changement sur la case à cocher ---
    toggle.addEventListener('change', function() {
        // isDark est vrai si la case est cochée
        const isDark = toggle.checked; 
        applyTheme(isDark);
    });
});
function direHello() {
            alert("Hello World");
        }
        function demanderNom() {
            let nom = prompt("Veuillez saisir votre nom :");
            
            if (nom) { // Vérifie si l'utilisateur n'a pas annulé ou laissé vide
                let confirmation = confirm("Confirmez-vous que votre nom est : " + nom + " ?");
                
                if (confirmation) {
                    alert("Bonjour " + nom);
                }
            }
        }
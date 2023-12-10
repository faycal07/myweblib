document.addEventListener("DOMContentLoaded", function () {
    // Récupérer la liste déroulante du rôle
    var roleDropdown = document.getElementById("Role");

    // Récupérer les éléments à masquer/afficher
    var payerField = document.getElementById("hide4");
    var universiteField = document.getElementById("hide2");
    var gradeField = document.getElementById("hide1");
    var anneeEtudeField = document.getElementById("hide3");

    // Récupérer la valeur sélectionnée au chargement de la page
    var selectedRole = roleDropdown.value;

    // Cacher tous les champs
    payerField.style.display = "none";
    universiteField.style.display = "none";
    gradeField.style.display = "none";
    anneeEtudeField.style.display = "none";

    // Afficher les champs appropriés en fonction du rôle sélectionné
    if (selectedRole === "Enseignant") {
        gradeField.style.display = "block";
    } else if (selectedRole === "Etudiant") {
        payerField.style.display = "block";
        anneeEtudeField.style.display = "block";
    } else if (selectedRole === "EtudiantExterne") {
        payerField.style.display = "block";
        universiteField.style.display = "block";
        anneeEtudeField.style.display = "block";
    }

    // Écouter les changements dans la liste déroulante
    roleDropdown.addEventListener("change", function () {
        // Récupérer la nouvelle valeur sélectionnée
        var newSelectedRole = roleDropdown.value;

        // Cacher tous les champs
        payerField.style.display = "none";
        universiteField.style.display = "none";
        gradeField.style.display = "none";
        anneeEtudeField.style.display = "none";

        // Afficher les champs appropriés en fonction du rôle sélectionné
        if (newSelectedRole === "Enseignant") {
            gradeField.style.display = "block";
        } else if (newSelectedRole === "Etudiant") {
            payerField.style.display = "block";
            anneeEtudeField.style.display = "block";
        } else if (newSelectedRole === "EtudiantExterne") {
            payerField.style.display = "block";
            universiteField.style.display = "block";
            anneeEtudeField.style.display = "block";
        }
    });
});

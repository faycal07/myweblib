<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@ page import="jakarta.servlet.http.HttpSession" %>
 



    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espace Gestionnaire</title>

   
   <link href="bib.css" type="text/css" rel="stylesheet">

  
    <link href="bootstrap-5.3.2-dist/css/bootstrap.min.css" type="text/css" rel="stylesheet">

    <link href="style.css" type="text/css" rel="stylesheet">
</head>

<body>
 <jsp:include page="nav.jsp" />
 <%
    String act = request.getParameter("act");
    String message = request.getParameter("message");
%>
<%
     session= request.getSession(false);
    if (session == null || session.getAttribute("role") == null) {
        // User is not logged in
%>
        <h1>Access Denied</h1>
        <p>You must log in to access this page.</p>
<%
    } else {
        String role = (String) session.getAttribute("role");
        if ("Gestionnaire".equals(role)) {
        	
        	String nom = (String) session.getAttribute("nom");
    	    String prenom = (String) session.getAttribute("prenom");
            // User is logged in and has the GESTIONNAIRE role
%>
 
 <div class="container-fluid m-0 p-0 mt-5 pt-2">
 
    <header class="headerq">
        <a href="#" class="logoq">Espace Gestionnaire</a>
        <nav class="navbarq">
            <div class="user-infoq">
               <span class="nameq"><%= nom %></span>
                <span class="nameq"><%= prenom %></span>
               
                <div class="photo-iconq"></div>
            </div>
        </nav>
    </header>

   <div class="containerq ">
        <div class="sidebarq ">
            <h2>Gestionnaire</h2>
            <a href="#" onclick="showPage('inscription')">Gestion des Inscriptions</a>
            <a href="#" onclick="showPage('penalisation')">Gestion des Pénalisations</a>
          
            <a href="Logout">Se Déconnecter</a>
        </div>

        <div class="contentq" id="inscriptionPage">
            
            <h1>Gestion des Inscriptions</h1>
            
            
            <form class="formq" id="inscriptionForm" action="Inscription" method="post">
            
            <label for="Role">Role:</label>
<select id="Role" name="Role"  class="select" required >
    <option value="Enseignant" selected>Enseignant</option>
    <option value="Etudiant">Etudiant</option>
    <option value="EtudiantExterne">Etudiant externe</option>
     <option value="Bibliothequaire">Bibliothèquaire</option>
      <option value="Gestionnaire">Gestionnaire</option>
</select>
            
    

    <label for="Nom">Nom:</label>
    <input type="text" id="Nom" name="Nom" required>

    <label for="Prenom">Prenom:</label>
    <input type="text" id="Prenom" name="Prenom" required>

    <label for="DateNaiss">Date de Naissance:</label>
    <input type="date" id="DateNaiss" name="DateNaiss" required>

  

    <label for="Username">Username:</label>
    <input type="text" id="Username" name="Username" required>

    <label for="Password">Password:</label>
    <input type="password" id="Password" name="Password" required>


    <label for="Matricule">Matricule:</label>
    <input type="text" id="Matricule" name="Matricule" required>
   

    <span id="hide1">

    <label for="Grade">Grade:</label>
    <input type="text" id="Grade" name="Grade" required>
    
   </span>
   
   
   <span id="hide2">
     <label for="Universite">Universite:</label>
    <input type="text" id="Universite" name="Universite" required>
   </span>

<span id="hide3">


 <label for="AnneeEtude">Annee d'Etude:</label>

    
   <select id="AnneeEtude" name="AnneeEtude"  class="select" required>
   <option value="Premiere Annee(ou L1)" selected>Premiere Annee(ou L1)</option>
<option value="Deuxieme Annee(ou L2)">Deuxieme Annee(ou L2)</option>
<option value="Troisieme Annee(ou L3)">Troisieme Annee(ou L3)</option>
<option value="Quatrieme Annee(ou M1)">Quatrieme Annee(ou M1)</option>
<option value="Cinqieme Annee(ou M2)">Cinqieme Annee(ou M2)</option>
<option value="Sixieme Annee(ou Doctorat)">Sixieme Annee(ou Doctorat)</option>
<option value="Septieme Annee(ou Doctorat)">Septieme Annee(ou Doctorat)</option>

      
        
</select>
</span>


   <span id="hide4">
   <label for="Payer">Payer:</label>
    <input type="checkbox" id="Payer" class="w-25" name="Payer" required>
   </span>

    
                
   <input type="hidden" name="action" id="action" value="" />

    <div>
        <button class="buttonq" type="button" onclick="setAction('add')">Ajouter Adhérent</button>
        <button class="buttonq" type="button" onclick="setAction('update')">Modifier Adhérent</button>
        <button class="buttonq" type="button" onclick="setAction('delete')">Supprimer Adhérent</button>
    </div>
            </form>

            <!-- Table to Display List of Catalogues -->
            <h2>List des Adhérents</h2>
            <table id="userTable">
					<thead>
                    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prenom</th>
        <th>Date de Naissance</th>
        <th>Universite</th>
        <th>Username</th>
        
        <th>Role</th>
        <th>Matricule</th>
        <th>Date de Penalisation</th>
        <th>Grade</th>
        <th>Annee d'Etude</th>
        <th>Payer</th>
    </tr>
                </thead>
                <tbody>
                    <!-- user items will be dynamically added here -->
                    
                        <tr>
        <td><?php echo $id; ?></td>
        <td><?php echo $nom; ?></td>
        <td><?php echo $prenom; ?></td>
        <td><?php echo $dateNaiss; ?></td>
        <td><?php echo $universite; ?></td>
        <td><?php echo $username; ?></td>
       
        <td><?php echo $role; ?></td>
        <td><?php echo $matricule; ?></td>
        <td><?php echo $dateP; ?></td>
        <td><?php echo $grade; ?></td>
        <td><?php echo $anneeEtude; ?></td>
        <td><?php echo $payer; ?></td>
    </tr>
                </tbody>
            </table>
        </div>

       
       
        <div class="contentq" id="penalisationPage" style="display: none;">
            <h1>Pénalisation des Adhérents</h1>
            <form class="formq" id="penalisationForm">
                    
                            <table id="penalisationTable">
					<thead>
                    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prenom</th>
        <th>Date de Naissance</th>
        <th>Universite</th>
        <th>Username</th>
        
        <th>Role</th>
        <th>Matricule</th>
        <th>Date de Penalisation</th>
        <th>Action</th>
    
       
    </tr>
                </thead>
                <tbody>
                    <!-- user items will be dynamically added here -->
                    
                        <tr>
        <td><?php echo $id; ?></td>
        <td><?php echo $nom; ?></td>
        <td><?php echo $prenom; ?></td>
        <td><?php echo $dateNaiss; ?></td>
        <td><?php echo $universite; ?></td>
        <td><?php echo $username; ?></td>
       
        <td><?php echo $role; ?></td>
        <td><?php echo $matricule; ?></td>
        <td><?php echo $dateP; ?></td>
        <td><button class="buttonq" type="button">Pénaliser</button></td>
       
    </tr>
                </tbody>
            </table>
                    
                    
                             
            </form>

            
        </div>

        
    </div>
    
    
    
    
    
    </div>
<%
        } else {
            // User is logged in but does not have the GESTIONNAIRE role
%>
            <h1>Access Denied</h1>
            <p>You do not have permission to access this page.</p>
<%
        }
    }
%>
    
    
  <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="gestio.js"></script>

    <script>

    function setAction(action) {
        document.getElementById("action").value = action;
        document.getElementById("inscriptionForm").submit();
    }

        function showPage(pageId) {
            // Hide all content sections
            document.querySelectorAll('.contentq').forEach(function (content) {
                content.style.display = 'none';
            });

            // Show the selected content section
            document.getElementById(pageId + 'Page').style.display = 'block';
        }
        
        
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
        
        <% if ("success".equals(act)) { %>
        alert("you are logged in");
    <% } else if ("error".equals(act)) { %>
        alert("Erreur: <%= message %>");
    <% } %>
        
        
    </script>
    
<script  src="bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
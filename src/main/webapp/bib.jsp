<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espace Bibliothècaire</title>
    <link rel="stylesheet" type="text/css" href="bib.css">
    <link href="bootstrap-5.3.2-dist/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="style.css" type="text/css" rel="stylesheet">
</head>

<body>
 <jsp:include page="nav.jsp" />
 
 
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
        if ("Bibliothequaire".equals(role)) {
        	
        	
        	  String nom = (String) session.getAttribute("nom");
        	    String prenom = (String) session.getAttribute("prenom");
            // User is logged in and has the GESTIONNAIRE role
%>
 
 <div class="container-fluid m-0 p-0 mt-5 pt-2">
 
    <header class="headerq">
        <a href="#" class="logoq">Espace Bibliothècaire</a>
        <nav class="navbarq">
            <div class="user-infoq">
               <span class="nameq"><%= nom %></span>
                <span class="nameq"><%= prenom %></span>
                <div class="photo-iconq"></div>
                
                
                
            </div>
        </nav>
    </header>

    <div class="containerq">
        <div class="sidebarq">
            <h2>Bibliothècaire</h2>
            <a href="#" onclick="showPage('catalogue')">Gestion des Ouvrages</a>
              <a href="#" onclick="showPage('exemplaire')">Gestion des Exemplaires</a>
                <a href="#" onclick="showPage('rayon')">Gestion des Rayons</a>
            <a href="#" onclick="showPage('ouvrage')">Acquisition Des Ouvrages</a>
            <a href="#" onclick="showPage('gemprunt')">Gestion des Emprunts</a>
            <a href="#" onclick="showPage('remprunt')">Restitution Des Emprunts</a>
            <a href="Logout">Se Déconnecter</a>
        </div>

        <div class="contentq" id="cataloguePage">
            <h1>Gestion d'ouvrage</h1>
            <form class="formq" id="catalogueForm">
                <label for="catalogueID">ID:</label>
                <input type="text" id="catalogueID" name="catalogueID" required>
                <label for="catalogueName">ISBN:</label>
                <input type="text" id="catalogueName" name="catalogueName" required>

                <label for="ouvrageTitre">Titre:</label>
                <input type="text" id="ouvrageTitre" name="ouvrageTitre" required>
                     <label for="ouvrageAuteur">Auteur:</label>
                <input type="text" id="ouvrageAuteur" name="ouvrageAuteur" required>

                <button class="buttonq" type="button">Ajouter Ouvrage</button>
                <button class="buttonq" type="button">Modifier Ouvrage</button>
                <button class="buttonq" type="button">Supprimer Ouvrage</button>
            </form>

            <!-- Table to Display List of Catalogues -->
            <h2>List des Ouvrages</h2>
            <table id="catalogueTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>ISBN</th>
                        <th>Titre</th>
                        <th>Auteur</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Catalogue items will be dynamically added here -->
                </tbody>
            </table>
        </div>
<!--  -->





<!--  -->   


     <div class="contentq" id="ouvragePage" style="display: none;">
            <h1>acquisition des ouvrages</h1>
            <form class="formq" id="ouvrageForm">
                <label for="ouvrageID">ISBN:</label>
                <input type="text" id="ouvrageID" name="ouvrageID" required>
                <label for="ouvrageName">Titre:</label>
                <input type="text" id="ouvrageName" name="ouvrageName" required>
                <label for="idetu_o">ID Auteur:</label>
                <input type="text" id="idetu_o" name="idetu_o" required>
                <button class="buttonq" type="button">Ajouter ouvrage</button>
                <button class="buttonq" type="button">Modifer ouvrage</button>
                <button class="buttonq" type="button">Supprimer ouvrage</button>
            </form>

            <!-- Table to Display List of "Ouvrages" -->
            <h2>Liste des Ouvrages</h2>
            <table id="ouvrageTable">
                <thead>
                    <tr>
                        <th>ISBN</th>
                        <th>Titre</th>
                        <th>ID Auteur</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- "Ouvrages" items will be dynamically added here -->
                </tbody>
            </table>
        </div>

        <div class="contentq" id="gempruntPage" style="display: none;">
            <h1>gestion des emprunts</h1>
            <form class="formq" id="gempruntForm">
                <label for="idetu_ge">ID Etudiant:</label>
                <input type="text" id="idetu_ge" name="idetu_ge" required>
                <label for="idouv_ge">ID Ouvrage:</label>
                <input type="text" id="idouv_ge" name="idouv_ge" required>
                <label for="datep">Date Prise:</label>
                <input type="date" id="datep" name="datep" required>
                <label for="dater">Date Restitution:</label>
                <input type="date" id="dater" name="dater" required>


                <button class="buttonq" type="button">Ajouter emprunt</button>
                <button class="buttonq" type="button">Modifier emprunt</button>
                <button class="buttonq" type="button">Supprimer emprunt</button>
            </form>

            <!-- Table to Display List of "Emprunt" -->
            <h2>List des Emprunts</h2>
            <table id="gempruntTable">
                <thead>
                    <tr>
                        <th>ID Etudiant</th>
                        <th>Nom Etudiant</th>
                        <th>Prenom Etudiant</th>
                        <th>Date Prise</th>
                        <th>Date Restitution</th>
                        <th>ID Ouvrage</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- "Emprunt" items will be dynamically added here -->
                </tbody>
            </table>
        </div>

        <div class="contentq" id="rempruntPage" style="display: none;">
            <h1>restitution des emprunts</h1>
            <form class="formq" id="rempruntForm">
                <label for="idetu_re">ID Etudiant:</label>
                <input type="text" id="idetu_re" name="idetu_re" required>
                <label for="idouv_re">ID Ouvrage:</label>
                <input type="text" id="idouv_re" name="idouv_re" required>

                <button class="buttonq" type="button">Restitue un Ouvrage</button>
              
            </form>

            <!-- Table to Display List of "Emprunt" -->
            <h2>List des Emprunts</h2>
            <table id="rempruntTable">
                <thead>
                    <tr>
                        <th>ID Etudiant</th>
                        <th>Nom Etudiant</th>
                        <th>Prenom Etudiant</th>
                        <th>Date Prise</th>
                        <th>Date Restitution</th>
                        <th>ID Ouvrage</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- "Emprunt" items will be dynamically added here -->
                </tbody>
            </table>
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
    

    <script>
        function showPage(pageId) {
            // Hide all content sections
            document.querySelectorAll('.contentq').forEach(function (content) {
                content.style.display = 'none';
            });

            // Show the selected content section
            document.getElementById(pageId + 'Page').style.display = 'block';
        }
    </script>
    
<script  src="bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
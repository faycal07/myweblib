<%@ page import="jakarta.servlet.http.HttpSession" %>

<div class="container-fluid px-0 fixed-top ">
<nav class="navbar navbar-dark bg-dark navbar-expand-lg" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand pe-5" href="home.jsp"> 
                 <img class="img-fluid" src="https://picsum.photos/30/30" alt="img">
            </a>
         
        
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse ps-5" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Livres</a>
                    </li>
                  
                     <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#">A propos</a>
                    </li>
                     </ul>
                     
                      <form class="d-flex ms-5" role="search">
                    <input class="form-control me-3 rounded-4" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-warning rounded-5" type="submit">Search</button>
                </form>
                     
              
                <div  >
<%
 session = request.getSession(false);
if (session == null || session.getAttribute("userId") == null) {
    // User is not logged in
%>
    <ul class="navbar-nav ps-5">
        <li class="nav-item px-3 border rounded-5 login">
            <a class="nav-link" href="login.jsp">Connecter</a>
        </li>
    </ul>
<%
} else {
    // User is logged in
%>
    <ul class="navbar-nav ps-5">
        <li class="nav-item px-3 border rounded-5 logout">
            <a class="nav-link" href="Logout">Logout</a>
        </li>
    </ul>
<%
}
%>
</div>
                
               
            </div>
        </div>
    </nav>


</div>


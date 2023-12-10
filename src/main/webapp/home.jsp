<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link href="bootstrap-5.3.2-dist/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>





  <jsp:include page="nav.jsp" />








  <!-- Featured Section -->
    <div class="container border p-5 bg-secondary-subtle rounded-5" style="margin-top: 75px">
        <div class="row">
            <div class="col-lg-8 mt-5">
                <h1 class="p-5 ">Welcome to the University Library</h1>
                <p class="lead p-5">Explore our vast collection of books, journals, and digital resources.</p>
                
                
              <div class="text-center">
                       <!--  <a class="btn btn-warning rounded-5" href="inscrire.jsp">Inscrire</a> -->
               
                        <a class="btn btn-secondary rounded-5" href="login.jsp">Connecter</a></div>
            
                
               
                   
              
              
                
            </div>
            <div class="col-lg-4 ">
                <img src="dana-ward-18SA3cMtep8-unsplash.jpg" class="img-fluid rounded" alt="Library Image">
            </div>
        </div>
    </div>

    <!-- Sample Content -->
    <div class="container mt-4">
        <h2 class="text-center text-decoration-underline px-5 my-5 ">Recent Arrivals</h2>
        <div class="row">
            <!-- Sample Book Cards -->
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="book1.jpg" class="card-img-top" alt="Book 1">
                    <div class="card-body">
                        <h5 class="card-title">Book Title 1</h5>
                        <p class="card-text">Author: Author Name</p>
                        <a href="#" class="btn btn-primary">Details</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="book2.jpg" class="card-img-top" alt="Book 2">
                    <div class="card-body">
                        <h5 class="card-title">Book Title 2</h5>
                        <p class="card-text">Author: Author Name</p>
                        <a href="#" class="btn btn-primary">Details</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="book3.jpg" class="card-img-top" alt="Book 3">
                    <div class="card-body">
                        <h5 class="card-title">Book Title 3</h5>
                        <p class="card-text">Author: Author Name</p>
                        <a href="#" class="btn btn-primary">Details</a>
                    </div>
                </div>
            </div>
        </div>
    </div>









  <jsp:include page="footer.jsp" />


<script  src="bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
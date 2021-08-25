<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
    <head>
        <title>UGEAFI AVEC</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body >
        <h2 align="center">UGEAFI AVEC</h2>
        <h2 align="center">PAGE DES RAPPORTS</h2>
        <section class="ftco-section">

            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container"> 

                    <div class="collapse navbar-collapse" id="ftco-nav" align="center" >
                        <ul class="navbar-nav mr-auto"> 

                            <li class="nav-item"><a href="index.html" class="nav-link">ACCUEIL</a></li>
                            <li class="nav-item"><a href="Rapport_Contribution.jsp" class="nav-link">RAPPORT DE CONTRIBUTIONS</a></li>
                            <li class="nav-item"><a href="Raport_amande.jsp" class="nav-link">RAPPORT DES AMANDES</a></li>
 <li class="nav-item"><a href="Raport_Credit.jsp" class="nav-link">RAPPORT DE CREDIT</a></li>

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
             <h2 style="color: red " align='center'>QUEL TYPE DE RAPPORT VOULEZ-VOUS ?<h2>
           <table border="1"align="center">
            <thead>
                <tr>
                   
                     
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td ><b><a href="Rapport_Contribution.jsp">RAPPORT DE CONTRIBUTIONS</a></b></td>
                    
                </tr>
                <tr>
                    <td><b><a href="Raport_amande.jsp">RAPPORT DES AMANDES</a></b></td>
                    
                </tr>
                <tr>
                    <td><b><a href="Raport_Credit.jsp">RAPPORT DE CREDIT</a></b></td>
                    
                </tr>
               
            </tbody>
        </table>


    </body>
</html>


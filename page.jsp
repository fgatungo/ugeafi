<%-- 
    Document   : page
    Created on : Aug 4, 2021, 7:19:12 PM
    Author     : GATUNGO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <title>UGEAFI AVEC</title>
    <HEAD><TITLE>Display file upload form to the user</TITLE> 
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css"> 
    </HEAD>
    <BODY>
        
        <h2 align="center">UGEAFI AVEC</h2>
        <section class="ftco-section">

            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container"> 

                    <div class="collapse navbar-collapse" id="ftco-nav" align="center" >
                        <ul class="navbar-nav mr-auto"> 

                            <li class="nav-item"><a href="index.html" class="nav-link">ACCUEIL</a></li>
                            <li class="nav-item"><a href="contribution.jsp" class="nav-link">CONTRIBUTION</a></li>                            
                            <li class="nav-item"><a href="Beneficiaire.jsp" class="nav-link">NOUVELLE BENEFICIAIRES</a></li>
                            <li class="nav-item"><a href="Data.jsp" class="nav-link">LISTE DES BENEFICIAIRES</a></li>
                            <li class="nav-item"><a href="New_Credit.jsp" class="nav-link">CREDIT</a></li>
                            <li class="nav-item"><a href="Credit_List.jsp" class="nav-link">VOIR LES CREDITS</a></li>
                            <li class="nav-item"><a href="zone.jsp" class="nav-link">NOUVELLE ZONE</a></li>

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
        </section> 
         
        
        <FORM ENCTYPE="multipart/form-data" ACTION="upload.jsp" METHOD=POST>
            <br><br><br>
            <center>

              
                <table border="0" bgcolor=#ccFDDEE>
                    <tr>
                    <center>
                        <td colspan="2" align="center"><B>CHOISISSEZ SA PLOFILE</B><center></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"> </td>
                            </tr>
                            <tr>
                                <td><b>Choisisser une photo</b></td>
                                <td><INPUT NAME="file" TYPE="file"></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"> </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><input type="submit" value="ENREGISTRE LE PROFILE"> </td>
                            </tr>
                            <table>
                        </center>
                        </FORM>
                        </BODY>
                        </HTML>

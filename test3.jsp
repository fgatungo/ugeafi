<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Website menu 02</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body >
        <h2 align="center">UGEAFI AVEC</h2>
        <section class="ftco-section">

            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container"> 

                    <div class="collapse navbar-collapse" id="ftco-nav" align="center" >
                        <ul class="navbar-nav mr-auto"> 

                            <li class="nav-item"><a href="index.html" class="nav-link">ACCUEIL</a></li>
                           
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->


        </section>
        
           
        <form action="saveBeneficiairies.jsp">
           
            <%
            String avec=request.getParameter("avec");
            String zone=request.getParameter("zone");
             int sawa=(Integer)session.getAttribute("avec_Id");
             
            %> 
            
            <table border="1" align="center">
                <tbody>
                    <tr>
                        <td>ZONE</td>
                        <td><input type="text" name="zone" value="<%=zone%>" readonly="" style="background: #ff3333 " /></td>
                           
                    </tr>
                     <tr>
                        <td>AVEC</td>
                        <td> <input type="text" name="avec" value="<%=avec%>" readonly="" style="background: #ff0000 " /></td>
                    </tr>
                     <tr>
                        <td></td>
                        <td><input type="hidden" name="sawa" value="<%=sawa %>" required="" /></td>

                    </tr>
                    <tr>
                        <td>NOM</td>
                        <td><input type="text" name="name" value="" required="" /></td>

                    </tr>
                    <tr>
                        <td>PRENOM</td>
                        <td><input type="text" name="lname" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>FONCTION</td>
                        <td><input type="text" name="travail" value=""  required="Vouz dever entre la Fonction" /></td>
                    </tr> 
                    <tr>
                        <td>CONTACT</td>
                        <td><input type="number" name="phone" value="" minlength="0" maxlength="10"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Engregistre" /></td>
                    </tr>
                </tbody>
            </table> 
        </form>

    </body> 

    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</html>


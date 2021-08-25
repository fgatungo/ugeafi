<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        <section class="ftco-section">

            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container"> 

                    <div class="collapse navbar-collapse" id="ftco-nav" align="center" >
                        <ul class="navbar-nav mr-auto"> 

                            <li class="nav-item"><a href="index.html" class="nav-link">ACCUEIL</a></li>
                            <li class="nav-item"><a href="contribution.jsp" class="nav-link">CONTRIBUTION</a></li>                            
                            <li class="nav-item"><a href="Beneficiaire.jsp" class="nav-link">NOUVELLE BENEFICIAIRES</a></li>
                            <li class="nav-item"><a href="Data.jsp" class="nav-link">LISTE DES BENEFICIAIRES</a></li>

                            <li class="nav-item"><a href="Credit_List.jsp" class="nav-link">VOIR LES CREDITS</a></li>
                            <li class="nav-item"><a href="zone.jsp" class="nav-link">NOUVELLE ZONE</a></li>

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
 
        </section> 
        <form action="Pay_Amande_Go.jsp" method="POST">
            <%
   
                       int idl=Integer.parseInt(request.getParameter("idf"));
                try
                 {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                Statement st=conn.createStatement();
                String sql=" SELECT Own_Id, Nom, Amande FROM amande WHERE Id='"+idl+"'";
                //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                ResultSet rs=st.executeQuery(sql);
                while(rs.next()){ 
             String OWName=rs.getString(2);
             int ssCode=rs.getInt(1);
             int mon=rs.getInt(3);
            %>
            <table border="0" align="center">

                <h4 align="center" style="color: red">ENREGISTRE UNE AMANDE / PENALITE</h4>
                <tbody>
                    <tr>
                      
                        <td><input type="hidden" name="idss" value="<%=idl %>" readonly="" style="background: #ff6633"/></td>

                    </tr>
                    <tr>
                       
                        <td><input type="hidden" name="codesss" value="<%=ssCode%>" readonly="" style="background:#ff6633"/></td>

                    </tr>
                    <tr>
                        <td>NOM DU CLIENT</td>
                        <td><input type="text" name="Ownersss" value="<%=OWName%>" readonly="" style="background: #ff6633"/></td>

                    </tr>
                    <tr>
                        <td>MONTANT A PAYEE</td>
                        <td><input type="text" name="montantsss" value="<%=mon %>" readonly="" style="background: #ff6633"/></td>

                    </tr>


                    <%
                           }
                   }catch(Exception e){
                   System.out.print(e);
                            
                   }     

                    %> 
                    
                    <tr>
                        <td></td>
                        <td><input type="submit" value="CONFIRMER" /></td>
                    </tr>
                </tbody>
            </table>
        </form>

    </body> 


</html>


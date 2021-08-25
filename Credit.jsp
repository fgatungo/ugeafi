<%-- 
    Document   : Data
    Created on : Aug 5, 2021, 2:06:22 PM
    Author     : GATUNGO
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>UGEAFI AVEC</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/style.css">

    <body >
        <h2 align="center">UGEAFI AVEC</h2>
        <section class="ftco-section">

            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container"> 

                    <div class="collapse navbar-collapse" id="ftco-nav" align="center" >
                        <ul class="navbar-nav mr-auto"> 

                            <li class="nav-item"><a href="index.html" class="nav-link">ACCUEIL</a></li>
                            <li class="nav-item"><a href="Credit_List.jsp" class="nav-link">VOIR LES CREDITS</a></li>

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
        </section>
        <form action="Credit.jsp" method="get">
            <table border="0" align="center">
                <thead>
                <h5 align="center" style="color: red"><b>ENTRE LE NOM,CODE OU LE ZONE DU BENEFICIAIRE POUR LUI CREDITEE</b></h5>
                <tr>
                    <th colspan="2"></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td colspan="4"><input type="text" name="search" value="" placeholder="Entre un Nom" /></td>
                        <td><input type="submit" value="RECHERCHER" onkeypress="" /></td>
                    </tr>

                </tbody>
            </table>
        </form>
    
        <table border="1" align="center">
            <thead>
                <tr>
                    <th>CODE</th>
                    <th>PRENOM ET PRENOM</th>
                    <th>ZONE</th>
                    <th>OPTION</th>


                </tr>
            </thead>
            <tbody> 
                <%     
                    String g=request.getParameter("search"); 
                    //String g="mi";
                try
                 {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                Statement st=conn.createStatement();
                String sql="SELECT create_beneficiaire.Id, create_beneficiaire.Name, create_beneficiaire.Lname, zone.Zone_Name FROM create_beneficiaire inner JOIN zone on create_beneficiaire.Zone_Id=zone.Zone_Id where create_beneficiaire.Name='"+g+"' or  create_beneficiaire.Lname='"+g+"' or zone.Zone_Name='"+g+"' or create_beneficiaire.Id='"+g+"'";        
                //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                ResultSet rs=st.executeQuery(sql);
                while(rs.next()){ 
                   
                %>

                <tr> 
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) +" "+ rs.getString(3)%></td>
                   <td><%= rs.getString(4) %></td>  
                    <td><a href="New_Credit.jsp?id=<%=rs.getInt(1)%>"/>CREDITEE </td></tr>


                <% 
                                      
                    }
            }catch(Exception e){
            System.out.print(e);
                            
            }
 
    
                %>
            </tbody>
        </table>


    </body> 
</html>

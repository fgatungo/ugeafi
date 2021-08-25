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
                             <li class="nav-item"><a href="test1.jsp" class="nav-link">NOUVELLE BENEFICIAIRES</a></li>
                             </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
        </section>
        <form action="Data.jsp" method="get">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                     <tr>
                        <td></td>
                        <td colspan="4" color='red'>Entre le nom du beneficiaire, </td>
                        <td>ou son code, ou le code de la zone</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="4"><input type="text" name="search" value="" placeholder="Rechercher" /></td>
                        <td><input type="submit" value="RECHERCHER" onkeypress="" /></td>
                    </tr>

                </tbody>
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <table border="1" align="center">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Lname</th>
                        <th>Contact</th>
                        <th>Travail</th>
                        <th>Zone</th>
                        <th>Voir Profile</th>
                        <th>Update Profile</th>
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
                   // String sql="SELECT  Id,Name, Lname, Contact, Travail,Zone_Id FROM create_beneficiaire where id ='"+g+"' or Name='"+g+"' or Lname='"+g+"' or zone='"+g+"'";
                    //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                    String sql="SELECT create_beneficiaire.Id,create_beneficiaire.Name, create_beneficiaire.Lname, create_beneficiaire.Contact, create_beneficiaire.Travail,zone.Zone_Name FROM create_beneficiaire LEFT JOIN zone on create_beneficiaire.Zone_Id=zone.Zone_Id where create_beneficiaire.Id ='"+g+"' or create_beneficiaire.Name='"+g+"' or create_beneficiaire.Lname='"+g+"' or zone.Zone_Name='"+g+"' ";
                   
                    ResultSet rs=st.executeQuery(sql);
                    while(rs.next()){  
                    %>

                    <tr> <td><%= rs.getInt(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td><%= rs.getString(6) %></td>
                        <td><a href="retrieve_image.jsp?id=<%=rs.getInt(1)%>"/> VOIR SA PROFILE </td>
                        <td><a href="page.jsp?id=<%=rs.getInt(1)%>"/> CHANGE LE PROFILE </td></tr> 

                    <% 
                    
                        }
                }catch(Exception e){
                System.out.print(e);
                            
                }
 
    
                    %>
                </tbody>
            </table>

            &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;

        </form>

    </body>
</html>

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
                            <li class="nav-item"><a href="Credit.jsp" class="nav-link">NOUVELLE CREDIT</a></li>
                           
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
        </section>
       <!--
        <form action="Credit_List.jsp" method="get">
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
                        <td colspan="4"><input type="text" name="search" value="" placeholder="Entre un Nom" /></td>
                        <td><input type="submit" value="RECHERCHER" onkeypress="" /></td>
                    </tr>

                </tbody>
            </table> 
-->
            <h4 style="color: red" align="center">LISTE DE TOUS LES CREDIT IMPAYE DES TOUS LES ZONES!</h4>

            <table border="1" align="center">
                <thead>
                    <tr>
                        
                        <th>NOM ET PRENOM</th>
                        <th>DATE DU CREDIT</th>
                        <th>MONTANT</th>
                        <th>INTERET</th>
                        <th>DATE DE PAIEMENT</th>
                        <th>STATUS</th>
                        <th>OPTION</th>
                    </tr>
                </thead>
                <tbody> 
                    <%     
                      
                    try
                     {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                    Statement st=conn.createStatement();
                    String sql="SELECT  `Id`,`Nom`, `Credit_Date`, `Credit_Own_Id`, `Montant`, `Interet`, `Pay_Date`, `status` from credit where status='IMPAYEE'";
                    //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                    ResultSet rs=st.executeQuery(sql);
                            
                    while(rs.next()){  
                    %>

                    <tr>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getInt(5) %></td>
                        <td><%= rs.getString(6) %></td>
                        <td><%= rs.getString(7) %></td>
                        <td><%= rs.getString(8) %></td>
                        <td><a href="Pay_Credit.jsp?id=<%=rs.getInt(1)%>"/> PAYE CE CREDIT </td>
                        <%                          }
                                      }catch(Exception e){
                                      System.out.print(e);
                            
                                      }
 
    
                        %>
                </tbody>
            </table>
                 </form>

            <%
           
             try
                      {
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                     Statement sts=conn.createStatement();
                    String some="SELECT sum(Montant), sum(Interet) from credit where STATUS='IMPAYEE'";
                     //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                     ResultSet rss=sts.executeQuery(some);
                     //ResultSet rss=st.executeQuery(some);
               
                            
                     while(rss.next()){  
            %>
            <table border='1' align='center' style="background: coral">
                <tr> <td>MONTANT TOTAL</td> <td><%= rss.getInt(1) %></td></tr>
                <tr><td>INTERET TOTAL</td><td><%= rss.getInt(2) %></td></tr>
            </table
            <% 
           
           
                                  }
                          }catch(Exception e){
                          System.out.print(e);
                            
                          }
           
            %>

       

    </body>
</html>

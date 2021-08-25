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
                            <li class="nav-item"><a href="Credit_Impaye_Par_Zone.jsp" class="nav-link">CREDIT IMPAYEE PAR ZONE</a></li>

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
        </section>
        <form action="Credit_Impaye_Par_Zone.jsp" method="get">
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
                        <td>SECTIONEE UNE ZONE</td>
                        <td colspan="4">
                            <select name="search" id="search">
                                <option>-SELECTION-</option>
                                <option>TOUS</option>
                                <%     
                                 try
                      {
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                      Statement st=conn.createStatement();
                      String sql="select Zone_Name from zone";
                      ResultSet rs=st.executeQuery(sql);
                      while(rs.next()){
                                %>
                                <option><%= rs.getString(1) %></option>

                                <%
                                   
                            }

                            }catch(Exception e){
                            System.out.print(e);
                            
                            } 
                                %>     

                                <option></option>
                            </select>



                        </td>

                    <tr>
                        <td></td>
                        <td colspan="2"><input type="submit" value="RECHERCHER" onkeypress="" /></td>
                    </tr>

                </tbody>
            </table> 

            <h4 style="color: red" align="center">CREDITS IMPAYE!</h4>

            <table border="1" align="center">
                <thead>
                    <tr>
                        <th>CODE</th>
                        <th>NOM ET PRENOM</th>
                        <th>DATE DU CREDIT</th>
                        <th>MONTANT</th>
                        <th>MONTANT</th>
                        <th>MONTANT</th>
                        <th>MONTANT</th>
                        <th>MONTANT</th>
                        <th>MONTANT</th>
                        <th>INTERET</th>
                        <th>DATE DE PAIEMENT</th>
                        <th>RAPPORT</th>
                    </tr>
                </thead>
                <tbody> 
                    <%     
                      //  String g=request.getParameter("search");
                      String g="Minembwe";
                        if(g.equals("TOUS")){
                            try
                     {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                    Statement st=conn.createStatement();
                    String sql="SELECT Id,Credit_Own_Id, Nom,Credit_Date,Montant, Interet, Pay_Date FROM credit where status='0'";
                    //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                    ResultSet rs=st.executeQuery(sql);
                    while(rs.next()){  
                    %>

                    <tr> <td><%= rs.getInt(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td><%= rs.getString(6) %></td>
                        <td><%= rs.getString(8) %></td>
                        <td><%= rs.getString(9) %></td>
                        <td><%= rs.getString(10) %></td>
                        <td><%= rs.getString(11) %></td>
                        <td><a href="Pay_Credit.jsp?id=<%=rs.getInt(1)%>"/> PAYE CE CREDIT </td>
                        <% 
                                              }
                                      }catch(Exception e){
                                      System.out.print(e);
                            
                                      }
                                          }else{
                                      try
                                       {
                                      Class.forName("com.mysql.jdbc.Driver");
                                      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                                      Statement st=conn.createStatement();
                                     // String sql="SELECT Id,Credit_Own_Id, Nom,Credit_Date,Montant, Interet, Pay_Date FROM credit where status='0'";
                                      //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                                     String sql="SELECT create_beneficiaire.Id, create_beneficiaire.Name, create_beneficiaire.Lname, create_beneficiaire.Contact, create_beneficiaire.Travail, create_beneficiaire.Zone_Id,zone.Zone_Name,credit.Montant,credit.Interet, credit.Credit_Date, credit.Pay_Date FROM create_beneficiaire INNER JOIN zone on zone.Zone_Id=create_beneficiaire.Zone_Id INNER JOIN credit on credit.Credit_Own_Id=create_beneficiaire.Id where zone.Zone_Name='"+g+"' and status='0'";
                          ResultSet rs=st.executeQuery(sql);
                                      while(rs.next()){  
                        %>

                    <tr> <td><%= rs.getInt(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td><%= rs.getString(6) %></td>
                        <td><%= rs.getString(8) %></td>
                        <td><%= rs.getString(9) %></td>
                        <td><%= rs.getString(10) %></td>
                        <td><%= rs.getString(11) %></td>
                         <% 
                         
                        
                                                  // String name=session.getAttribute("name").toString();

                                              }
                                      }catch(Exception e){
                                      System.out.print(e);
                            
                                      }
                  }
    
                        %>
                </tbody>
            </table>



        </form>

    </body>
</html>

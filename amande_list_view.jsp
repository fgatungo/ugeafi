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
                            <li class="nav-item"><a href="amande_list.jsp" class="nav-link">NOUVELLE AMANDE</a></li>

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
        </section>
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

            <h4 style="color: red" align="center">LES AMANDES IMPAYES!</h4>

            <table border="1" align="center">
                <thead>
                    <tr>
                        <th>DATE</th>
                        <th>NOM ET PRENOM</th>
                        <th>MONTA A PAYE</th>
                        <th>MOFIT DE L'AMANDE</th>
                        <th>DATE DE PAIEMENT</th>
                        <th>RAPPORT</th>
                    </tr>
                </thead>
                <tbody> 
                    <%     
                     
                    
                        //String g="mi";
                    try
                     {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                    Statement st=conn.createStatement();
                    String sql="SELECT Id, Dates,Own_Id, Nom, Amande, Reason,Date FROM amande WHERE status='0'";
                    //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                    ResultSet rs=st.executeQuery(sql);
                    while(rs.next()){ 
                       int codeee=rs.getInt(3);
                           
                            session.setAttribute("codeee",codeee);
                            
                                         
                    %>

                    <tr> 
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td><%= rs.getString(6) %></td>
                        <td><%= rs.getString(7) %></td>                     
                        <td><a href="Pay_Amande.jsp?idf=<%=rs.getInt(1)%>"/> PAYE CET AMANDE </td></tr>
                        <% 
                            
                                                  // String name=session.getAttribute("name").toString();

                                              }
                                      }catch(Exception e){
                                      System.out.print(e);
                            
                                      }
 
    
                        %>
                </tbody>
            </table>

            <%
           
             try
                      {
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                     Statement sts=conn.createStatement();
                    String some="SELECT sum(amande)from amande where STATUS='0'";
                     //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                     ResultSet rss=sts.executeQuery(some);
                     //ResultSet rss=st.executeQuery(some);
               
                            
                     while(rss.next()){  
            %>
            <table border='1' align='center' style="background: coral">
                <tr> <td>AMANDE TOTAL</td> <td><%= rss.getInt(1) %></td></tr>
                
            </table
            <% 
           
           
                                  }
                          }catch(Exception e){
                          System.out.print(e);
                            
                          }
           
            %>

        </form>

    </body>
</html>

<%-- 
    Document   : RapportZOneChoise
    Created on : Aug 13, 2021, 12:33:05 PM
    Author     : GATUNGO
--%> 
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String zone=request.getParameter("zone");

%>
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
                            <li class="nav-item"><a href="contribution.jsp" class="nav-link">CONTRIBUTION</a></li>                            
                            <li class="nav-item"><a href="Beneficiaire.jsp" class="nav-link">NOUVELLE BENEFICIAIRES</a></li>
                            <li class="nav-item"><a href="Data.jsp" class="nav-link">LISTE DES BENEFICIAIRES</a></li>
                            <li class="nav-item"><a href="New_Credit.jsp" class="nav-link">CREDIT</a></li>
                            <li class="nav-item"><a href="Credit_List.jsp" class="nav-link">VOIR LES CREDITS</a></li>


                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
            <form action="RapportZOneChoise.jsp"method="GET">
                <table border="0" align="center" style="margin-top: 20px;">
                    <thead>
                        <tr>
                            <th colspan="2">FAITEZ LE CHOIX DE L'AVEC</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>AVEC</td>
                            <td>

                                <select name="zone" id="zone" >
                                    <option>         </option>
                                    <option>TOUS LEZ AVEC</option>
                                    <%  
                                          String zona1=request.getParameter("zone");
                            try
                                     {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                                    Statement st=conn.createStatement();
                                    String sql="SELECT Names FROM avec where Zone_Name='"+zona1+"'";
                                    //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                                    ResultSet rs=st.executeQuery(sql);
                                    while(rs.next()){  
                                    %>

                                    <option>  <%= rs.getString(1) %></option>


                                    <% 
                                                                }
                                                        }catch(Exception e){
                                                        System.out.print(e);
                            
                                                        }
                                    %>
                                </select>

                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="SUIVANT" /></td>
                        </tr>
                    </tbody>
                </table>

            </form> 
            <table border="1" align="center" style="margin-top: 20px;"> 

                <%            
                   String zona=request.getParameter("zone");
                %>
                <h5 align="center" style="color: red">Vouz etez dans la zone de : <%=zone%></h5>
                <%
             try
             {
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
             Statement st=conn.createStatement();
            // String sql="select *from create_beneficiaire where Zone='"+zona+"'";
            String sql="SELECT create_beneficiaire.Id, create_beneficiaire.Name, create_beneficiaire.Lname, create_beneficiaire.Contact, create_beneficiaire.Travail,create_beneficiaire.Zone,avec.Names FROM create_beneficiaire inner join avec on avec.Zone_Name=create_beneficiaire.Zone and Zone_Name='"+zona+"'";
             ResultSet rs=st.executeQuery(sql);
                %>
                <thead>
                    <tr>
                        <th>CODE</th> 
                        <th>NOM</th>
                        <th>CONTACTE</th>
                        <th>FONCTION</th>
                        <th>ZONE</TH>
                        <th>AVEC</th>
                        <th>CONTRIBUTION</th>
                        <th>AMANDE</th>
                        <th>CREDIT</th>

                    </tr>
                </thead>
                <tbody>
                    <%   
                   while(rs.next()){
                
               
                    %>
                    <tr> <td><%= rs.getInt(1) %></td>
                        <td><%= rs.getString(2).toUpperCase()+" "+ rs.getString(3).toUpperCase() %></td> 
                        <td><%= rs.getString(4).toUpperCase() %></td> 
                        <td><%= rs.getString(5).toUpperCase() %></td>
                        <td><%= rs.getString(6).toUpperCase() %></td>
                        <td><%= rs.getString(7).toUpperCase() %></td>
                        <td><a href="contribution.jsp?id=<%=rs.getInt(1)%>"/> VOIR CONTR. </td>
                        <td><a href="amande.jsp?id=<%=rs.getInt(1)%>"/> AMANDE </td>
                        <td><a href="Credit.jsp?id=<%=rs.getInt(1)%>"/> CREDIT </td></tr>

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









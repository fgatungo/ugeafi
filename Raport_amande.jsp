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
                            <li class="nav-item"><a href="Raport_Credit.jsp" class="nav-link">RAPPORT DE CREDIT</a></li>
                            <li class="nav-item"><a href="Rapport_Contribution.jsp" class="nav-link">RAPPORT DE CONTRIBUTION</a></li>

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
            <form action="Raport_amande.jsp"method="GET">
                <table border="0" align="center" style="margin-top: 20px;">
                    <thead>
                        <tr>
                            <th colspan="2">FAITEZ LE CHOIX DE LA ZONE POUR VOIR LES AMANDES</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ZONE</td>
                            <td>

                                <select name="zone" id="zone" >
                                    <option>         </option>

                                    <%     
                                                 //  String zone=request.getParameter("1");
            
                            try
                                     {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                                    Statement st=conn.createStatement();
                                    String sql="SELECT Zone_Name FROM zone";
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
                            <td>DU</td>
                            <td><input type="date" value="" name="from" /></td>
                        </tr>
                        <tr>
                            <td>AU</td>
                            <td><input type="date" value="" name="too"/></td>
                        </tr>


                        <tr>
                            <td></td>
                            <td><input type="submit" value="RECHERCHER" /></td>
                        </tr>
                    </tbody>
                </table>

            </form>


            <table border="1" align="center" style="margin-top: 20px;">
                <%            
                                   String zona=request.getParameter("zone");
                                   String from=request.getParameter("from");
                                   String too=request.getParameter("too");
                                   
                %>
                <h5 align="center" style="color: red">Vouz etez dans la zone de : <%=zona%> </h5>
                <% 
             try
             {
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
             Statement st=conn.createStatement();
            // String sql="select *from create_beneficiaire where Zone='"+zona+"'";
            String sql="SELECT amande.Dates,amande.Own_Id,amande.Amande,amande.Reason, create_beneficiaire.Name, zone.Zone_Name,create_beneficiaire.Lname,avec.Names,amande.Status from amande inner JOIN create_beneficiaire on amande.Own_Id=create_beneficiaire.Id INNER JOIN zone on zone.Zone_Id=create_beneficiaire.Zone_Id inner JOIN avec on avec.Id=create_beneficiaire.Avec_Id WHERE "
                    + "amande.Dates BETWEEN '"+from+"' and '"+too+"' and zone.Zone_Name='"+zona+"'";
           
             ResultSet rs=st.executeQuery(sql);
                %>
                <thead>
                    <tr>
                        <th>DATE</th> 
                        <th>NOM ET PRENOM</th>
                        <th>AMANDE</th>
                        <th>MOTIF D'AMANDE </th>
                        <th>ZONE</TH>
                        <th>AVEC</th>
                        <th>STATUS</th>

                    </tr>
                </thead>
                <tbody>
                    <%   
                   while(rs.next()){
                
               
                    %>
                    <tr> 
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(5).toUpperCase() +" "+rs.getString(7).toUpperCase() %></td>

                        <td> <%= rs.getInt(3) %></td> 

                        <td><%= rs.getString(4).toUpperCase() %></td>
                        <td><%= rs.getString(6).toUpperCase() %></td>
                        <td><%= rs.getString(8).toUpperCase() %></td>
                        <td><%= rs.getString(9) %></td>
                      
                    </tr>

                    <%
                                   
                }

                }catch(Exception e){
                System.out.print(e);
                            
                } 
                    %>


                </tbody>
            </table>     


            <table border="1" align="center" style="margin-top: 20px;">
                <%            
                                   String zona1=request.getParameter("zone");
                                   String from1=request.getParameter("from");
                                   String too1=request.getParameter("too");
                                   
                
             try
             {
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
             Statement st=conn.createStatement();
            // String sql="select *from create_beneficiaire where Zone='"+zona+"'";
            String sql="SELECT amande.Dates,amande.Own_Id,sum(amande.Amande),amande.Reason, create_beneficiaire.Name, zone.Zone_Name,create_beneficiaire.Lname,avec.Names,amande.Status from amande inner JOIN create_beneficiaire on amande.Own_Id=create_beneficiaire.Id INNER JOIN zone on zone.Zone_Id=create_beneficiaire.Zone_Id inner JOIN avec on avec.Id=create_beneficiaire.Avec_Id WHERE "
                    + "amande.Dates BETWEEN '"+from1+"' and '"+too1+"' and zone.Zone_Name='"+zona1+"'";
                    ResultSet rs=st.executeQuery(sql);
                %>
                <thead>
                    <tr>
                        <th>TOTAL CONTRIBUTION</th> 


                    </tr>
                </thead>
                <tbody>
                    <%   
                   while(rs.next()){
                
               
                    %>
                    <tr> 
                        <td><%= rs.getInt(3) %></td>


                    </tr>

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


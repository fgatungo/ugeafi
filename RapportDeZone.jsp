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
            <form action="RapportDeZone.jsp" method="GET" >

                <table border="1" align="center" style="margin-top: 20px;">
                    <tbody>    
                        <tr>
                            <td>AVEC</td>
                            <td>
                                <select name="avec" id="avec"> 
                                    <%     
                                                   // String zones=request.getParameter("zone"); 
                            try
                                     {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                                    Statement st=conn.createStatement();
                                    String sql="select Names FROM avec";
                                    //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                                    ResultSet rs=st.executeQuery(sql);
                                    while(rs.next()){   
          // session.setAttribute("avec",avecName);
                                    %>

                                    <option>  <%= rs.getString(1) %></option> 

                                    <%                   
                                       
                                        }

                                                        }catch(Exception e){
                                                        System.out.print(e);
                            
                                                        }
                                    %>
                                </select></td>

                        </tr> 

                        <tr>
                            <td></td>
                            <td><input type="submit" value="ENREGISTRER" /></td>
                        </tr> 
                    </tbody>
                </table>
            </form>
            <form action="RapportDeZone.jsp" method="GET">
                <table border="1" align="left" style=" margin-left:100px;" >
                    <thead>
                        <tr>
                            <td colspan="2" align="center">RECHERCHER PAR ZONE</td>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>CHOISISE LA ZONE</td>
                            <td>
                                <select name="zona" id="zona"> 
                                    <%     
                                                   // String zones=request.getParameter("zone"); 
                            try
                                     {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                                    Statement st=conn.createStatement();
                                    String sql="select zone_Name FROM zone";
                                    //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                                    ResultSet rs=st.executeQuery(sql);
                                    while(rs.next()){   
          // session.setAttribute("avec",avecName);
                                    %>

                                    <option>  <%= rs.getString(1) %></option> 

                                    <%                   
                                       
                                        }

                                                        }catch(Exception e){
                                                        System.out.print(e);
                            
                                                        }
                                    %>
                                </select></td>
                        </tr>
                        <tr>

                            <td align="center" colspan="2"><input type="submit" value="RECHERCHER" /></td>
                        </tr>
                    </tbody>
                </table>
            </form>


            <table border="2" align="right" style=" margin-right:200px;" >
                <thead>
                    <tr>
                        <td colspan="2" align="center">RECHERCHER PAR CONTRIBUTION</td>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>tutugjh</td>
                        <td>gjgj</td>
                    </tr>
                    <tr>

                        <td align="center" colspan="2"><input type="submit" value="OK" /></td>
                    </tr>
                </tbody>
            </table> 
            <table border="1" align="center" style="margin-top: 100px;">

                <%            
                   String na=request.getParameter("avec");
                try
                {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                Statement st=conn.createStatement();
                String sql="select *from avec where Names='"+na+"'";
                ResultSet rs=st.executeQuery(sql);
                while(rs.next()){
                %>
                <thead>
                    <tr>
                        <th>CODE</th> 
                        <th>NOM</th>
                        <th>PRESIDENT</th>
                        <th>CONTACT</th>
                        <th>CONTRIBUTION</th>
                        <th>OPTION</th>
                        <th>AJOUT. AVEC</th>

                    </tr>
                </thead>
                <tbody>
                    <tr> <td><%= rs.getInt(1) %></td>
                        <td><%= rs.getString(2).toUpperCase() %></td>
                        <td><%= rs.getString(3).toUpperCase() %></td>
                        <td><%= rs.getString(4).toUpperCase() %></td> 
                        <td><%= rs.getString(5).toUpperCase() %></td> 
                        <td><a href="Edit_Zone.jsp?id=<%=rs.getInt(1)%>"/> Modifier </td>
                        <td><a href="New_Avec.jsp?id=<%=rs.getInt(1)%>"/> AVEC </td></tr>

                    <%
                                   
                }

                }catch(Exception e){
                System.out.print(e);
                            
                } 
                    %>


                </tbody>
            </table>



            <table border="1" align="center" style="margin-top: 100px;">


                <%            
                   String zona=request.getParameter("zona");
                try
                {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                Statement st=conn.createStatement();
                String sql="select *from create_beneficiaire where Zone='"+zona+"'";
                ResultSet rs=st.executeQuery(sql);
                %>
                <thead>
                    <tr>
                        <th>CODE</th> 
                        <th>NOM</th>
                        <th>PRESIDENT</th>
                        <th>CONTACT</th>
                        <th>CONTRIBUTION</th>
                        <th>OPTION</th>
                        <th>AJOUT. AVEC</th>

                    </tr>
                </thead>
                <tbody>
                    <%   
                   while(rs.next()){
                
               
                    %>
                    <tr> <td><%= rs.getInt(1) %></td>
                        <td><%= rs.getString(2).toUpperCase() %></td>
                        <td><%= rs.getString(3).toUpperCase() %></td>
                        <td><%= rs.getString(4).toUpperCase() %></td> 
                        <td><%= rs.getString(5).toUpperCase() %></td> 
                        <td><a href="Edit_Zone.jsp?id=<%=rs.getInt(1)%>"/> Modifier </td>
                        <td><a href="New_Avec.jsp?id=<%=rs.getInt(1)%>"/> AVEC </td></tr>

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


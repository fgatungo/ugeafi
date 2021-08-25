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

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->


            <h4 align="center" style="color: red">AJOUTER OU MODIFIER UNE ZONE</h4>

            <form action="saveZone.jsp" method="POST" >

               

                <table border="1" align="center">
                    <tbody>       <tr>
                            <td>ZONE</td>
                            <td><input type="text" name="zoneName" value="" readonly=""/></td>
                        </tr> 
                        <tr>
                            <td>PRESIDENT</td>
                            <td><input type="text" name="super" value="" /></td>
                        </tr>
                        <tr>
                            <td>CONTACT</td>
                            <td><input type="text" name="contact" value="" /></td>
                        </tr>
                       
                        <tr>
                            <td></td>
                            <td><input type="submit" value="ENREGISTRER" /></td>
                        </tr> 
                    </tbody>
                </table>
            </form>  
            <h3 align="center">LISTE DES ZONES</h3>
            <table border="1" align="center">
                <thead>
                    <tr>
                        <th>CODE</th> 
                        <th>NOM</th>
                        <th>PRESIDENT</th>
                        <th>CONTACT</th>
                        <th>OPTION</th>
                        <th>AJOUT. AVEC</th>

                    </tr>
                </thead>
                <tbody>


                    <%                        
                    try
                    {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                    Statement st=conn.createStatement();
                    String sql="select Zone_Id,Zone_Name, Supervisor, Contact from zone";
                    ResultSet rs=st.executeQuery(sql);
                    while(rs.next()){
                    %>
                    <tr> <td><%= rs.getInt(1) %></td>
                        <td><%= rs.getString(2).toUpperCase() %></td>
                        <td><%= rs.getString(3).toUpperCase() %></td>
                        <td><%= rs.getString(4).toUpperCase() %></td> 

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


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Website menu 02</title>
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
                            <li class="nav-item"><a href="zone.jsp" class="nav-link">ZONE</a></li>
                          

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->

        </section>

        <% 
       String id=request.getParameter("id");
               
        %>


        <h3 align="center">AJOUTER UNE AVEC</h3>
        <form action="saveAvec.jsp" method="post">


            <table border="1" align="center">
                <thead>
                      </thead>
                <tbody>
                   

                    <tr>
                        <%                        
                       try
                       {
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                       Statement st=conn.createStatement();
                       String sql="select zone_Id,Zone_Name from zone where Zone_Id='"+id+"' ";
                       ResultSet rs=st.executeQuery(sql);
                       while(rs.next()){ 
                        %>
                        
                <h5 align="center" style="color: red">Ajoute une AVEC dans la zone de : <%= rs.getString(2) %></h5>
                <td>Nom du Zone</td><td> <input type="text" name="zoneName" value="<%= rs.getString(2) %>" readonly=""/><td></tr>
                <tr> <td></td><td> <input type="hidden" name="id" value="<%= rs.getString(1) %>" readonly=""/><td>
                <%
                                   
            }

            }catch(Exception e){
            System.out.print(e);
                            
            } 
                %>

                </tr>
              
                    <tr>
                        <td>NOM DE L'AVEC</td>
                        <td><input type="text" name="avecname" value="" /></td> 
                    </tr>
                      <tr>
                        <td>CONTRIBUTION</td>
                        <td><input type="numbwe" name="Avec_Contribution" value="" /></td> 
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Enregistre" /></td>
                         
                    </tr>
                </tbody>
            </table>
        </form>

                <table border="1" align='center' style="margin-top: 20px;">
                    <thead>
                        <tr>
                           
                            
                            <th>NOM DE L'AVEC</th>
                            <th>NOM DE LA ZONE</th>
                            <th>CONTRIBUTION</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <%
                        
                        try
                                 {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                                Statement st=conn.createStatement();
                                String sql="SELECT Names, Zone_Name,Contribution FROM avec WHERE zone_Id='"+id+"'";
                                //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                                ResultSet rs=st.executeQuery(sql);
                                while(rs.next()){  
                                %>

                                
                                <td> <%= rs.getString(1) %></td>
                                <td> <%= rs.getString(2) %></td>
                                <td> <%= rs.getInt(3)+" "+"FC" %></td>
                        
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


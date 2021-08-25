<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
    <body  align="center">
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


        </section>
        
           
        <form action="test3.jsp">
              <table border="1" align="center">
                <tbody>
                     
                   <%
                   String zone=request.getParameter("zone");
                   
                                try
                                 {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                                Statement st=conn.createStatement();
                                String sql="SELECT Zone_Id FROM zone where Zone_Name='"+zone+"'";
                                //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                                ResultSet rs=st.executeQuery(sql);
                                while(rs.next()){  
                                int zoneids=rs.getInt(1);
                                session.setAttribute("zoneids", zoneids);
                                %>

                                <option>  <%= rs.getString(1) %></option>  
                                
                                
                                <% 
                                                            }



                                                    }catch(Exception e){
                                                    System.out.print(e);
                            
                                                    }
                                %> 

                  
                    <tr>
                        <td>ZONE</td>
                        <td><input type="text" name="zone" value="<%=zone%>" readonly="" style="background-color: #ff3300" />
                            </td>
                    </tr> 
                                  
                     <tr>
                        <td>AVEC</td>
                        <td>
                            <select name="avec" id="avec"> 
                         <%     
                                         String zones=request.getParameter("zone"); 
                 try
                          {
                         Class.forName("com.mysql.jdbc.Driver");
                         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                         Statement st=conn.createStatement();
                         String sql="select Id,Names FROM avec WHERE Zone_Name='"+zones+"'";
                         //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                         ResultSet rs=st.executeQuery(sql);
                         while(rs.next()){  
int rr =rs.getInt(1);
session.setAttribute("avec_Id", rr);
                                    %>

                                    <option>  <%= rs.getString(2) %></option> 
                                <%                          }
                                                    }catch(Exception e){
                                                    System.out.print(e);
                            
                                                    }
                                %>
                         </select></td>

                    </tr>  

                    <tr>
                        <td></td>
                        <td><input type="submit" value="SUIVANT" /></td>
                    </tr>
                </tbody>
            </table> 
        </form>

    </body> 

    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</html>


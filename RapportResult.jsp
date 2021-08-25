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
            <h4 align="center">RESULTAT DE LA RECHERCHER</h4>
              
            <table border="1" align="center">
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


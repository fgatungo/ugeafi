<%-- 
    Document   : avec
    Created on : Aug 10, 2021, 8:55:50 PM
    Author     : GATUNGO
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        <form action="avec.jsp" method="GET">
            <table border="1">


                <tr>
                    <td>Zone</td> </tr>
                <tr> <td>   <select name="2">
                            <option>
                                <%     
                                                String zone=request.getParameter("1");
            
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

                            <tr> <td><%= rs.getString(1) %></td> </tr>


                            <%
 
                    
                                                        }
                                                }catch(Exception e){
                                                System.out.print(e);
                            
                                                }
                            %>


                            </option>
                        </select>  </tr>


            </table>


        </form>



    </body>
</html>

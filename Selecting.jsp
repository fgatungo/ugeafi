<%-- 
    Document   : Selecting
    Created on : Aug 15, 2021, 1:27:43 PM
    Author     : GATUNGO
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<thml>
    <body>

        <table border="1">
            <%
String da=request.getParameter("1");
String Dat=request.getParameter("2");
        DateFormat formatter ; 
        formatter = new SimpleDateFormat("yyyy-MM-dd");
Date date1=formatter.parse(da);
Date date2=formatter.parse(Dat);

                 //String g="mi";
                                try
                                 {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                                Statement st=conn.createStatement();
                                String sql="SELECT Credit_Own_Id, Nom,Credit_Date,Montant, Interet, Pay_Date FROM credit where Credit_Date between '"+da+"' and '"+Dat+"' ";
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

                <% 
                    
                    }
            }catch(Exception e){
            System.out.print(e);
                            
            }
                %>
        </table>
    </body>
</html>
<%-- 
    Document   : UpdatePay_Amande
    Created on : Aug 18, 2021, 10:32:30 AM
    Author     : GATUNGO
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<% 
   //session.setAttribute("idf", id); 
   String idd=session.getAttribute("idj").toString();
 
try
{ 
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
Statement st=conn.createStatement();
String sql="UPDATE amande SET Status='1' WHERE id='"+idd+"'";
//String sql="INSERT INTO paycredit( Credit_Id, Own_Id,DeteApayer,montant,Comment) VALUES('"+id+"','"+OwnId+"','"+deteapaye+"','"+montants+"','"+comment+"')";
st.execute(sql);
String redirectURL = "Thanks.jsp";
response.sendRedirect(redirectURL);
}
catch(Exception e )
{
System.out.print(e);
e.printStackTrace();
}  

%>

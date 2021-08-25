<%-- 
    Document   : SaveCredit
    Created on : Aug 7, 2021, 6:48:22 PM
    Author     : GATUNGO
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
int id=Integer.parseInt(request.getParameter("id"));
int montant=Integer.parseInt(request.getParameter("montant"));
int interet=Integer.parseInt(request.getParameter("interet"));
String payDate=request.getParameter("payDate");
String namee=request.getParameter("names");
  
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
Statement st=conn.createStatement();
String sql="INSERT INTO credit(Credit_Own_Id,Nom,Montant,Interet,Pay_Date) VALUES('"+id+"','"+namee+"','"+montant+"','"+interet+"','"+payDate+"')";
st.execute(sql);
String msg="Le Credit a ete bien Enregistre";
session.setAttribute("msg", msg);

String redirectURL = "Credit_List.jsp";
response.sendRedirect(redirectURL);
}
catch(Exception e )
{
System.out.print(e);
e.printStackTrace();
} 
 

%>

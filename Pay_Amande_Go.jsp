<%-- 
    Document   : Pay_Amande_Go
    Created on : Aug 18, 2021, 11:25:19 AM
    Author     : GATUNGO
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%
int idj=Integer.parseInt(request.getParameter("idss"));
int idCode=Integer.parseInt(request.getParameter("codesss")); 
String owname=request.getParameter("Ownersss"); 
int monts=Integer.parseInt(request.getParameter("montantsss")); 


 try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
Statement st=conn.createStatement();
String sql="INSERT INTO pay_amande (Amande_Id,Own_Id,Montans,Names) VALUES ('"+idj+"','"+idCode+"','"+monts+"','"+owname+"')";
// String sql="INSERT INTO paycredit( Credit_Id, Own_Id,DeteApayer,montant,Comment) VALUES('"+id+"','"+OwnId+"','"+deteapaye+"','"+montants+"','"+comment+"')";
st.execute(sql); 
String sqls="UPDATE amande SET Status='PAYEE' WHERE id='"+idj+"'";
st.execute(sqls);

 String redirectURL = "index.jsp";
 response.sendRedirect(redirectURL);
// session.setAttribute("idf", id);
}
catch(Exception e )
{
System.out.print(e);
e.printStackTrace();
} 
%>

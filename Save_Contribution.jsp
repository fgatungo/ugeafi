<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
int id=Integer.parseInt(request.getParameter("ids"));
String names=request.getParameter("namess");
int montant=Integer.parseInt(request.getParameter("montantss"));
String month=request.getParameter("months");
String today=request.getParameter("ContrDate");



  
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
Statement st=conn.createStatement();
String sql="INSERT INTO contribution(Ben_Id,Names,Contribution,Pay_Date,Mois_de) VALUES('"+id+"','"+names+"','"+montant+"','"+today+"','"+month+"')";
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

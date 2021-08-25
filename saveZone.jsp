

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String Responsable=request.getParameter("super");
String Contac=request.getParameter("contact");
String zone=request.getParameter("zoneName");

 
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
Statement st=conn.createStatement();
st.execute("insert into zone(Zone_Name, Supervisor, Contact)values('"+zone+"','"+Responsable+"','"+Contac+"')");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
 
String redirectURL = "zone.jsp";
String msg="Zone Enregistre!";
session.setAttribute("msg", msg);
response.sendRedirect(redirectURL);


%>

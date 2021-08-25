

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    
//String Bzone1=(String)session.getAttribute("zoneid");
int Bzone=(Integer)session.getAttribute("zoneids"); 
String BName=request.getParameter("name");
String BLname=request.getParameter("lname");
String Btravail=request.getParameter("travail");
// int Bzone=Integer.parseInt(request.getParameter("zone"));
String Bphone=request.getParameter("phone");
int sawa=Integer.parseInt(request.getParameter("sawa"));


 
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
Statement st=conn.createStatement();
st.execute("insert into create_beneficiaire(Name, Lname,Contact, Travail, Zone_Id,Avec_Id)values("
        + "'"+BName+"','"+BLname+"','"+Bphone+"','"+Btravail+"','"+Bzone+"','"+sawa+"')");
String redirectURL = "page.jsp";
response.sendRedirect(redirectURL);


}
catch(Exception e )
{
String redirectURL = "ERROR.JSP";
response.sendRedirect(redirectURL);

 
System.out.print(e);
e.printStackTrace();
} 

%>
 
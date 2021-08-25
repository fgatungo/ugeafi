<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
int id=Integer.parseInt(request.getParameter("id"));
String nom=request.getParameter("names");
int montants=Integer.parseInt(request.getParameter("montants"));
String motif=request.getParameter("motif");
String payDate=request.getParameter("payDate");
 

  
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
Statement st=conn.createStatement();
String sql="INSERT INTO amande(Own_Id,Nom,Amande,Reason,Date) VALUES('"+id+"','"+nom+"','"+montants+"','"+motif+"','"+payDate+"')";
st.execute(sql);
//String msg="Le Credit a ete bien Enregistre";
String redirectURL = "Thanks.jsp";
response.sendRedirect(redirectURL);
}
catch(Exception e )
{
System.out.print(e);
e.printStackTrace();
} 

%>
<html>
    
    
    <h5><%=id %></h5>
    <h5><%=nom %></h5>
    <h5><%=montants %></h5>
    <h5><%=motif %></h5>
    <h5><%=payDate %></h5>
</html>


 
<%-- 
    Document   : saveAvec
    Created on : Aug 12, 2021, 11:49:19 AM
    Author     : GATUNGO
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String zone=request.getParameter("zoneName");
String zoneId=request.getParameter("id");
String avec=request.getParameter("avecname");
String avec_cont=request.getParameter("Avec_Contribution");
int contr_avec=Integer.parseInt(avec_cont);

 
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
Statement st=conn.createStatement();
st.execute("insert into avec(zone_id,Names,Contribution,Zone_Name)values('"+zoneId+"','"+avec+"','"+contr_avec+"','"+zone+"')");
String msg="un AVEC est bine Enregistré1";
session.setAttribute(msg, "msg");

String redirectURL = "zone.jsp";
response.sendRedirect(redirectURL);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}  

%>

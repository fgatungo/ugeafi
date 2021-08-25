

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%
int id=Integer.parseInt(request.getParameter("id"));
int OwnId=Integer.parseInt(request.getParameter("code"));
int montants=Integer.parseInt(request.getParameter("montants"));
int Payed=Integer.parseInt(request.getParameter("amountPayeds").toString());
int amountPayed=Integer.parseInt(request.getParameter("amountPayedkk").toString());
int some=Payed+amountPayed; 
if(montants-some==0){
 try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
Statement st=conn.createStatement();
String sql="INSERT INTO paycredit(Credit_Id, Own_Id, DeteApayer, montant, Payed) VALUES ('"+id+"','"+OwnId+"','"+montants+"','"+montants+"','"+Payed+"')";
st.execute(sql);
String ss="UPDATE `credit` SET `Montant_paye`='"+some+"' where Id='"+id+"'";
st.execute(ss);
    String ssd="UPDATE `credit` SET `status`='PAYEE' where Id='"+id+"'";
    st.execute(ssd);
  String redirectURL = "Thanks.jsp";
response.sendRedirect(redirectURL);
}
catch(Exception e )
{
System.out.print(e);
e.printStackTrace();
} 
    
}else{
try {
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
Statement st=conn.createStatement();
String sql="INSERT INTO paycredit(Credit_Id, Own_Id, DeteApayer, montant, Payed) VALUES ('"+id+"','"+OwnId+"','"+montants+"','"+montants+"','"+Payed+"')";
st.execute(sql);
String ss="UPDATE `credit` SET `Montant_paye`='"+some+"' where Id='"+id+"'";
st.execute(ss);
String redirectURL = "Thanks.jsp";
response.sendRedirect(redirectURL);
}catch(Exception e )
{
System.out.print(e);
e.printStackTrace();
} 
}
%>

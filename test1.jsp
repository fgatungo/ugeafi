<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Website menu 02</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body >
        <h2 align="center">UGEAFI AVEC</h2>
        <section class="ftco-section">
            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container"> 

                    <div class="collapse navbar-collapse" id="ftco-nav" align="center" >
                        <ul class="navbar-nav mr-auto"> 

                            <li class="nav-item"><a href="index.html" class="nav-link">ACCUEIL</a></li>
                            
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav --> 
        </section> 
        <form action="test2.jsp">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <h5 color="red" align="center">Dans quel zone voulez-vous insere le bénéficiaire ?</h5>
            <table border="1" align="center" >
                <tbody> 
                    <tr>
                        <td>ZONE</td>
                        <td>
                            <select name="zone" id="zone" >

                                <%     
                                             //  String zone=request.getParameter("1");
            
                        try
                                 {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                                Statement st=conn.createStatement();
                                String sql="SELECT Zone_Name FROM zone";
                                //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                                ResultSet rs=st.executeQuery(sql);
                                while(rs.next()){   
                               
                                %>

                                <option>  <%= rs.getString(1) %></option>  
                                
                                
                                <% 
                                   
                                                            } 
                                                    }catch(Exception e){
                                                    System.out.print(e);
                            
                                                    }
                                %> 
                                
                            </select></td>

                    </tr>  
 
                    <tr>
                        <td></td>
                        <td><input type="submit" value="SUIVANT" /></td>
                    </tr>
                </tbody>
            </table> 
        </form>
                                
                               
                    

    </body> 

    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</html>


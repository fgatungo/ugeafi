<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
    <head>
        <title>UGEAFI AVEC</title>
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
                             <li class="nav-item"><a href="List_COntribution.jsp " class="nav-link">VOIR LE CONTRIBUTION</a></li>
                            

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
            <form action="New_Contribution.jsp"method="GET">
                <table border="0" align="center" style="margin-top: 20px;">
                    <thead>
                        <tr>
                            <th colspan="2" style="color: red " >ENREGISTRE UNE NOUVELLE CONTRIBUTION</th>

                        </tr>
                        <tr>
                            <th colspan="2">IDENTIFIER LE BENEFICIAIRE PAR SON NOM, ZONE, OU CODE</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>BENEFICIAIRE</td>
                            <td><input type="text" name="identifiant" value="" /></td>


                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="CHERCHER" /></td>
                        </tr>
                    </tbody>
                </table>

            </form> 

            <table border="1" align="center" style="margin-top: 20px;">
                <%            
                                  String identifiant=request.getParameter("identifiant");
               
                             try
                             {
                             Class.forName("com.mysql.jdbc.Driver");
                             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                             Statement st=conn.createStatement(); 
                            String sql="select create_beneficiaire.Id,create_beneficiaire.Name, create_beneficiaire.Lname,zone.Zone_Name from create_beneficiaire inner join zone on create_beneficiaire.Zone_Id=zone.Zone_Id where "
                                    + "create_beneficiaire.Name='"+identifiant+"' or "
                                    + "create_beneficiaire.LName='"+identifiant+"' or "
                                    + "create_beneficiaire.Id='"+identifiant+"' or zone.Zone_Name='"+identifiant+"'";
                            
         // SELECT create_beneficiaire.Id,create_beneficiaire.Name, create_beneficiaire.Lname, create_beneficiaire.Contact, create_beneficiaire.Travail,zone.Zone_Name FROM create_beneficiaire LEFT JOIN zone on create_beneficiaire.Zone_Id=zone.Zone_Id where create_beneficiaire.Id ='"+g+"' or create_beneficiaire.Name='"+g+"' or create_beneficiaire.Lname='"+g+"' or zone.Zone_Name='"+g+"'                  
                            
                            
                            ResultSet rs=st.executeQuery(sql);
                %>
                <thead>
                    <tr>
                        <th>CODE</th> 
                        <th>NOM</th>
                        <th>PRENOM</th>
                         <th>DU ZONE DE</th>
                        <th>CONTRIBUTION</th>
                       

                    </tr>
                </thead>
                <tbody>
                    <%   
                   while(rs.next()){
                
               String Nameeee=rs.getString(2)+" "+rs.getString(3);
               session.setAttribute("Nameee", Nameeee);
                    %>
                    <tr> <td><%= rs.getInt(1) %></td>
                        <td><%= rs.getString(2).toUpperCase()%></td> 
                        <td><%= rs.getString(3).toUpperCase() %></td> 
                        <td><%= rs.getString(4).toUpperCase() %></td> 

                        <td><a href="AddContribution.jsp?identifiant=<%=rs.getInt(1)%>"/>CONTRIBUER. </td>
                       </tr>

                    <%
                                   
                }

                }catch(Exception e){
                System.out.print(e);
                            
                } 
                    %>


                </tbody>
            </table>     


    </body>
</html>


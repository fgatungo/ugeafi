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
                           

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- END nav -->
            <form action="List_COntribution.jsp"method="POST">
                <table border="0" align="center" style="margin-top: 20px;">
                    <thead>
                        <tr>
                            <th colspan="2" style="color: red" >IDENTIFIER LE BENEFICIAIRE PAR SON NOM, ZONE, CODE, OU SON AVEC POUR VOIR LES CONTRIBUTION</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>IDENTIFIER PAR:</td>
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
                       //     String sql="select create_beneficiaire.Id,create_beneficiaire.Name, create_beneficiaire.Lname,zone.Zone_Name from create_beneficiaire inner join zone on create_beneficiaire.Zone_Id=zone.Zone_Id where "
                       //             + "create_beneficiaire.Name='"+identifiant+"' or "
                       //             + "create_beneficiaire.LName='"+identifiant+"' or "
                       //             + "create_beneficiaire.Id='"+identifiant+"' or"
                       //             + " zone.Zone_Name='"+identifiant+"'";
                            
                         // String sql="SELECT `Id`, `Dates`, `Ben_Id`, `Names`, `Contribution`, `Pay_Date`, `Mois_de` FROM `contribution` where Names='"+identifiant +"' ";  
   String sql="SELECT create_beneficiaire.id,create_beneficiaire.Name,create_beneficiaire.Lname,"
           + "contribution.Mois_de,contribution.Contribution,zone.Zone_Name,avec.Names  from "
           + "create_beneficiaire INNER JOIN zone on zone.Zone_Id=create_beneficiaire.Zone_Id"
           + " inner join avec on avec.Id=create_beneficiaire.Avec_Id INNER JOIN contribution "
           + "on contribution.Ben_Id=create_beneficiaire.Id where "
   + "zone.Zone_Name='"+identifiant+"' OR create_beneficiaire.Name='"+identifiant+"' OR create_beneficiaire.Id='"+identifiant+"' "
           + " or create_beneficiaire.Lname='"+identifiant+"' or avec.Names='"+identifiant+"'";
   
                            ResultSet rs=st.executeQuery(sql);
                            
                %>
                <thead>
                    <tr>
                        <th>CODE</th> 
                        <th>NOM</th>
                        <th>PRENOM</th>
                        <th>DU ZONE DE</th>
                        <th>AVEC</th>
                        <th>CONTRIBUTION</th>
                        <th>PERIODE</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%   
                   while(rs.next()){
                    %>
                    <tr> <td><%= rs.getInt(1) %></td>
                        <td><%= rs.getString(2).toUpperCase()%></td> 
                        <td><%= rs.getString(3).toUpperCase() %></td> 
                        <td><%= rs.getString(6).toUpperCase() %></td> 
                        <td><%= rs.getString(7).toUpperCase() %></td> 
                        <td><%= rs.getString(5).toUpperCase() %></td> 
                        <td><%= rs.getString(4).toUpperCase() %></td> 
                        
                         

                    </tr>

                    <%          
                }
    }catch(Exception e){
                System.out.print(e);
                            
                } 
                    %>
                </tbody>
            </table>  
            <table border="1" align="center" style="margin-top: 20px;">
                <%            
                                  String iden=request.getParameter("identifiant");
               
                             try
                             {
                             Class.forName("com.mysql.jdbc.Driver");
                             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                             Statement st=conn.createStatement();
                            // String sql="SELECT sum(Contribution) FROM contribution where Names='"+iden +"' ";  
                            String sql="SELECT create_beneficiaire.id,create_beneficiaire.Name,create_beneficiaire.Lname,"
           + "contribution.Mois_de,sum(contribution.Contribution),zone.Zone_Name,avec.Names  from "
           + "create_beneficiaire INNER JOIN zone on zone.Zone_Id=create_beneficiaire.Zone_Id"
           + " inner join avec on avec.Id=create_beneficiaire.Avec_Id INNER JOIN contribution "
           + "on contribution.Ben_Id=create_beneficiaire.Id where "
   + "zone.Zone_Name='"+identifiant+"' OR create_beneficiaire.Name='"+identifiant+"' "
           + " or create_beneficiaire.Lname='"+identifiant+"' or avec.Names='"+identifiant+"'";
    
                            ResultSet rs=st.executeQuery(sql);
                %>
                <thead>
                    <tr>
                        <th>SOME DU CONTRIBUTION</th> 

                    </tr>
                </thead>
                <tbody>
                    <%   
                   while(rs.next()){
                    %>
                    <tr> <td align="center" ><%= rs.getInt(5) %></td>

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


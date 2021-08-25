<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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



        </section> 
        <form action="Save_Contribution.jsp" method="get">
            <%
               // String ids=request.getParameter("id");
                int identifiant=Integer.parseInt(request.getParameter("identifiant"));
                    //Integer.p request.getParameter("id");
                  //  String name=session.getAttribute("Nameee").toString();

            %>
            <table border="0" align="center">
                <tbody>
                    <tr>
                        <td></td>
                        <td><input type="hidden" name="ids" value="<%=identifiant%>" readonly="" hidden=""/></td>

                    </tr>
                             <%
                        
                        try
                     {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                    Statement st=conn.createStatement();
                   // String sql="SELECT  Id,Name, Lname, Contact, Travail,Zone_Id FROM create_beneficiaire where id ='"+g+"' or Name='"+g+"' or Lname='"+g+"' or zone='"+g+"'";
                    //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                   // String sql="select zone.Contribution from zone INNER JOIN create_beneficiaire on create_beneficiaire.Zone_Id =zone.Zone_Id where create_beneficiaire.Id='"+identifiant+"'";
                   String sqlg="SELECT create_beneficiaire.Name,create_beneficiaire.Lname,avec.zone_id,avec.Names,avec.Contribution from create_beneficiaire inner JOIN avec on create_beneficiaire.Avec_Id=Avec.Id and create_beneficiaire.Id='"+identifiant+"'";
                    ResultSet rsg=st.executeQuery(sqlg);
                    while(rsg.next()){  
String nameppp=rsg.getString(1)+" "+rsg.getString(2);
                        %>

                    <tr>
                        <td>NOM ET PRENOM</td>
                        <td><input type="text" name="namess" value="<%=nameppp%>" readonly="" required="" /></td>

                    </tr>
                      <tr>
                        <td>AVEC NAME</td>
                        <td><input type="text" name="namess" value="<%=rsg.getString(4)%>" readonly="" required=""/></td>

                    </tr>
                    <tr>
                        <td>MONTANT</td>

               
                        <td><input type="number" name="montantss" value="<%=rsg.getInt(5)%>" onclick="" required=""/></td>


                        <% 
                    
                            }
                    }catch(Exception e){
                    System.out.print(e);
                            
                    }    
                        %> 
                    </tr> 
                    <tr>
                        <td>DATE DE CONTRIBUTION</td>
                        <td><input type="Date" name="ContrDate" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>POUR LE MOIS DE:</td>
                        <td><input type="month" name="months" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Enregistre" /></td>
                    </tr>
                </tbody>
            </table>
        </form>

    </body> 

    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</html>


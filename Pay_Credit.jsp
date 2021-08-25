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
        <form action="SavePayCredit.jsp" method="get">
             <table border="0" align="center">

            <%
   
                        int id=Integer.parseInt(request.getParameter("id"));
                       // String code=(String)session.getAttribute("code").toString();
                           try
                 {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                Statement st=conn.createStatement();
                String sql=" SELECT `Nom`, `Credit_Own_Id`, `Montant`, `Interet`,`Montant_paye` FROM `credit` WHERE Id='"+id+"'";
                //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                ResultSet rs=st.executeQuery(sql);
                while(rs.next()){ 
             String OWName=rs.getString(1);
             int ssCode=rs.getInt(2);
             int mons=rs.getInt(3)+rs.getInt(4);
            %>
                <h4 align="center" style="color: red">ENREGISTRE UNE PAIEMENT DU CREDIT</h4>
                 <h6 align="center" style="color: blue">Vous pouvez change le montant restant par defaut</h6>
                <tbody>
                    <tr>
                        <td></td>
                        <td><input type="hidden" name="id" value="<%=id %>" readonly="" style="background: #ff6633"/></td>

                    </tr>
                    <tr>
                      
         
                        <td></td>
                        <td><input type="hidden" name="code" value="<%= ssCode %>" readonly="" style="background:#ff6633"/></td>

                    </tr>
                    <tr>
                        <td>NOM DU CLIENT</td>
                        <td><input type="text" name="Owner" value="<%=OWName %>" readonly="" style="background: #ff6633"/></td>

                    </tr>
                    <tr>
                        <td>MONTANT A PAYER</td>
                        <td><input type="number" name="montants" value="<%=mons %>" required="" readonly="" style="background: #ff6633" /></td> 
                    </tr>
                    <%
                    int reste=mons-rs.getInt(5);
                    %>
        
                     <tr>
                        <td>MONTANT DEJA PAYEE</td>
                        <td><input type="number" value="<%=rs.getInt(5) %>" name="amountPayeds" readonly="" required="" style="background: #ff6633"/></td>
                    </tr>
                      <tr>
                        <td>RESTE A PAYER</td>
                        <td><input type="number" value="<%=reste %>" name="amountPayedkk" /></td>
                    </tr>
   <%
                          }
                   }catch(Exception e){
                   System.out.print(e);
                            
                   }     

                    %>
                 
                   
                    <tr>
                        <td></td>
                        <td><input type="submit" value="CONFIRMER LE PAIEMENT" /></td>
                    </tr>
                </tbody>
            </table>
        </form>

    </body> 


</html>


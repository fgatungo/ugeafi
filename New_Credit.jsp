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

  <script type="text/javascript"></script>
    <script type="text/javascript">
        function sum() {
            var txtFirstNo = document.getElementById('txtFirstNo').value;
			var result = (parseInt(txtFirstNo) *10)/100;
            if (!isNaN(result)) {
                document.getElementById('txtResult').value = result;
            }
        }
    </script>
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
        <form action="SaveCredit.jsp" method="get">
            <%
               // String ids=request.getParameter("id");
                int id=Integer.parseInt(request.getParameter("id"));
                  
            %>
            <table border="1" align="center">
                <h4 align="center" style="color: red">ENREGISTRE UNE NOUVELLE CREDIT</h4>
                <tbody>
                    <tr>
                       
                        <td><input type="hidden" name="id" value="<%=id%>" readonly=""/></td>

                    </tr>
                    <%
                    
                     try
                 {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                Statement st=conn.createStatement();
                String sql=" SELECT create_beneficiaire.Name,create_beneficiaire.Lname,create_beneficiaire.Id FROM create_beneficiaire WHERE Id='"+id+"'";
                //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
                ResultSet rs=st.executeQuery(sql);
                while(rs.next()){ 
             String OWNamebn=rs.getString(1)+" "+rs.getString(2);
             int ssCode=rs.getInt(3);
            
                    
                    %>
                    
                    <tr>
                        <td>Nom et Prenom</td>
                        <td><input type="text" name="names" value="<%=OWNamebn %>" readonly="" /></td>

                    </tr>
                    
                     <%
                           }
                   }catch(Exception e){
                   System.out.print(e);
                            
                   }     

                    %>
                    <tr>
                        <td>Montant</td>
                       
                        <td> <input type="number" id="txtFirstNo" name="montant" placeholder="0" onkeyup="sum()" required=""/></td>
       
                    </tr>
                    <tr>
                        <td>Interet</td>
                        
                        <td>  <input type="text" name="interet" id="txtResult" readonly="" required="" /><td>
                    </tr>
                    <tr>
                        <td>Date de Paiyement</td>
                        <td><input type="Date" name="payDate" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Enregistre" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <h4 style="color: red" align="center">LE CREDIT IMPAYE!</h4>

        <table border="1" align="center" style="margin-top: 20px;">
            <thead>
                <tr>
                    <th>CODE</th>
                    <th>NOM</th>
                    <th>DATE DU CREDIT</th>
                    <th>MONTANT PRIS</th>
                    <th>INTERET A PAYER</th>
                    <th>DATE DE PAIEMENT</th>
                    <th>PAYER CETTE DETTE</th>
                </tr>
            </thead>
            <tbody>

                <%
              //String g="mi";
        try
         {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
        Statement st=conn.createStatement();
       // String sql="SELECT  Id,Name, Lname, Contact, Travail,Zone_Id FROM create_beneficiaire where id ='"+g+"' or Name='"+g+"' or Lname='"+g+"' or zone='"+g+"'";
        //String sql="SELECT  Id,Name, Lname, Contact, Travail FROM create_beneficiaire where Name like '%' "+g+" '%'";
        String sql="SELECT Credit.id,Credit_Own_Id,Nom,Credit_Date, Montant,Interet,Pay_Date FROM credit WHERE Credit_Own_Id='"+id+"' and status='IMPAYEE'";
        ResultSet rs=st.executeQuery(sql);
        while(rs.next()){  
                int s= rs.getInt(1);
                
                %>

                <tr>
                    <td><%= rs.getInt(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getInt(5) %></td>
                    <td><%= rs.getInt(6) %></td>
                    <td><%= rs.getString(7) %></td>
                    <td><a href="Pay_Credit.jsp?id=<%=rs.getInt(1)%>"/> PAYER </td>
                    
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

    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</html>


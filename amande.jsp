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
      
   <script>
       function multiplyBy()
{
        num1 = document.getElementById("montant").value;
        num2 = 10%;
        document.getElementById("result").innerHTML = num1 * num2;
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
        <form action="SaveAmande.jsp" method="get">
<%
   // String ids=request.getParameter("id");
    int identifiant=Integer.parseInt(request.getParameter("identifiant"));
        //Integer.p request.getParameter("id");
        

%>
            <table border="0" align="center">
              
              <h4 align="center" style="color: red">ENREGISTRE UNE AMANDE / PENALITE</h4>
                <tbody>
                     <tr>
                        <td></td>
                        <td><input type="hidden" name="id" value="<%=identifiant%>" readonly=""/></td>

                    </tr>
                    
                    
                     <%            
                               
               
                             try
                             {
                             Class.forName("com.mysql.jdbc.Driver");
                             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ugeafi", "root", "");
                             Statement st=conn.createStatement(); 
                            String sql="SELECT Name, Lname FROM create_beneficiaire where id='"+identifiant +"' ";                     
                            ResultSet rs=st.executeQuery(sql);
                  
                   while(rs.next()){
                       String namesss=rs.getString(1)+ " "+ rs.getString(2);
                %>
               
                
  <tr>
                        <td>Nom Et Prenom</td>
                        <td><input type="text" name="names" value="<%=namesss %>" /></td>

                    </tr>
                     
                  

                    <%
                                   
                }

                }catch(Exception e){
                System.out.print(e);
                            
                } 
                    %>

                    <tr>
                        <td>MONTANT</td>
                        <td><input type="number" name="montants" value="" required="" /></td>

                    </tr>
                    <tr>
                        <td>MOTIF</td>
                        <td><input type="text" name="motif" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>DATE DE PAIEMENT</td>
                        <td><input type="Date" name="payDate" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Enregistre" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
             
    </body> 
    
  
</html>


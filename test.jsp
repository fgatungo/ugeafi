<%-- 
    Document   : test
    Created on : Aug 13, 2021, 11:29:28 AM
    Author     : GATUNGO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body align="center">
        <form action="testResult.jsp" method="post">
        <table border="1" align="center">
            <thead>
               
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td><select name="Zone" id="Zone">
                            <option></option>
                            <option>Minembwe</option>
                            <option>Mikenke</option>
                        </select></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Save" /></td>
                </tr>
            </tbody>
        </table>
        </form>
        
       
         <%
            
            Object ss=session.getAttribute("zone");
        String zonee=ss.toString();
        if(zonee.equals("Minembwe")){
            %>
            
        
        <select name="zone1">
                <option><%=zonee%></option>
                
                
            </select>
            <select name="zone1">
                <option>MADEGU</option>
                <option>ISOLO</option>
                
            </select>
           
            <%
        }else{
            %>
            
            <select name="zonee2">
                <option>Mikenke</option>
                <option>Vodacom</option>
              
            </select>
            
            <%
        }
         
        %>
        
        
    </body>
</html>

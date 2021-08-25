<%-- 
    Document   : DateBetween
    Created on : Aug 15, 2021, 1:24:24 PM
    Author     : GATUNGO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>SELECT DATA BETWEEN </h1>
        <form action="Selecting.jsp">
            <table border="1">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>DATE 1</td>
                        <td><input type="date" name="1" value="" /></td>
                    </tr>
                    <tr>
                        <td>DATE 2</td>
                        <td><input type="date" name="2" value="" /></td>
                    </tr><input type="submit" value="SEARCH" />
                </tbody>
            </table>

            
            
        </form>
        
        
    </body>
</html>

<%-- 
    Document   : tryLoop
    Created on : Aug 14, 2021, 5:46:27 PM
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
        <h1>TRY LOOP</h1>
        <%
        int i=5;
        for(i=0;i<5;i++){
        %>
        <table border="1">
             
            <tbody>
                <tr>
                    <td><%=i%></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
            <input type="submit" value="ok" />
        </table>
<%
    }

%>
    </body>
</html>

<%-- 
    Document   : testResult
    Created on : Aug 13, 2021, 11:33:56 AM
    Author     : GATUNGO
--%>

<%
String zone=request.getParameter("Zone");
session.setAttribute("zone",zone);
  
%><jsp:include page="test.jsp"/>

<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  models.User: jeremybrown
  Date: 2016-09-30
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if (request.getSession().getAttribute("sessionUser") == null) {
    response.sendRedirect("../login.jsp");
}%>
<html>
<head>
    <title>Search Catalog</title>
</head>
<body>
    <%@include file="../hidden/search-query.jsp"%>

    <% Map<String, String[]> params = request.getParameterMap(); %>
    <% if (params.get("query") != null && params.get("queryType") != null) { %>
        <%@include file="../hidden/search-results.jsp"%>
    <% } %>
</body>
</html>

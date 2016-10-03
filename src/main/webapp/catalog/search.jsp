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
    <title>Search</title>
    <%@include file="../hidden/header-imports.jsp"%>

</head>
<body>
    <%@include file="../hidden/navbar.jsp"%>

    <div class="container">
            <% Map<String, String[]> params = request.getParameterMap(); %>
            <% if (params.get("query") == null && params.get("queryType") == null) { %>
            <%@include file="../hidden/search-standalone.jsp"%>
            <% } else {%>
            <%@include file="../hidden/search-results.jsp"%>
            <% } %>
    </div>

    <%@include file="../hidden/footer.jsp"%>
</body>
</html>

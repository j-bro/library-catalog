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
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="../res/materialize/css/materialize.min.css">
    <!-- Compiled and minified JavaScript -->
    <script src="../res/materialize/js/materialize.min.js"></script>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col s12 m6 offset-m3">
                <h1>Search Catalog</h1>
                <%@include file="../hidden/search-query.jsp"%>

                <% Map<String, String[]> params = request.getParameterMap(); %>
                <% if (params.get("query") != null && params.get("queryType") != null) { %>
                    <%@include file="../hidden/search-results.jsp"%>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>

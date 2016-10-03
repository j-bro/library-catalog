<%--
  Created by IntelliJ IDEA.
  models.User: jeremybrown
  Date: 2016-09-30
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="hidden/header-imports.jsp"%>
</head>
<body>
    <%@include file="hidden/navbar.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col s12 m6 offset-m3">
                <h2>Login</h2>

                <form method="post" action="login">
                    <div class="row">
                        <div class="input-field">
                            <input placeholder="Username" id="user" type="text" name="user" class="validate">
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field">
                            <input placeholder="Password" id="pass" type="password" name="pass" class="validate">
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field">
                            <button class="waves-effect waves-light btn-large" type="submit">Login</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@include file="hidden/footer.jsp"%>
</body>
</html>

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
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="res/materialize/css/materialize.min.css">
    <!-- Compiled and minified JavaScript -->
    <script src="res/materialize/js/materialize.min.js"></script>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col s12 m6 offset-m3">
                <h1>Login</h1>

                <form method="post" action="AuthHandler">
                    Username :<input type="text" name="user" /><br/><br/>
                    Password :<input type="password" name="pass" /><br/><br/>
                    <input type="submit" value="Login" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>

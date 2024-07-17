<%-- 
    Document   : login
    Created on : Jul 8, 2024, 1:25:15 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method="POST">
            username <input type="text" name="username" value="" /> 
            <br/>
            password <input type="password" name="password" value="" />
            <br/>
            <input type="submit" value="Login" />
        </form>
    </body>
</html>

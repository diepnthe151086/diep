<%-- 
    Document   : circle
    Created on : Jan 15, 2024, 4:43:16 AM
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Circle" %>
<%@page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Circle> circles = (ArrayList<Circle>)request.getAttribute("circles");
        %>
    </head>
    <body>
        <canvas id="myCanvas" width="1000" height="570" style="border:1px solid grey"></canvas>
        <script>
            const c = document.getElementById("myCanvas");
            const ctx = c.getContext("2d");
            <%for (Circle circle : circles) {%>
                ctx.fillStyle = "rgb(<%=circle.getRed()%>,<%=circle.getGreen()%>,<%=circle.getBlue()%>)";
                ctx.beginPath();
                ctx.arc(<%=circle.getX()%>,<%=circle.getY()%>,<%=circle.getRadius()%>,0,2*Math.PI);
                ctx.fill();
                ctx.closePath();
            <%}%>
        </script>
    </body>
</html>

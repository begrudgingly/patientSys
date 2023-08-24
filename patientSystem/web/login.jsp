<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="css/styling.css" type="text/css" rel="stylesheet" media="all" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>
    <body>
        
        <div class="container" style="width: 25%; margin-top: 125px;">
        <h1>Login as Staff</h1>
        <form action="loginAuthenticate.jsp" >
        <table class="formTable">
            <tr>
                <td>Staff Hp. No</td>
                <td><input type="text" class="fld" name="staffHPNo"/></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" class="fld" name="staffPassword"/></td>
            </tr>
        </table><br>
        <input class="colored" type="submit" value="Log in" />
        </form>
        <c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
        </c:if>
        
        </div>
        
    </body>
</html>
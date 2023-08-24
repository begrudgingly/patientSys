<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Authentication page</title>
  </head>
  <body>
    <c:if test="${ empty param.staffHPNo or empty param.staffPassword}">
      <c:redirect url="login.jsp" >
              <c:param name="errMsg" value="Please Enter Your Login Credentials" />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.staffHPNo and not empty param.staffPassword}">
      <s:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
                       url="jdbc:derby://localhost:1527/medicalDB"
                       user="app" password="app"/>
 
      <s:query dataSource="${myDatasource}" var="selectQ">
        select count(*) as kount from staff
        where staffHPNo = '${param.staffHPNo}'
        and staffPassword = '${param.staffPassword}'
      </s:query>
 
      <c:forEach items="${selectQ.rows}" var="r">
        <c:choose>
          <c:when test="${r.kount gt 0}">
            <c:set scope="session"
                   var="loginUser"
                   value="${param.staffHPNo}"/>
            <c:redirect url="index.jsp"/>
          </c:when>
          <c:otherwise>
            <c:redirect url="login.jsp" >
              <c:param name="errMsg" value="Login Credentials do not Match" />
            </c:redirect>
          </c:otherwise>
        </c:choose>
 
      </c:forEach>
 
    </c:if>
 
  </body>
</html>
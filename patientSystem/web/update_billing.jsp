<%-- 
    Author     : fatin
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/medicalDB" user="app" password="app"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Billing</title>
        <link href="css/styling.css" type="text/css" rel="stylesheet" media="all" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>
    
    <body>
        <c:set var="consultID" value="${param.consultID}"/>
        <c:set var="billTotal" value="${param.billTotal}"/>
        <c:set var="amountPaid" value="${param.amountPaid}"/> 
        
        <c:if test="${(consultID!=null) && (billTotal!=null) && (amountPaid!=null)}" var="result">
            <c:catch var="exception">
                <sql:update var="result" dataSource="${myDatasource}">
                    update billings set billTotal = ?, amountPaid = ? where consultID = ?
                    
                    <sql:param value="${billTotal}"/> 
                    <sql:param value="${amountPaid}"/>
                    <sql:param value="${consultID}"/>
                </sql:update>
            </c:catch>
        </c:if>
        
        <%@include file="/header.jsp" %>
        <div class="topnav">
                <nav class="sideNav">
                    <a href="#" class="closeBtn">&times;</a>
                    <a class="mainlink" href="view_patient.jsp">Patients</a>
                    <a class="mainlink" href="view_medicine.jsp">Medicines</a>
                    <a class="mainlink" href="view_consultation.jsp">Consultations</a>
                    <a class="mainlink" href="view_billing.jsp">Billings</a>
                    <a class="mainlink" href="view_treatment.jsp">Treatment</a>
                </nav>
            <button class="openSideNav">
                <i class="material-icons" style="font-size:23px;">menu</i>
            </button>
            <div style="position: absolute; right: 25px; top: 35px;">
                <c:out value="${sessionScope['loginUser']}" /> // 
                <a href="logout.jsp">LOG OUT</a>
            </div>
        </div>
        
        <div class="container" style="margin-top: 125px;">
        <h1>Update Billing Information</h1>
     
        <form action="update_billing.jsp" method="POST">
        <table class="formTable">
            <tr>
               <td>Billing ID</td>
               <td><select class="selector" name="consultID">
                       <sql:query var="result" dataSource="${myDatasource}">
                           SELECT consultID FROM billings
                       </sql:query>
                       <c:forEach var="row" items="${result.rowsByIndex}">
                           <c:forEach var="column" items="${row}">
                               <option>
                                   <c:out value="${column}"/>
                               </option>
                           </c:forEach>
                       </c:forEach>
                   </select>
               </td>
            </tr>
            <tr>
               <td>Total Bill(RM)</td>
               <td><input class="fld" type="number" min="1" name="billTotal"></td>
            </tr>
            <tr>
               <td>Amount Paid(RM)</td>
               <td><input class="fld" type="number" min="1" name="amountPaid"></td>
            </tr>
        </table><br>
        <input class="colored" type="submit" value="Update Information">
        </form>
      </div>
                
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM billings
        </sql:query>
        
        <div class="container">
        <table class="listTable">
            <tr>
                <th>ID</th>
                <th>Date Issued</th>
                <th>Total Bill(RM)</th>
            </tr>
            
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
        </div>

<script>
    let openBtn = document.querySelector(".openSideNav");
    openBtn.addEventListener("click", () => {
        showNav();
    });
    
    let closeBtn = document.querySelector(".closeBtn");
    closeBtn.addEventListener("click", () => {
        hideNav();
    });
    
    function showNav() {
        document.querySelector(".sideNav").style.width = "300px";
        document.querySelector('.main-content').style.marginLeft = "300px";
    }

    function hideNav() {
        document.querySelector(".sideNav").style.width = "0";
        tor('.main-content').style.marginLeft = "0px";
    }
</script>
    </body>
</html>

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
        <title>Add Patient</title>
        <link href="css/styling.css" type="text/css" rel="stylesheet" media="all" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>
    
    <body>
        <c:set var="patientID" value="${param.patientID}"/>
        <c:set var="patientFName" value="${param.patientFName}"/>
        <c:set var="patientLName" value="${param.patientLName}"/> 
        <c:set var="patientHPNo" value="${param.patientHPNo}"/> 
        <c:set var="patientAge" value="${param.patientAge}"/> 
        <c:set var="patientGender" value="${param.patientGender}"/> 
        
        <c:if test="${(patientID!=null) && (patientFName!=null) && (patientLName!=null) && (patientHPNo!=null) && (patientAge!=null) && (patientGender!=null)}" var="result">
            <c:catch var="exception">
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO patient VALUES (?,?,?,?,?,?)
                
                <sql:param value="${patientID}"/>
                <sql:param value="${patientFName}"/>
                <sql:param value="${patientLName}"/> 
                <sql:param value="${patientHPNo}"/> 
                <sql:param value="${patientAge}"/> 
                <sql:param value="${patientGender}"/> 
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
        <h1>Add a Patient</h1>
     
        <form action="add_patient.jsp" method="POST">
        <table class="formTable">
            <tr>
               <td>Patient ID</td>
               <td><input class="fld" type="number" min="1000" name="patientID"></td>
            </tr>
            <tr>
               <td>First Name</td>
               <td><input class="fld" type="text" name="patientFName"></td>
            </tr>
            <tr>
               <td>Last Name</td>
               <td><input class="fld" type="text" name="patientLName"></td>
            </tr>
            <tr>
               <td>Contact No.</td>
               <td><input class="fld" type="text" name="patientHPNo"></td>
            </tr>
            <tr>
               <td>Age</td>
               <td><input class="fld" type="number" min="1" name="patientAge"></td>
            </tr>
            <tr>
               <td>Gender</td>
               <td>
                   <select class="selector" name="patientGender">
                       <option value="F">Female</option>
                       <option value="M">Male</option>
                   </select>
               </td>
            </tr>
        </table><br>
        <input class="colored" type="submit" value="Add Patient">
        </form>
      </div>
                
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM patient
        </sql:query>
        
        <div class="container">
        <table class="listTable">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Contact No.</th>
                <th>Age</th>
                <th>Gender</th>
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

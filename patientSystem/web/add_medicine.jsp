<%-- 
    Author     : fatin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/styling.css" type="text/css" rel="stylesheet" media="all" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    </head>
    <body>
        
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
        <h1>Add Medicine</h1>
     
        <form action="addMedicine" method="POST">
        <table class="formTable">
            <tr>
               <td>Medicine ID</td>
               <td><input class="fld" type="number" min="3000" name="txt_id" id="medicineID"></td>
            </tr>
            <tr>
               <td>Medicine Name</td>
               <td><input class="fld" type="text" name="txt_name" id="medicineName"></td>
            </tr>
            <tr>
               <td>Medicine Purpose</td>
               <td><input class="fld" type="text" name="txt_purpose" id="medicinePurpose"></td>
            </tr>
            <tr>
               <td>Stock Qty.</td>
               <td><input class="fld" type="number" min="1" name="txt_quantity" id="medicineStock"></td>
            </tr>
            
        </table><br>
        <input class="colored" name="btn_add" type="submit" value="Add Medicine">
        
        <%
            if(request.getAttribute("InsertErrorMsg")!=null)
            {
                out.println(request.getAttribute("InsertErrorMsg"));
            }
        %>
        </form>
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

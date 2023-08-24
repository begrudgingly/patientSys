<%-- 
    Author     : fatin
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Medicine</title>
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
        <table class="listTable">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Stock Qty.</th>
                <th>Edit</th>
            </tr>
            <%
                    String url = "jdbc:derby://localhost:1527/medicalDB";
                    String username = "app";
                    String password = "app";
                  
                try
                {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection conn = DriverManager.getConnection(url,username,password);
                  
                    PreparedStatement qry = null;
                  
                    qry = conn.prepareStatement("SELECT * FROM medicine"); 
                    ResultSet rs = qry.executeQuery();
                    
                    while(rs.next())
                    {
                %>
                <tr>
                    <td><%=rs.getInt("medicineID")%></td>
                    <td><%=rs.getString("medicineName")%></td>
                    <td><%=rs.getString("medicinePurpose")%></td>
                    <td><%=rs.getInt("medicineStock")%></td>
                    
                    <td>
                        <a href="update_medicine.jsp?edit_id=<%=rs.getInt("medicineID")%>">Edit</a> /
                        <a href="delete_medicine.jsp?delete_id=<%=rs.getInt("medicineID")%>">Delete</a>
                    </td>
		</tr>
                <%
                    }
                    qry.close();
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                %>
        </table>
        </div>
        
        <div class="container">
            <a href="add_medicine.jsp"><input class="colored" type="submit" value="Add Medicine to List"></a>
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

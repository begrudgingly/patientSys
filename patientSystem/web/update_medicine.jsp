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
        <title>JSP Page</title>
        <link href="css/styling.css" type="text/css" rel="stylesheet" media="all" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    </head>
    <body>
        
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
        </div>
        
       
        <div class="container" style="margin-top: 125px;">
        <h1>Update Medicine Information</h1>
        <form method="POST" action="updateMedicine">    
            <table class="formTable">	        
            <%
            if(request.getParameter("edit_id")!=null)
            {
                int medicineID = Integer.parseInt(request.getParameter("edit_id"));
                
                String url = "jdbc:derby://localhost:1527/medicalDB";
                String username = "app";
                String password = "app";
                
                try
                {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection conn = DriverManager.getConnection(url,username,password);
                    PreparedStatement qry = null;
                    
                    qry = conn.prepareStatement("SELECT * FROM medicine WHERE medicineID = ?"); //sql select query 
                    qry.setInt(1,medicineID);
                    ResultSet rs = qry.executeQuery(); //execute query and set in Resultset object rs.
                    
                    while(rs.next())
                    {
            %>
                <tr>
                    <td>Medicine Name</td>
                    <td><input class="fld" type="text" name="txt_name" id="medicineName" value="<%=rs.getString("medicineName")%>"></td>
                </tr>
				
                <tr>
                    <td>Medicine Purpose</td>
                    <td>
                    <textarea class="txtarea" name="txt_purpose" id="medicinePurpose" rows="4" placeholder="<%=rs.getString("medicinePurpose")%>">
                   </textarea></td>
                </tr>	
                <tr>
                    <td>Stock Qty.</td>
                    <td><input class="fld" type="number" min="0" name="txt_quantity" id="medicineQuantity" value="<%=rs.getInt("medicineStock")%>"></td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="hidden_id" value="<%=rs.getInt("medicineID")%>">
                    </td>
                </tr>
            <%
                    }
                    qry.close(); //close statement

                    conn.close(); //close connection
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            %>
            </table><br>
            <input class="colored" type="submit" name="btn_edit" value="Update Information">
            <center>
                <h3 style="color:red;">
                    <%
                        if(request.getAttribute("UpdateErrorMsg")!=null)
                        {
                            out.print(request.getAttribute("UpdateErrorMsg")); //get update record fail error message from EditController.java
                        }
                    %>
                </h3>
            </center>		
        </form>
        </div>
        
        <div class="container">
        <table class="listTable">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Stock Qty.</th>
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

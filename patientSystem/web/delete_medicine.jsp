<%-- 
    Author     : fatin
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%
    if(request.getParameter("delete_id")!=null)
    {
        int medicineID = Integer.parseInt(request.getParameter("delete_id"));
        
        String url = "jdbc:derby://localhost:1527/medicalDB";
        String username = "app";
        String password = "app";
        
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(url,username,password);
            
            PreparedStatement qry = null; //create statement
            
            qry = conn.prepareStatement("DELETE from medicine WHERE medicineID = ?");
            qry.setInt(1,medicineID);
            qry.executeUpdate();

            RequestDispatcher rd = request.getRequestDispatcher("view_medicine.jsp");
            rd.forward(request, response); 
            
            qry.close(); 
            conn.close();  
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
%>
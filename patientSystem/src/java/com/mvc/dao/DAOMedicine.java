/**
 *
 * @author fatin
 */
package com.mvc.dao;

import com.mvc.bean.BeanMedicine;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DAOMedicine {
    public String checkInsert(BeanMedicine addBean)
    {
        String medicineID = addBean.getID();
        String medicineName = addBean.getName();
        String medicinePurpose = addBean.getPurpose();
        String medicineQuantity = addBean.getQuantity();
        
        String url = "jdbc:derby://localhost:1527/medicalDB";
        String username = "app";
        String password = "app";
        
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(url,username,password);

            PreparedStatement qry = null;
            
            qry = conn.prepareStatement("INSERT INTO medicine VALUES (?,?,?,?)");
            qry.setString(1,medicineID);
            qry.setString(2,medicineName);
            qry.setString(3,medicinePurpose);
            qry.setString(4,medicineQuantity);
            qry.executeUpdate();
            
            qry.close();
            conn.close();
                
            return "INSERT SUCCESS";
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
            
        return "INSERT FAIL";
    }  
}

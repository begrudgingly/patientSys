/**
 *
 * @author fatin
 */
package com.mvc.dao;

import com.mvc.bean.BeanUpdate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DAOUpdate {
    public String checkUpdate(BeanUpdate updateBean)
    {
        String medicineName = updateBean.getName();
        String medicinePurpose = updateBean.getPurpose();
        String medicineQuantity = updateBean.getQuantity();
        int hidden_id = updateBean.getHidden_ID();
        
        String url = "jdbc:derby://localhost:1527/medicalDB";
        String username = "app";
        String password = "app";
        
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(url,username,password);
            
            PreparedStatement qry = null;
            
            qry = conn.prepareStatement("UPDATE medicine SET medicineName = ?, medicinePurpose = ?, medicineStock = ? WHERE medicineID = ?");
            qry.setString(1,medicineName);
            qry.setString(2,medicinePurpose);
            qry.setString(3,medicineQuantity);
            qry.setInt(4,hidden_id);
            qry.executeUpdate();
            
            qry.close();
            conn.close();
            
            return "UPDATE SUCCESS";
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return "UPDATE FAIL";
    }
}

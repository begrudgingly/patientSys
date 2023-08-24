/**
 *
 * @author fatin
 */
package com.mvc.bean;

public class BeanMedicine{
    private String medicineID, medicineName, medicinePurpose, medicineQuantity;
    
    public String getID() { return medicineID; }
    public String getName() { return medicineName; }
    public String getPurpose() { return medicinePurpose; }
    public String getQuantity() { return medicineQuantity; }
    
    public void setID(String medicineID) 
    { 
        this.medicineID = medicineID; 
    }
    public void setName(String medicineName) 
    { 
        this.medicineName = medicineName; 
    }
    
    public void setPurpose(String medicinePurpose) 
    { 
        this.medicinePurpose = medicinePurpose; 
    }
    
    public void setQuantity(String medicineQuantity) 
    { 
        this.medicineQuantity = medicineQuantity; 
    }    
}
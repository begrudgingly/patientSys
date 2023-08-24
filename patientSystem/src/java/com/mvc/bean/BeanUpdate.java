/**
 *
 * @author fatin
 */
package com.mvc.bean;


public class BeanUpdate {
    private String medicineName, medicinePurpose, medicineQuantity;
    private int hidden_id;
    
    public String getName() { return medicineName; }
    public String getPurpose() { return medicinePurpose; }
    public String getQuantity() { return medicineQuantity; }
    public int getHidden_ID() { return hidden_id; }
    
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
    
    public void setHiddenID(int hidden_id) {
        this.hidden_id = hidden_id;
    }
}

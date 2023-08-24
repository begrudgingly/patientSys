/**
 *
 * @author fatin
 */
package com.mvc.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.BeanUpdate;
import com.mvc.dao.DAOUpdate;

public class updateMedicine extends HttpServlet 
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        if(request.getParameter("btn_edit")!=null)
        {
            String medicineName = request.getParameter("txt_name");
            String medicinePurpose = request.getParameter("txt_purpose");
            String medicineQuantity = request.getParameter("txt_quantity");
            int hidden_id = Integer.parseInt(request.getParameter("hidden_id"));
            
            BeanUpdate updateBean = new BeanUpdate();
            
            updateBean.setName(medicineName);
            updateBean.setPurpose(medicinePurpose);
            updateBean.setQuantity(medicineQuantity);
            updateBean.setHiddenID(hidden_id);
            
            DAOUpdate updateDAO = new DAOUpdate();
            
            String updateValidate = updateDAO.checkUpdate(updateBean); 
            
            if(updateValidate.equals("UPDATE SUCCESS"))
            {
                request.setAttribute("UpdateSuccessMsg",updateValidate);
                RequestDispatcher rd = request.getRequestDispatcher("view_medicine.jsp");
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("UpdateErrorMsg",updateValidate);
                RequestDispatcher rd = request.getRequestDispatcher("update_medicine.jsp");
                rd.include(request, response);
            }
        }
    }
}
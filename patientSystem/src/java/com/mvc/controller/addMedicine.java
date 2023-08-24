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

import com.mvc.bean.BeanMedicine;
import com.mvc.dao.DAOMedicine;

public class addMedicine extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        if(request.getParameter("btn_add")!=null)
        {
            String medicineID = request.getParameter("txt_id");
            String medicineName = request.getParameter("txt_name");
            String medicinePurpose = request.getParameter("txt_purpose");
            String medicineQuantity = request.getParameter("txt_quantity");
            
            BeanMedicine addBean = new BeanMedicine();
            
            addBean.setID(medicineID);
            addBean.setName(medicineName);
            addBean.setPurpose(medicinePurpose);
            addBean.setQuantity(medicineQuantity);
            
            DAOMedicine addDAO = new DAOMedicine();
            
            String insertValidate = addDAO.checkInsert(addBean);
            
            if(insertValidate.equals("INSERT SUCCESS"))
            {
                request.setAttribute("InsertSuccessMsg",insertValidate);
                RequestDispatcher rd = request.getRequestDispatcher("view_medicine.jsp");
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("InsertErrorMsg",insertValidate);
                RequestDispatcher rd = request.getRequestDispatcher("add_medicine.jsp");
                rd.include(request, response);
            }
        }
    }
}
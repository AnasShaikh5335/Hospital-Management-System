/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

import com.dao.DoctorDao;
import com.db.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        int id=Integer.parseInt(req.getParameter("id"));
        
         DoctorDao dao=new DoctorDao(DBConnect.getCon());
            HttpSession session=req.getSession();
            
            if(dao.deleteDoctor(id))
            {
             session.setAttribute("succMsg", "Doctor deleted Sucessfully");
             resp.sendRedirect("admin/view_doctor.jsp");
            }else{
                session.setAttribute("errorMsg", "Something  went wrong on server");
                resp.sendRedirect("admin/view_doctor.jsp");
            }

    }
    
    
    
}

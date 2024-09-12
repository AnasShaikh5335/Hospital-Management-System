/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
          try {
            String fullName=req.getParameter("fullname");
            String dob=req.getParameter("dob");
            String qualification=req.getParameter("qualification");
            String spec=req.getParameter("spec");
            String email=req.getParameter("email");
            String mobno=req.getParameter("mobno");
            String password=req.getParameter("password");
            
            int id=Integer.parseInt(req.getParameter("id"));
            
            Doctor d= new Doctor( id,fullName, dob, qualification, spec, email, mobno, password);
            
            DoctorDao dao=new DoctorDao(DBConnect.getCon());
            HttpSession session=req.getSession();
            
            if(dao.updateDoctor(d))
            {
             session.setAttribute("succMsg", "Doctor update Successfully");
             resp.sendRedirect("admin/view_doctor.jsp");
            }else{
                session.setAttribute("errorMsg", "Something  went wrong on server");
                resp.sendRedirect("admin/view_doctor.jsp");
            }
            
            
                        
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
    


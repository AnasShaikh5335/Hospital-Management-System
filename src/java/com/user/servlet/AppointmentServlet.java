/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/appAppointment")
public class AppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId=Integer.parseInt(req.getParameter("userid"));
        String fullname=req.getParameter("fullname");
        String gender=req.getParameter("gender");
        String age=req.getParameter("age");
        String appoint_date=req.getParameter("appoint_date");
        String email=req.getParameter("email");
        String phno=req.getParameter("phno");
        String diseases=req.getParameter("diseases");
        int doctor_id=Integer.parseInt(req.getParameter("doct"));
        String address=req.getParameter("address");
        
        Appointment ap=new Appointment(userId,fullname,gender,age,appoint_date,email,phno,diseases,doctor_id,address,"Pending");
        
        AppointmentDAO dao =new AppointmentDAO(DBConnect.getCon());
        HttpSession session=req.getSession();
        
        if(dao.addAppointment(ap))
        {
            session.setAttribute("succMsg", "Appointment Successfull");
            resp.sendRedirect("user_appointment.jsp");
        }else{
              session.setAttribute("errorMSg", "Something Wrong on server");
            resp.sendRedirect("user_appointment.jsp");
        }
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.doctor.servlet;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id=Integer.parseInt(req.getParameter("id"));
            int did=Integer.parseInt(req.getParameter("did"));
            String  comm=req.getParameter("comm");
            
            AppointmentDAO dao=new AppointmentDAO(DBConnect.getCon());
            
            HttpSession session=req.getSession();
            
            if(dao.updateCommentStatus(id, did, comm))
            {
                session.setAttribute("succMsg", "Comment Update");
                resp.sendRedirect("doctor/patient.jsp");
            }else{
                session.setAttribute("errorMsg","Something wrong on Server");
                resp.sendRedirect("doctor/patient.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}

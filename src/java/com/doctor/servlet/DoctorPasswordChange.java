/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.doctor.servlet;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet{
    
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");

        DoctorDao dao = new DoctorDao(DBConnect.getCon());
        HttpSession session = req.getSession();

        if (dao.checkOldPassword(uid, oldPassword)) {
            if (dao.changePassword(uid, newPassword)) {
                session.setAttribute("succMsg", "Password Change Successfully");
                resp.sendRedirect("doctor/edit_profile.jsp");
            } else {
                session.setAttribute("errorMsg", "Something Went Wrong on Server");
             resp.sendRedirect("doctor/edit_profile.jsp");
            }
        } else {
            session.setAttribute("errorMsg", "old Password Incorect");
            resp.sendRedirect("doctor/edit_profile.jsp");
        }
    }


}

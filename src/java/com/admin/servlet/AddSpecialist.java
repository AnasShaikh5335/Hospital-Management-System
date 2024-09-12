/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;
import com.dao.SpecialistDao;
import com.db.DBConnect;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String specName=req.getParameter("specName");
       
       SpecialistDao dao=new SpecialistDao(DBConnect.getCon());
       boolean f=dao.addSpecialist(specName);
       
       HttpSession session=req.getSession();
       
       if(f){
                session.setAttribute("succMsg", "Specialist Added");
                resp.sendRedirect("admin/index2.jsp");
            }else{
                session.setAttribute("errorMsg","Something wrong on server");
                resp.sendRedirect("admin_login.jsp");
                
            }
    }
    
}

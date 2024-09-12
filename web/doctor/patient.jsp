<%-- 
    Document   : patient
    Created on : Mar 13, 2024, 10:48:53 PM
    Author     : Anas Shaikh
--%>

<%@page import="javax.xml.stream.events.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <%@include file="../component/allcss.jsp" %>
        
          <style type="text/css">
            .point-card{
                box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
                margin: 3px;
            }
            </style>

    </head>
    <body>
            <c:if test="${empty doctObj}">
            <c:redirect url="../doctor_login.jsp"></c:redirect>
        </c:if>
        
        <%@include file="navbar.jsp" %>
        
        <div class="container p-3">
            <div class="row">
                
                <div class="col-md-12">
                    <div class="card point-card">
                        <div class="card-body">
                            <p class="fs-4 text-center">Patient Details</p>
                            
                            <c:if test="${not empty errorMsg}">
                               <p class="text-center text-danger fs-3">${errorMsg}</p>
                               <c:remove var="errorMsg" scope="session"/>
                           </c:if>
                               
                                  <c:if test="${not empty succMsg}">
                               <p class="text-center text-success fs-3">${succMsg}</p>
                               <c:remove var="succMsg" scope="session" />
                           </c:if>
                               
                                <table class="table">
                                   <thead>
                                       <tr>
                                           <th scope="col">Full Name</th>
                                           <th scope="col">Gender</th>
                                           <th scope="col">Age</th>
                                           <th scope="col">Appointment Date</th>
                                           <th scope="col">Email</th>
                                           <th scope="col">Mobile No</th>
                                           <th scope="col">Disease</th>
                                           <th scope="col">Status</th>
                                           <th scope="col">Action</th>
                                       </tr>
                                   </thead>
                                       <tbody>
                                       <%
                                        Doctor d=(Doctor) session.getAttribute("doctObj");
                                        AppointmentDAO dao = new AppointmentDAO (DBConnect.getCon());
                                        List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
                                        for(Appointment ap: list){
                                       %>
                                       <tr>
                                           <th><%=ap.getFullName() %></th>
                                           <td><%=ap.getGender() %></</td>
                                           <td><%=ap.getAge() %></</td>
                                           <td><%=ap.getAppoinDate()%></</td>
                                           <td><%=ap.getEmail() %></</td>
                                             <td><%=ap.getPhNo() %></</td>
                                           <td><%=ap.getDiseases() %></</td>
                                           <td><%=ap.getStatus()%></</td>
                                           <td>
                                               <% 
                                               if("Pending".equals(ap.getStatus()))
                                               {%>
                                                    <a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-sm">Comment</a>
                                               <%}else{%>
                                                   <a href="#" class="btn btn-success btn-sm disabled">Comment</a>
                                              <% }

                                               %>
                                               
                                              
                                               
                                           </td>
                                       </tr>
                                       <%
                                           }
                                        %>

                                   </tbody>
                               </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        
    </body>
</html>

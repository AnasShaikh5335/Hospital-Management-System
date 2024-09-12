

<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--using this lines we can't open same page in any other url after logging out-->
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
        
       
        <p class="text-center fs-3">Doctor Dashboard</p>
        
        
        <%
           Doctor d=(Doctor) session.getAttribute("doctObj");
            DoctorDao dao=new DoctorDao(DBConnect.getCon()); %>
        
         <div class="container p-5">
            <div class="row">
                              <div class="col-md-4 offset-md-2">
                    <div class="card point-card">
                        <div class="card-body text-center text-success">
                            <i class="fas fa-user-md fa-3x"></i><br>
                            <p class="fs-4 text-center">Doctor <br><%=dao.countDoctor()%></p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card point-card">
                        <div class="card-body text-center text-success">
                            <i class="far fa-calendar-check fa-3x"></i><br>
                            <p class="fs-4 text-center">Total Appointment <br> <%=dao.countAppointmentByDoctorId(d.getId())%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>

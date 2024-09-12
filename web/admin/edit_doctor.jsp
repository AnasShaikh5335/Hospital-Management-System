

<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <%@include file="navbar.jsp" %>

        <div class="container-fluid p-3">
            <div class="row">

                <div class="col-md-4 offset-md-4">
                    <div class="card point-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Edit Doctor Details</p>

                            <c:if test="${not empty errorMsg}">
                                <p class="fs-3 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty errorMsg}">
                                <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>
                                
                                <%
                                  int id= Integer.parseInt(request.getParameter("id"));
                                    DoctorDao dao2=new DoctorDao(DBConnect.getCon());
                                Doctor d=dao2.getDoctorById(id);
                                %>

                            <form action="../updateDoctor" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" required name="fullname" class="form-control" value="<%=d.getFullName()%>"/>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">DOB</label>
                                    <input type="date" value="<%=d.getDob()%>" required name="dob" class="form-control"/>
                                </div>


                                <div class="mb-3">
                                    <label class="form-label">Qualification</label>
                                    <input type="text" value="<%=d.getQualification()%>" required name="qualification" class="form-control"/>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Specialist</label>
                                    <select name="spec" required class="form-control">
                                        <option><%=d.getSpecialist()%></option>

                                        <%
                                            SpecialistDao dao = new SpecialistDao(DBConnect.getCon());
                                            List<Specalist> list = dao.getAllSpecalist();
                                            for (Specalist s : list) {
                                        %>
                                        <option><%=s.getSpecialistName()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>


                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="text" value="<%=d.getEmail()%>" required name="email" class="form-control"/>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mobile Number</label>
                                    <input type="text" value="<%=d.getMobNo()%>" required name="mobno" class="form-control"/>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Password</label>
                                    <input type="text" value="<%=d.getPassword()%>" required name="password" class="form-control"/>
                                </div>
                                
                                <input type="hidden" name="id" value="<%=d.getId()%>"> 

                                <input type="submit" class="btn btn-primary col-md-12" value="Update"/>


                            </form>
                        </div> 
                    </div>
                </div>


            </div>                        


        </div>




    </body>
</html>


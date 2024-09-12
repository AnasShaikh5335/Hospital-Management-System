

<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
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
        <!--we cant access admin page with url directly if the object is empty-->

    <c:if test="${ empty adminObj}">
        <c:redirect url="../admin_login.jsp"></c:redirect>
    </c:if>

    <div class="container p-5">

        <p class="text-center fs-3 text-success">Admin Dashboard</p>

        <c:if test="${not empty errorMsg}">
            <p class=" fs-3 text-center text-danger">${errorMsg}</p>
            <c:remove var="errorMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty succMsg}">
            <div class="fs-3 text-center text-success " role="alert">${succMsg}</div>
            <c:remove var="succMsg" scope="session"/>
        </c:if>
            
            <% DoctorDao dao=new DoctorDao(DBConnect.getCon());%>
            
        <div class="row">
            <div class="col-md-4">
                <div class="card point-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-user-md fa-3x "></i><br><!-- comment -->
                        <p class="fs-4 text-center">Doctor <br><%=dao.countDoctor() %></p>
                    </div>
                </div>
            </div>
            



            <div class="col-md-4">
                <div class="card point-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-user-circle fa-3x"></i><br><!-- comment -->
                        <p class="fs-4 text-center">user<br><%=dao.countUser()%></p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card point-card">
                    <div class="card-body text-center text-success">
                        <i class="far fa-calendar-check fa-3x"></i><br>
                        <p class="fs-4 text-center">Total Appointment <br><%=dao.countAppointment()%></p>
                    </div>
                </div>
            </div>

              <div class="col-md-4 mt-2">
                  
                <div class="card point-card" data-bs-toggle="modal" data-bs-target="#specialist">
                    <div class="card-body text-center text-success">
                        <i class="far fa-calendar-check fa-3x"></i><br>
                        <p class="fs-4 text-center">Specialist <br><%=dao.countSpecialist()%></p>
                    </div>
                </div>
            </div>
    </div>
</div>                


        
        
        <div class="modal fade" id="specialist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form action="../addSpecialist" method="post">
              <div class="form-group">
                  <label>Enter Specialist Name</label>
                  <input type="text" name="specName" class="form-control"/>
              </div>
                  <div class="text-center mt-3">
                      <input type="submit" class="btn btn-primary " value="Add"/>
                  </div>
           </form>
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>

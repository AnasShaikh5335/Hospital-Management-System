<%-- 
    Document   : doctor_login
    Created on : Mar 1, 2024, 6:13:30 PM
    Author     : Anas Shaikh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="component/allcss.jsp" %>
        
         <style type="text/css">
            .point-card{
                box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
                margin: 3px;
            }
            </style>

    </head>
    <body>
        
        <%@include file="component/navbar.jsp" %>
          <div class="container p-5">
           <div class="row" >
               <div class="col-md-5 offset-md-4"><!-- form-container and md-5 is size of it -->
                   <div class="card point-card p-5"><!-- inside box and for shadow -->
                       <div class="class-body">
                           <p class="fs-4 text-center">Doctor Login</p>
                           
                            <c:if test="${not empty sucMsg}">
                               <p class="text-center text-success fs-3">${sucMsg}</p>
                               <c:remove var="sucMsg" scope="session" />
                           </c:if>
                           
                             <c:if test="${not empty errorMsg}">
                               <p class="text-center text-danger fs-3">${errorMsg}</p>
                               <c:remove var="errorMsg" scope="session"/>
                           </c:if>
                           
                           <form action="doctorLogin" method="post">
                               <div class="mb-3">
                                   <label class="form-label">Email Address</label>
                                   <input required name="email" type="email" class="form-control">
                               </div>
                                <div class="mb-3">
                                   <label class="form-label">Password</label>
                                   <input required name="password" type="password" class="form-control">
                               </div>
                               
                               <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
                           </form>
                             <br> Don't have an account?<a href="signup.jsp" class="text-decoration-none">create account</a>
                       </div>
                   </div>
                   
               </div>
           </div>
       </div>

    </body>
</html>

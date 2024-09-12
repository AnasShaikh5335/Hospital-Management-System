
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnect"%>
<%--<%@ taglib prefix="c" uri="http://java.com/jsp/jstl/core"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Appolo</title>
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
            
         
            
             <!--carosule-->
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/pexels-pixabay-236380.jpg" class="d-block w-100" alt="..." height="500px">
                </div>
                <div class="carousel-item">
                    <img src="img/pexels-pixabay-263402.jpg" class="d-block w-100" alt="..." height="500px">
                </div>
                <div class="carousel-item">
                    <img src="img/young-handsome-physician-medical-robe-with-stethoscope.jpg" class="d-block w-100" alt="..."  height="500px">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        
             
             
             <div class="container p-3">
            <p class="text-center fs-2">Key Features of our Hospital</p>
            
            <div class="row">
                <div class="col-md-8 p-5">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card point-card">
                                <div class="card-body">
                                    <p class="fs-5">100% Safety</p>
                                    <p>We Provide 100% Security in our Hospital</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card point-card">
                                <div class="card-body">
                                    <p class="fs-5">Clean Environment</p>
                                    <p>We have clean Enviroment in our Hospital</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card point-card">
                                <div class="card-body">
                                    <p class="fs-5">Responsible Doctors</p>
                                    <p>We Provide 100% Security in our Hospital</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card point-card">
                                <div class="card-body">
                                    <p class="fs-5">Medical Research</p>
                                    <p>We Provide 100% Security in our Hospital</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                  <div class="col-md-4">
                    <img src="img/featuresD.jpg" style="height: 350px;width: auto">
                </div>
            </div>
        </div>
        <hr>
        
        
        <div class="container p-2">
            <p class="text-center fs-2">Our Team</p>
            
            <div class="row">
                <div class="col-md-3" ><!-- 3 is  grid means 3 grid  -->
                    <div class="card point-card">
                        <div class="card-body text-center">
                            <img src="img/Drasthana.jpg" width="225px" height="300px">
                            <p class="fw-bold fs-5">Dr.Asthana</p>
                            <p class="fs-7">(CEO & Chairman)</p>     
                        </div>
                    </div>
                </div>
                 <div class="col-md-3"><!-- 3 is  grid means 3 grid  -->
                    <div class="card point-card" >
                        <div class="card-body text-center">
                            <img src="img/drmunna.jpg" width="225px" height="300px">
                            <p class="fw-bold fs-5">Dr.Murli Prasad</p>
                            <p class="fs-7">(Orthopedic)</p>     
                        </div>
                    </div>
                </div>
                <div class="col-md-3"><!-- 3 is  grid means 3 grid  -->
                    <div class="card point-card" >
                        <div class="card-body text-center">
                            <img src="img/DR.Saluke.jpg" width="225px" height="300px">
                            <p class="fw-bold fs-5">Dr.Salukhe</p>
                            <p class="fs-7">(Nephrologist)</p>     
                        </div>
                    </div>
                </div>
                <div class="col-md-3"><!-- 3 is  grid means 3 grid  -->
                    <div class="card point-card" >
                        <div class="card-body text-center">
                            <img src="img/kabirsingh.jpg" width="225px" height="300px">
                            <p class="fw-bold fs-5">Dr.Kabir Singh</p>
                            <p class="fs-7">(Cardiologist)</p>     
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%@include file="component/footer.jsp"%>
    </body>
</html>
    </body>

</html>

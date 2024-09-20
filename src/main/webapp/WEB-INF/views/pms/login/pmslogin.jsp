<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

  <!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link rel="icon" href="assets/img/kaiadmin/favicon.ico" type="image/x-icon" />

    <!-- CSS Files -->
    <!-- fontawesom cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link href="${pageContext.request.contextPath }/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">

<!--   common css -->
<link href="${pageContext.request.contextPath }/resources/css/common/color.css" rel="stylesheet" />
<!-- 	pms css -->
<link href="${pageContext.request.contextPath }/resources/css/pms/kaiadmin.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/pms/plugins.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/pms/demo.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/pms/fonts.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/css/pms/pms.css" rel="stylesheet" />

<body>
    <!--  Body Wrapper -->
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <div
            class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <div class="d-flex align-items-center justify-content-center w-100">
                <div class="row justify-content-center w-100">
                    <div class="col-md-8 col-lg-6 col-xxl-3">
                        <div class="card mb-0" style="height: 420px;">
                            <div class="card-body">
                                <h2 class="text-center login-title mb-4">Login</h2>
                                <form method="post">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label" >사원번호</label>
                                        <input type="text" class="form-control" name="empId" value="${emp.empId }" required>
                                    </div>
                                    <div class="mb-4">
                                        <label for="exampleInputPassword1" class="form-label">비밀번호</label>
                                        <input type="password" class="form-control" name="empPw" value="${emp.empPw }" required>
                                    </div>
<!--                                     <div class="d-flex align-items-center justify-content-between mb-4"> -->
<!--                                         <div class="form-check"> -->
<!--                                             <input class="form-check-input primary" type="checkbox" value="" -->
<!--                                                 id="flexCheckChecked" checked> -->
<!--                                             <label class="form-check-label text-dark" for="flexCheckChecked"> -->
<!--                                                 사원번호 기억하기 -->
<!--                                             </label> -->
<!--                                         </div> -->
<!--                                         <div class="form-check"> -->
<!--                                             <input class="form-check-input primary" type="checkbox" value="" -->
<!--                                                 id="flexCheckChecked" checked> -->
<!--                                             <label class="form-check-label text-dark" for="flexCheckChecked"> -->
<!--                                                 자동출근 -->
<!--                                             </label> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    <div style="text-align: center;">
                                          <button class="btn btn-primary w-100" type="submit">로그인</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>

</html>
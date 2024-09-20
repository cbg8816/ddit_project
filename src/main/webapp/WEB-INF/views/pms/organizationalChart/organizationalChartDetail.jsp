<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="or-list">
	<div class="emp-basic-info" style="text-align: center;">
		<img
			src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
			width="100" />
		<p class="empname"><i class="fa-solid fa-user"></i>${emp.empName }</p>
		<p class="pill-box dep"><i class="fa-solid fa-people-group"></i>${emp.department.depNm }</p>
		<p class="pill-box posi"><i class="fa-solid fa-sitemap"></i>${emp.position.posiNm }</p>
	</div>
	<hr />
	<div>
<%-- 		<p class="empid">사번 : ${emp.empId }</p> --%>
<%-- 		<p>입사일 : ${emp.empHirdate }</p> --%>
<%-- 		<p>생년월일 : ${emp.empBir }</p> --%>
<%-- 		<p>전화번호 : ${emp.empTel }</p> --%>
		<p class="empid"><i class="fa-regular fa-address-card"></i>${emp.empId }</p>
		<p><i class="fa-regular fa-calendar"></i>${emp.empHirdate }</p>
		<p><i class="fa-solid fa-cake-candles"></i>${emp.empBir }</p>
		<p><i class="fa-solid fa-phone"></i>${emp.empTel }</p>
	</div>
<!-- 	<dl> -->
<!-- 		<dt>사번</dt> -->
<%-- 		<dd>${emp.empId }</dd> --%>
<!-- 	</dl> -->
<!-- 	<dl> -->
<!-- 		<dt>이름</dt> -->
<%-- 		<dd>${emp.empName }</dd> --%>
<!-- 	</dl> -->
<!-- 	<dl> -->
<!-- 		<dt>직책</dt> -->
<%-- 		<dd>${emp.position.posiNm }</dd> --%>
<!-- 	</dl> -->
<!-- 	<dl> -->
<!-- 		<dt>부서</dt> -->
<%-- 		<dd>${emp.department.depNm }</dd> --%>
<!-- 	</dl> -->
<!-- 	<dl> -->
<!-- 		<dt>입사일</dt> -->
<%-- 		<dd>${emp.empHirdate }</dd> --%>
<!-- 	</dl> -->
<!-- 	<dl> -->
<!-- 		<dt>성별</dt> -->
<%-- 		<dd>${emp.empGen }</dd> --%>
<!-- 	</dl> -->
<!-- 	<dl> -->
<!-- 		<dt>전화번호</dt> -->
<%-- 		<dd>${emp.empTel }</dd> --%>
<!-- 	</dl> -->
</div>

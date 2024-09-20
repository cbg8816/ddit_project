<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

<div class="container">
	<div class="page-inner">
		<div
			class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
			<div>
				<h3 class="fw-bold mb-3">근태 상세내역</h3>
				<h6 class="op-7 mb-2">부서 및 직급</h6>
			</div>
		</div>
		<div class="card-body workstatus">
			<div id="calendar"></div>
		</div>
	</div>
</div>


<input type="hidden" id="currentUserId" value="${empvo.empId}" />
<script src="${cPath }/resources/js/pms/keh/workstatus.js"></script>

<%-- <script src="${cPath }/resources/js/pms/keh/worktime.js"></script> --%>
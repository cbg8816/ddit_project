<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="main-header">
	<div class="main-header-logo">
		<!-- Logo Header -->
		<div class="logo-header" data-background-color="dark">
			<a href="index.html" class="logo">
				<img src="assets/img/kaiadmin/logo_light.svg" alt="navbar brand" class="navbar-brand" height="20">
			</a>
			<div class="nav-toggle">
				<button class="btn btn-toggle toggle-sidebar">
					<i class="gg-menu-right"></i>
				</button>
				<button class="btn btn-toggle sidenav-toggler">
					<i class="gg-menu-left"></i>
				</button>
			</div>
			<button class="topbar-toggler more">
				<i class="gg-more-vertical-alt"></i>
			</button>
		</div>
		<!-- End Logo Header -->
	</div>
	<!-- Navbar Header -->
	<nav class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom">
		<div class="container-fluid">
			<nav class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex">
				<ul class="header-menu">
					<li><a href="${cPath }/empNotice/empNoticeList.do">공지사항</a></li>
					<li><a href="${cPath }/voc">VOC</a></li>
					<li><a href="${cPath }/lostitem/lostitemList.do">분실물</a></li>
				</ul>
			</nav>


			<ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
				<li class="nav-item topbar-icon dropdown hidden-caret d-flex align-items-center">
					<a class="nav-link dropdown-toggle custom-tooltip"  href="${cPath }/approvalform.do" role="button" aria-expanded="false" aria-haspopup="true">
						<i class="fa-solid fa-file-invoice" style="margin-right: 0;"></i>
						<span class="tooltiptext">기안문</span>
					</a>
				</li>
<!-- 				<li class="nav-item topbar-icon dropdown hidden-caret d-flex align-items-center"> -->
<!-- 					<a class="nav-link dropdown-toggle custom-tooltip" href="#" role="button" aria-expanded="false" aria-haspopup="true"> -->
<!-- 						<i class="fa-solid fa-envelope" style="margin-right: 0;"></i> -->
<!-- 						<span class="tooltiptext">쪽지</span> -->
<!-- 					</a> -->
<!-- 				</li> -->
				<li class="nav-item topbar-icon dropdown hidden-caret d-flex align-items-center">
					<a class="nav-link dropdown-toggle custom-tooltip" href="${cPath }/admin" role="button" aria-expanded="false" aria-haspopup="true">
						<i class="fa-solid fa-user-tie" style="margin-right: 0;"></i>
						<span class="tooltiptext">관리자</span>
					</a>
				</li>

				<li class="nav-item topbar-user dropdown hidden-caret">
					<a class="dropdown-toggle profile-pic" data-bs-toggle="dropdown" href="#" aria-expanded="false">
						<div class="avatar-sm">
							<img
								src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
								class="avatar-img rounded-circle" />
						</div>
						<span class="profile-username">
							<span class="op-7"></span>
							<span class="fw-bold">${empvo.empName }</span>
						</span>
					</a>
					<ul class="dropdown-menu dropdown-user animated fadeIn">
						<div class="dropdown-user-scroll scrollbar-outer">
							<li><a class="dropdown-item" href="${cPath }/paystub/empPaystubList.do?what=${empvo.empId }">급여명세서</a></li>
							<div class="dropdown-divider"></div>
							<li><a class="dropdown-item" href="${cPath }/index.do">mypage</a></li>
							<div class="dropdown-divider"></div>
							<li>
					            <a class="dropdown-item logout-btn" data-target-form="#logout-form" href="javascript:;">logout</a>
					        </li>
					    </div>
					</ul>

					<form id="logout-form" action="${cPath}/pmslogout.do" method="post" style="display:none;"></form>

					<script>
					document.querySelector(".logout-btn")?.addEventListener("click", e => {
					    e.preventDefault();
					    let selector = e.target.dataset.targetForm;
					    document.querySelector(selector)?.submit();
					});
					</script>
				</li>
			</ul>
		</div>
	</nav>
	<!-- End Navbar -->
</div>
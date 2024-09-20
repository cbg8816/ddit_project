<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="modal fade" id="vocModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header border-0">
				<h5 class="modal-title">상세정보</h5>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="col-md-6 pe-0">
						<div id="vocTitle" class="form-group form-group-default"></div>
					</div>
					<div class="col-md-6">
						<div id="vocDate" class="form-group form-group-default"></div>
					</div>
					<div class="col-md-3 pe-0">
						<div id="vocName" class="form-group form-group-default"></div>
					</div>
					<div class="col-md-4 pe-0">
						<div id="vocTel" class="form-group form-group-default"></div>
					</div>
					<div class="col-md-5">
						<div id="vocEmail" class="form-group form-group-default"></div>
					</div>
					<div class="col-sm-12">
						<div id="vocContent" class="form-group form-group-default"></div>
					</div>
				</div>
			</div>

			<div class="modal-footer border-0">
				<button id="vocMClose" type="button" class="btn btn-danger"
					data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">VOC</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="${cPath }/index.do"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="${cPath }/voc">VOC</a></li>
						</ul>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav side">
						</nav>
								<div class="input-group" id="vocBox">
								</div>
					</div>
					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
								<colgroup>
									<col width="10%" />
									<col width="20%" />
									<col width="30%" />
									<col width="20%" />
									<col width="20%" />
								</colgroup>
									<thead>
										<tr>
											<th>NO</th>
											<th>제목</th>
											<th>내용</th>
											<th>접수일</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="voc-body">
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="page-footer">
						<div class="paging paging-area"></div>
					</div>
					<form:form id="searchform" method="get">
						<input type="hidden" name="page" id="vocPage"/>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${cPath }/resources/js/app/pms/voc/vocList.js"></script>
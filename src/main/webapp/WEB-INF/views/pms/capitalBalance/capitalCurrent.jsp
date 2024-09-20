<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">직원 관리 리스트</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">직원 관리 리스트</a></li>
						</ul>
					</div>

					<div class="page-body">
						<div class="m-table-outer">
							<div class="m-table-inner">
								<table class="table-header-fix table-input-in">
									<thead>
										<tr>
											<th rowspan="2">구분</th>
											<th>현금</th>
											<th>카드</th>
											<th>간편결제</th>
											<th>인터넷 선결제</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td class="price">10000000</td>
											<td class="price">2000000</td>
											<td class="price">300000</td>
											<td class="price">4000000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="page-footer">
						<div class="paging paging-area">
							${pagingHTML }
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>


<script src="${pageContext.request.contextPath }/resources/js/pms/capitalBalance/capitalCurrent.js"></script>
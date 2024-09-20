<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<div class="container">
				<div class="page-inner">
					<div class="container-fluid">
						<div class="container-fluid">
							<div class="card">
								<div class="page-header">
									<h3 class="fw-bold mb-3">기획 상세내역</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"><i class="fa-solid fa-house"></i></a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">기획 내역</a></li>
							<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
							<li class="nav-item"><a href="#">기획상세내역</a></li>
						</ul>
								</div>
								<div class="table-top-box">
									<nav class="button-box table-nav">
										<!-- <a href="#" class="btn btn-primary">결제선</a>
										<a href="#" class="btn btn-primary">결제</a>
										<a href="#" class="btn btn-primary">임시저장</a> -->
										<!-- <a href="#" class="btn btn-primary">저장</a>
										<a href="#" class="btn btn-primary">취소</a> -->
									</nav>
								</div>
								<div class="page-body">
									<div class="m-table-outer">
										<div class="m-table-inner">
										<form>
											<table class="table table-bordered">
												<tr>
													<th>기획명</th>
													<td> <input type="text"/></td>
													<th>분류명</th>
													<td> <input type="text"/></td>
												</tr>
												<tr>
													<th>시작일</th>
													<td> <input type="date"/></td>
													<th>종료일</th>
													<td> <input type="date"/></td>
												</tr>
												<tr>
													<th>투입 인원</th>
													<td> <input type="number"/></td>
													<th>투자 금액</th>
													<td> <input type="text"/></td>
												</tr>
												<tr>
													<th>담당자</th>
													<td> <input type="text"/></td>
													<th>부서</th>
													<td> <input type="text"/></td>
												</tr>
												<tr>
													<th>기획목표</th>
													<td> <input type="text"/></td>
												</tr>
												<tr>
													<th>기획내용</th>
													<td> <textarea rows="10" cols="50"></textarea>
													</td>
												</tr>
												<tr>
												<td colspan="2">
												 <a href="<c:url value='/invest/investList.do'/>"
													class="btn btn-secondary">목록으로</a>
												</td>
												</tr>
											</table>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
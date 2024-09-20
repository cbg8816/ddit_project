<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
											<table class="table table-bordered">
												<tr>
													<th>기획명</th>
													<td>룸서비스개발</td>
													<th>분류명</th>
													<td>룸서비스</td>
												</tr>
												<tr>
													<th>시작일</th>
													<td>2024-08-24</td>
													<th>종료일</th>
													<td>2024-09-24</td>
												</tr>
												<tr>
													<th>투입 인원</th>
													<td>20명</td>
													<th>투자 금액</th>
													<td>20,000,000원</td>
												</tr>
												<tr>
													<th>담당자</th>
													<td>김용호</td>
													<th>부서</th>
													<td>서비스팀</td>
												</tr>
												<tr>
													<th>기획목표</th>
													<td>새로운 룸서비스 개발을 통해 고객 만족도를 올린다.</td>
												</tr>
												<tr>
													<th>기획내용</th>
													<td>언택트 호캉스의 트랜드로 룸콕을 제시, 룸서비스를 세일즈 포인트로 관련된 패키지를 출시
														, 조식이외에도 룸서비스의 니즈를 다양한 방법으로 활용
														단순한 편의에서 호캉스의 새로운 즐길 거리로 룸서비스가 확대 적용 중이다.
														룸서비스는 판매되는 상품보다 서비스에 대란 의존도가 매우 높은 특징이 있다. 따라서 적즉적인 판촉이 요구되는 상황이다.
													</td>
												</tr>
												<tr>
												<td colspan="2">
												 <a href="<c:url value='/invest/investList.do'/>"
													class="btn btn-secondary">목록으로</a>
												</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
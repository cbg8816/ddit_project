<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<style>
    /* 내부 CSS */
    .centered .ag-header-cell-label {
        justify-content: center !important;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>


<div class="container">
	<div class="page-inner">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="card">
					<div class="page-header">
						<h3 class="fw-bold mb-3">분실및보관 물품리스트</h3>
					</div>
					<div class="table-top-box side">
						<nav class="button-box table-nav">
						<a class="btn btn-primary" href="#" id="newBtn" data-bs-toggle="modal" data-bs-target="#newlostitemModal">등록</a>
						</nav>
					</div>
					<div >
					<div id="myGrid" class="ag-theme-quartz-auto-dark"style="height: 500px"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="newlostitemModal" tabindex="-1"
	aria-labelledby="newlostitemLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form id='insertForm' method="post">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="newlostitemLabel">분실및보관 물품등록</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-bordered">
<!-- 						<tr> -->
<!-- 							<th>작성자</th> -->
<!-- 							<td><input type="text" name="hksWriter" class="form-control" /></td> -->
<!-- 						</tr> -->
						<tr>
							<th>습득일</th>
							<td><input type="date" name="hksDate" class="form-control" /></td>
						</tr>
						<tr>
							<th>습득장소</th>
							<td><input type="text" name="hksPlace" class="form-control" /></td>
						</tr>
						<tr>
							<th>습득자</th>
							<td><input type="text" name="hksAcquirer" class="form-control" /></td>
						</tr>
						<tr>
							<th>물품명</th>
							<td><input type="text" name="hksKind" class="form-control" /></td>
						</tr>
						<tr>
							<th>담당자</th>
							<td><input type="text" name="hksRegi" class="form-control" /></td>
						</tr>
						<tr>
							<th>비고</th>
							<td><textarea name="hksNote" class="form-control"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="detaillostitemmodal" tabindex="-1"
	aria-labelledby="detailModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form id='updateForm'>
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="detailModalLabel">Modal title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<table class="table table-bordered">
						<tr>
							<th>물품번호</th>
							<td><input type="number" name="hksNo" class="form-control" /></td>
						</tr>
						<tr>
							<th>습득일</th>
							<td><input type="date" name="hksDate" class="form-control" /></td>
						</tr>
						<tr>
							<th>습득장소</th>
							<td><input type="text" name="hksPlace" class="form-control"  /></td>
						</tr>
							<th>습득자</th>
							<td><input type="text" name="hksAcquirer" class="form-control"  /></td>
						</tr>
						<tr>
							<th>물품명</th>
							<td><input type="text" name="hksKind" class="form-control" /></td>
						</tr>
						<tr>
							<th>담당자</th>
							<td><input type="text" name="hksRegi" class="form-control" /></td>
						</tr>
						<tr>
							<th>비고</th>
							<td><textarea name="hksNote" class="form-control"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
				</div>
			</form>
		</div>
	</div>
</div>



<script src="<c:url value='/resources/js/pms/lostitemaggrid.js'/>"></script>

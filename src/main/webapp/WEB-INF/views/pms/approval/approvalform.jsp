<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />

<div class="container appsidebar">
	<div class="asidebar">
		<div
			class="d-flex align-items-left align-items-md-center flex-column pbot-4">
			<div>
				<h3 class="fw-bold mb-3">전자결재</h3>
			</div>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#appmodal">기안문 작성</button>

			<!-- Modal -->
			<div class="modal fade" id="appmodal" tabindex="-1"
				data-bs-backdrop="static" data-bs-keyboard="false" role="dialog"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header border-0">
							<h5 class="modal-title">
								<span class="fw-mediumbold"> 결재양식 선택</span>
							</h5>
							<button type="button" class="close" data-bs-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-sm-10" style="margin: auto;">
									<div class="form-group form-group-default">
										<form style="padding: 10px;">
											<section class="search">
												<div class="search_wrap">
													<input id="searchInput" class="search" maxlength="20"
														type="text" placeholder="양식제목">
														 <button class="btn_search" type="button"  title=""evt-rol="mail-search">
														 <i class="fa-solid fa-magnifying-glass"></i>
														 </button>
												</div>
												<div id="detailSearchLayerWrap"
													style="position: relative; display: none; z-index: 60"></div>
											</section>
										</form>

										<div class="content_tab_wrap">
											<ul id="formList">
												<c:forEach items="${approvalformList }" var="form" varStatus="status">
													<li data-starred="false" data-original-index="${status.index}">
														<i class="fa-regular fa-star star-icon"></i>
														<a href="#" class="dynamic-link" data-form-title="${form.formTitle }">${form.formTitle}</a>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer border-0">
							<button type="button" id="addRowButton" class="btn btn-primary">
								확인</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<ul class="nav nav-secondary">
			<li class="nav-item">
			<a data-bs-toggle="collapsea" href="" class="collapsed" aria-expanded="false">
				<i class="fa-solid fa-file"></i>
					<p>결재하기</p>
					<span class="caret"></span>
			</a>
				<div class="collapsea" id="aa">
					<ul class="nav nav-collapse">
						<li>
							<a href="requestbox.do">
								<span class="sub-item">결재요청 문서</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li class="nav-item"><a data-bs-toggle="collapsea" href="#bb"
				class="collapsed" aria-expanded="false"> <i
					class="fa-solid fa-inbox"></i>
					<p>문서함</p> <span class="caret"></span>
			</a>
				<div class="collapsea" id="bb">
					<ul class="nav nav-collapse">
						<li>
							<a href="inbox.do">
								<span class="sub-item">수신문서함()</span>
							</a>
						</li>
						<li>
							<a href="outbox.do">
								<span class="sub-item">발신문서함</span>
							</a>
						</li>
						<li>
							<a href="completedbox.do">
								<span class="sub-item">완료문서함</span>
							</a>
						</li>
						<li>
							<a href="returnbox.do">
								<span class="sub-item">반려문서함</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
		</ul>
	</div>

	<div style="width: calc(100% - 250px);">
		<div class="page-inner ">
			<div class="row">
				<div class="dashboard_box">
					<div>
						<div class="card_item_wrapper card_flex">
							<c:choose>
								<c:when test="${not empty boxList}">
									<c:forEach items="${boxList }" var="box">
										<section class="card_item approval_home_card">
											<div class="card_wrapper">
												<header>
													<span class="state ongoing">
													  <c:choose>
								                          <c:when test="${box.aprState eq '1'}">
												              <span class="status-ongoing">진행중</span>
												          </c:when>
												          <c:when test="${box.aprState eq '2'}">
												              <span class="status-completed">완료</span>
												          </c:when>
												          <c:when test="${box.aprState eq '3'}">
												              <span class="status-rejected">반려</span>
												          </c:when>
												          <c:otherwise>
												              <span class="status-unknown">알 수 없음</span>
												          </c:otherwise>
								                      </c:choose>
													</span>
												</header>
												<div class="card_subject">
													<span class="title t_card" style="cursor: pointer;" title="제목 "> 
														${box.formvo.formTitle } 
													</span>
												</div>
												<div class="card_content">
													<div class="form">
														<div class="form_tr">
															<div class="form_th">기안자 :</div>
															<div class="form_td" title="기안자">${box.empvo.empName }</div>
														</div>
														<div class="form_tr">
															<div class="form_th">기안일 :</div>
															<div class="form_td" >${box.aprRegdate }</div>
														</div>
														<div class="form_tr">
															<div class="form_th">결재양식 :</div>
															<div class="form_td" title="">${box.aprTitle}</div>
														</div>
													</div>
													<div class="card_opt"></div>
												</div>
												<div class="card_action collapsea">
													<c:url value="/requestDetail.do" var="requestDetail">
														<c:param name="what" value="${box.aprId }"></c:param>
													</c:url>
													<a href="${requestDetail }" >결재하기</a>
												</div>
											</div>
										</section>
									</c:forEach>
								</c:when>
								 <c:otherwise>
								      <tr>
								        <td colspan="8">데이터가 없습니다.</td>
								      </tr>
								    </c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>



    document.querySelectorAll('.collapsea a').forEach(link => {
        link.addEventListener('click', function (event) {
            event.preventDefault(); // 기본 링크 동작 방지

            const url = this.getAttribute('href'); // 링크의 href 속성값 가져오기

            // AJAX 요청
            fetch(url)
                .then(response => response.text())
                .then(data => {
                    // 페이지의 특정 부분만 업데이트
                    $('.page-inner .row').html(data);
                    // 필요한 경우 새로 로드된 콘텐츠에 대해 추가 스크립트를 실행
                })
                .catch(error => console.error('Error:', error));
        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('.dynamic-link').forEach(link => {
            link.addEventListener('click', function (event) {
                event.preventDefault();
                const formTitle = this.getAttribute('data-form-title');
                const url = 'loadForm.do?title=' + encodeURIComponent(formTitle);
//                 const url = `${cPath}/approval/annual.do`

                fetch(url)
                    .then(response => response.text())
                    .then(data => {
                        $('.page-inner .row').html(data);


                        // 모달 닫기 (필요한 경우)
                        const modal = document.querySelector('#appmodal');
                        if (modal) {
                            const modalInstance = bootstrap.Modal.getInstance(modal);
                            if (modalInstance) {
                                modalInstance.hide();
                            }
                        }
                    })
                    .catch(error => console.error('Error:', error));
            });
        });
    });


// 즐겨찾기
    document.addEventListener('DOMContentLoaded', function() {
    	 const starIcons = document.querySelectorAll('.star-icon');
		 const formList =  document.getElementById('formList');

    	 starIcons.forEach(icon=>{
    		icon.addEventListener('click', function(e){
    			e.preventDefault();
    			const listItem = this.closest('li');

    			if(this.classList.contains('fa-regular')){
    				this.classList.remove('fa-regular');
    				this.classList.add('fa-solid');
    				listItem.setAttribute('data-starred', 'true');
    			} else{
    				this.classList.remove('fa-solid');
    				this.classList.add('fa-regular');
    				listItem.setAttribute('data-starred', 'false');
    			}
    			sortList();
    		});
    	});

    	 // 빈별에서 채운별로 바꿀때 상위 노출로~
    	   function sortList() {
    	        const items = Array.from(formList.children);
    	        items.sort((a, b) => {
    	            const aStarred = a.getAttribute('data-starred') === 'true';
    	            const bStarred = b.getAttribute('data-starred') === 'true';

    	            if (aStarred && !bStarred) return -1;
    	            if (!aStarred && bStarred) return 1;

    	            // 빈별일떄 원래 위치로 이동
    	            if (!aStarred && !bStarred) {
    	                return parseInt(a.getAttribute('data-original-index')) - parseInt(b.getAttribute('data-original-index'));
    	            }
    	            return 0;
    	        });

    	        items.forEach(item => formList.appendChild(item));
    	    }
    });






    // 직원 jstree
    document.addEventListener("DOMContentLoaded", () => {
        $.getScript("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js");
        $(document).on('shown.bs.modal', '#approvalline', function () {
            $('#aside-orgtree-tree').jstree({
                "plugins": ["search", "dnd"],
                'core': {
                    'data': function (node, cb) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/api/employees", // AJAX로 요청할 URL
                            method: 'GET',
                            success: function (data) {
                                console.log(data);
                                cb(data);
                            },
                            error: function (err) {
                                console.error("직원 데이터를 불러오는 데 실패했습니다.", err);
                            }
                        });
                    },
                    "check_callback": true
                }

            });

        });



        // 결재선 직원추가
        let selectedEmployees = [];

        $(document).on('click', '.add_activity', function () {
            console.log("aaaaaaaaaaaaa");
            // jstree에서 선택된 노드 가져오기
            var selectedNode = $('#aside-orgtree-tree').jstree('get_selected', true)[0];

            if (selectedNode) {
                // 선택된 노드에서 필요한 정보 추출
                var fullText = selectedNode.text;
                console.log("전체 텍스트:", fullText);

                // 이름 추출 (괄호와 그 안의 내용 제거)
                var match = fullText.match(/(.*)\s*\((.*)\)/);
                var name = match ? match[1].trim() : fullText;
                var position = match ? match[2] : '';
                console.log("추출된 이름:", name);
                console.log("추출된 직급:", position);

                // 부서 정보 가져오기
                var department = '';
                if (selectedNode.parents.length > 1) {
                    var parentNodeId = selectedNode.parents[selectedNode.parents.length - 2]; // 직계 상위 부서
                    var parentNode = $('#aside-orgtree-tree').jstree('get_node', parentNodeId);
                    department = parentNode.text;
                }
                console.log("추출된 부서:", department);

                selectedEmployees.push({ name: name, position: position, department: department });

                var newRow = `<tr>
                <td class="kind"> 기안</td>
                <td class="name">\${name}</td>
                <td class="depart">\${department}</td>
                <td class="func"></td>
        			</tr>` ;

                $('.tb_approval_line tbody').append(newRow);
                console.log("새 행이 추가됨");
            } else {
                alert('직원을 선택해주세요.');
            }
        });


        $(document).on('click', '#addRowButton', function () {
            console.log("확인버튼");

            var signmember = $('.sign_type1_inline');

            var cnt = 1;
            selectedEmployees.forEach(function (employee) {

                var newmember = `<span class="sign_member_wrap" id="activity_">
					<span class="sign_member">
					 		<span class="sign_rank_wrap">
								 <span class="sign_posi">\${employee.position}</span>
							 </span>
							 <span class="sign_wrap">
								 <span class="sign_name">\${employee.name}</span>
						 	</span>
							 <span class="sign_date_wrap">
						 		<span class="sign_date" id="date_"></span>
					 		</span>
					 		</span>
						 </span>
						 <input type="hidden" name="lineList[\${cnt}].empName" value="\${employee.name}" />`;
				cnt++;
                signmember.append(newmember);
            });
            selectedEmployees = [];

            // 모달 창 닫기 (만약 모달을 사용중이라면)
            $('#approvalline').modal('hide');

        });

    });






</script>


<%-- <script src="${cPath }/resources/js/pms/keh/annual.js"></script> --%>
<%-- <script src="${cPath }/resources/js/pms/keh/jstree.js"></script> --%>
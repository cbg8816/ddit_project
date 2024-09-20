<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
	table tr {
		border-bottom: 1px solid transparent;
	}
</style>

<div class="tool col-lg-8">
	<div class="page-header">
		<h3 class="fw-bold mb-3">전자결재</h3>
		<ul class="breadcrumbs mb-3">
			<li class="nav-home">
				<a href="#"><i class="fa-solid fa-house"></i></a>
			</li>
			<li class="separator"><i class="fa-solid fa-chevron-right"></i></li>
			<li class="nav-item"><a href="#">기안문</a></li>
		</ul>
	</div>

<div>
		<div class="tool_bar">
			<div class="critical">
			<button id="act_draft" class="btn_tool buttonbak" data-bs-toggle="modal">
			    <span class="ic_toolbar approval"></span>
			    <i class="fa-solid fa-pen-to-square approimo"></i>
			    <span class="txt buttonbak" >목록</span>
			</button>
				<a id="hiddenDownloadDoc" data-role="button" href="" style="display: none"></a>
			</div>
		</div>
	</div>




	<div class="headerline " >
		<div class="anntable">
<%-- 		<form:form method="post" modelAttribute="empvo" enctype="multipart/form-data" id="annform"> --%>

			<table class="__se_tbl"
				style="width: 800px; border-collapse: collapse !important; color: black; background: white; border: 0px solid black; font-size: 12px; font-family: malgun gothic, dotum, arial, tahoma;">
				<!-- Header -->
				<tbody>
					<tr>
						<td style="width: 300px; padding: 3px !important; border: 0px solid black; height: 90px !important; font-size: 22px; font-weight: bold; text-align: center; vertical-align: middle;"
							colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							연차신청서<input type="hidden" id="aprTitle" name ="aprTitle" value="연차신청서"/></td>
					</tr>
					<tr>
						<td style="width: 300px; border: 0; padding: 0 !important"
							class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

							<table class="__se_tbl" style="background: white; margin: 0px; border: 1px solid black; border-image: none; color: black; font-family: malgun gothic, dotum, arial, tahoma; font-size: 12px; border-collapse: collapse !important;">
								<!-- User -->

								<tbody>
									<tr>
										<td style="width: 100px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: rgb(221, 221, 221); padding: 3px !important;">
											기안자</td>
										<td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
											<span unselectable="on" contenteditable="false" class="comp_wrap"
												data-cid="0" data-dsl="{{label:draftUser}}">
												<span class="comp_item">${appro.aprWriter }
												</span>

											</span>
										</td>
									</tr>
									<tr>
										<td
											style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">
											기안부서</td>
										<td
											style="width: 200px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
											<span unselectable="on" contenteditable="false" class="comp_wrap"
												data-cid="1" data-dsl="{{label:draftDept}}" >
												<span class="comp_item">${appro.annDep }</span>
											</span>
										</td>
									</tr>
									<tr>
									    <td style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">
									        기안일
									    </td>
									    <td style="width: 200px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
									        <span class="comp_item">
									           ${appro.aprRegdate }
									        </span>
									    </td>
									</tr>

									<tr>
										<td
											style="width: 100px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">
											문서번호</td>
										<td
											style="width: 200px; padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
											<span unselectable="on" contenteditable="false" class="comp_wrap"
												data-cid="3" data-dsl="{{label:docNo}}">
												<span class="comp_item"></span>
													${appro.formId }
											</span>
										</td>
									</tr>
								</tbody>
							</table>

						</td>
						<td style="padding: 0px !important; border: 0px currentColor !important; border-image: none !important !important;
							width: 500px; text-align: right; vertical-align: top !important;" class="singnewmember">
						<!-- 결재선 기본값으로 신청 1명, 승인 7명으로 설정-->
			    			 <span class="sign_type1_inline" style="line-height: normal; font-family: malgun gothic,dotum,arial,tahoma; font-size: 9pt; margin-top: 0px; margin-bottom: 0px;
			    			 	" data-group-seq="0" data-group-name="승인" data-group-max-count="7" data-group-type="type1" data-is-reception="">
			    				 <span class="sign_tit_wrap">
			    					 <span class="sign_tit">
			    						 <strong>승인</strong>
			    			 		</span>
				    			 </span>

				    			 <c:forEach items="${appro.lineList }" var="line">
					    			 <span class="sign_member_wrap" id="activity_">
					    			 	<span class="sign_member">
					    			 		<span class="sign_rank_wrap">
					    						 <span class="sign_posi">${line.aprlineDep }</span>
					    					 </span>
						    				 <span class="sign_wrap">
						    					 <span class="sign_name">${line.empName }</span>
						    			 	</span>
					    					 <span class="sign_date_wrap">
					    				 		<span class="sign_date" id="date_">
					    				 			<c:if test="${line.aprlineState eq '2' }">
					    				 				${line.aprlineStDay }
					    				 			</c:if>
					    				 		</span>
					    			 		</span>
					    				 </span>
					    			 </span>
				    			 </c:forEach>
			    			 </span>
						</td>
					</tr>
				</tbody>
			</table>



			<table class="caltable" style="width: 800px; margin-top: 10px; border-collapse: collapse !important; color: black; background: white; border: 1px solid black; font-size: 12px; font-family: malgun gothic, dotum, arial, tahoma;">
				<tbody>
					<tr>
						<td
							style="background: rgb(221, 221, 221); width: 100px; padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
							휴가&nbsp;종류</td>
						<td style="background: rgb(255, 255, 255);  width: 300px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
	                      	${appro.aprKind }
						</td>
					</tr>
					<tr>
						<td
							style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
							기간&nbsp;및&nbsp;일시</td>
						<td>
							  <div class="cal">
							  	${appro.startDate }&nbsp;~&nbsp;${appro.endDate }

<!-- 							        <input type="date" id="startDate" name="startDate"/> &nbsp;~&nbsp; -->
<!-- 							        <input type="date" id="endDate" name="endDate" > -->
<!-- 							        사용 일수: <input class="anninput" id="dayCount" readonly> -->
<%-- 							         <input type="hidden" id="startDate" name="startDate" value="${pmsapproval.startDate }" /> --%>
<%-- 							          <input type="hidden" id="endDate" name="endDate" value="${pmsapproval.endDate }" /> --%>
							    </div>
						</td>
					</tr>

					<tr>
						<td
							style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
							반차&nbsp;여부</td>
						<td
							style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
							<span id="vacationHalfArea"
								style="line-height: normal; font-family: malgun gothic, dotum, arial, tahoma; font-size: 11pt; margin-top: 0px; margin-bottom: 0px;">
								<span class="halfArea">
									<input type="radio" class="editor_opt" data-dsl="{{radio_오전_오후}}"
										name="radio_startHalf" id="startAMHalf" value="오전" data-autotype="false"
										data-require="false" data-label="오전" >
									<label class="editor_label" data-type="removeSpan">오전</label>
									<input type="radio" class="editor_opt" data-dsl="{{radio_오전_오후}}"
										name="radio_startHalf" id="startPMHalf" value="오후" data-autotype="false"
										data-require="false" data-label="오후">
									<label class="editor_label" data-type="removeSpan">오후</label>
								</span>

							</span>
						</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> -->
<!-- 							연차&nbsp;일수</td> -->
<!-- 						<td style="padding: 3px; border: 1px solid black;  height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; background: rgb(255, 255, 255);"> -->
<%-- 							총 연차 :&nbsp;<span>${empvo.attencance.atteAllAnLeave }</span> --%>
<%-- 							사용연차 :&nbsp;<span>${empvo.attencance.atteUseAnLeave }</span> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
					<tr>
						<td
							style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 80px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
							<b style="color: rgb(255, 0, 0);">*</b>&nbsp;휴가&nbsp;사유
						</td>
						<td style="padding: 3px; border: 1px solid black; height: 100px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: top; background: rgb(255, 255, 255);">
 								<textarea class="txta_editor">
 									${appro.aprContent }
 								</textarea>
 							 <input type="hidden" id="aprContent" name="aprContent" value="${pmsapproval.aprContent }" />
						</td>
					</tr>
					<tr>
						<td colspan="2"
							style="width: 800px; padding: 20px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; background: #ddd;">
							1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다.<br> &nbsp;&nbsp;&nbsp;단, 최초
							입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.<br> 2. 경조사
							휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br> 3.
							공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>
	</div>






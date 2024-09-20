<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!--교통비 신청  -->

    <div class="tool col-lg-5">
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
        <div class="tool_bar">
            <div class="critical">
                <a id="act_draft" class="btn_tool" data-role="button">
                    <span class="ic_toolbar approval "></span>
                    <i class="fa-solid fa-pen-to-square approimo"></i>
                    <button class="txt buttonbak">결재요청</button>
                </a>
                <span class="btn_tool_group">
                    <a id="act_cancel_draft" class="btn_tool" data-role="button">
                        <span class="ic_toolbar cancel "></span>
                        <i class="fa-regular fa-circle-xmark approimo"></i>
                        <button class="txt buttonbak">취소</button>
                    </a>
                </span>
                <!-- 		 <div class="d-flex align-items-left align-items-md-center flex-column pbot-4" > -->

                <!-- Button trigger modal -->
                <button type="button" class="btn_tool btn" data-bs-toggle="modal" data-bs-target="#approvalline">
                    <i class="fa-solid fa-file-export "></i>결재선
                </button>

                <!-- Modal -->
                <div class="modal fade" id="approvalline" tabindex="-1" data-bs-keyboard="false" role="dialog">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content layer_normal">
                            <div class="modal-header border-0">
                                <h5 class="modal-title">
                                    <span class="fw-mediumbold">결재 정보</span>
                                </h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="tab_menu_wrap">
                                    <ul class="maintab tab_menu">
                                        <li data-role="tab" data-tabid="apprline" class="active">
                                            <span class="ic_txt_change">*</span>

                                            <span class="txt">결재선</span>
                                        </li>
                                        <li data-role="tab" data-tabid="referer">
                                            <span class="ic_txt_change">*</span>
                                            <span class="txt">참조자</span>
                                        </li>
                                        <li data-role="tab" data-tabid="reader">
                                            <span class="ic_txt_change">*</span>
                                            <span class="txt">열람자</span>
                                        </li>
                                    </ul>
                                </div>


                                <div class="set_wrap wrap_approval_agree">
                                    <div class="aside-apprline set_nav" style="display: block;">
                                        <!-- 탭 -->
                                        <ul class="sidetab tab_type3 tab_type3_column2">
                                            <li data-role="tab" data-tabid="orgtree" class="selected first">
                                                <a href="#" data-bypass="">
                                                    <span class="txt">조직도</span>
                                                </a>
                                            </li>
                                            <li data-role="tab" data-tabid="myapprline" class="last">
                                                <a href="#" data-bypass="">
                                                    <span class="txt">나의 결재선</span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="sidetab-item">
                                            <div id="aside-orgtree" class="tabview-orgtree" style="display: block;">
                                                <section class="search">
                                                    <div class="search_wrap">
                                                        <form onsubmit="return false;">
                                                            <input id="org_tree_tab_search_input" class="search"
                                                                type="text" placeholder="이름/부서" title="이름/부서">
                                                        </form>
                                                    </div>
                                                </section>
                                                <div class="orgTree_wrap">
                                                    <div class="orgTree content_tab_wrap">
                                                        <div id="aside-orgtree-tree"
                                                            class="jstree jstree-25 jstree-focused jstree-default "
                                                            style="min-height: 306px; max-height: 306px;"></div>
                                                    </div>
                                                    <div id="aside-orgtree-search" class="cone"
                                                        style="display: none; border: none; padding: 5px 0px 5px 0px;">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="maintab-item wrap_tab_data">
                                        <div class="set_data wrap_approvalLine_set tabview-apprline"
                                            style="display: block;">
                                            <table class="type_normal tb_approval_line">
                                                <thead>
                                                    <tr>
                                                        <th class="box"></th>
                                                        <th class="kind">타입</th>
                                                        <th class="name">이름</th>
                                                        <th class="depart">부서</th>
                                                        <th class="func"> </th>
                                                        <th class="blank"></th>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <div id="activity_groups" class="list_approval_line_wrap">
                                                <div class="activity_group ui-sortable" data-index="0">
                                                    <!-- <div class="approval_line">  -->
                                                    <div class="tit_type3"><span class="txt">승인</span></div>


                                                    <div class="list_approval_line">
                                                        <div class="btn_langth add_activity" title="추가" data-id="">
                                                            <i class="fa-solid fa-forward appimo"></i>
                                                        </div>
                                                        <div class="tb_approval_line_wrap">
                                                            <table
                                                                class="appr-activity-table type_normal tb_approval_line">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="kind"> 기안</td>
                                                                        <td class="name">전병헌</td>
                                                                        <td class="depart">경영지원본부</td>
                                                                        <td class="func"></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="activity_group hidden_and_empty_group"
                                                    style="height: 249px;">
                                                    <div class="empty_approval_line" style="height: 100%">
                                                        <table style="height: 100%">
                                                            <tbody style="height: 100%">
                                                                <tr class="appr-activity activity ui-droppable"
                                                                    data-isnullactivity="true" style="height: 100%">
                                                                    <td style="width: 100%; height: 100%"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tit_type2">
                                                <a class="save-myapprline-btn btn_fn6" href="#" data-bypass="">개인 결재선으로
                                                    저장</a>
                                                <span class="horspace1"></span>
                                                <span class="tit">합의방식 : </span>
                                                <span class="option_wrap">
                                                    <input id="series" class="radioinput" type="radio"
                                                        name="useParallelAgreement" value="false" checked="">
                                                    <label for="series">순차합의</label>
                                                </span>
                                                <span class="option_wrap">
                                                    <input id="parallel" class="radioinput" type="radio"
                                                        name="useParallelAgreement" value="true">
                                                    <label for="parallel">병렬합의</label>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer border-0">
                                <button type="button" id="addRowButton" class="btn btn-primary btn-sm">
                                    확인
                                </button>
                                <button type="button" class="btn btn-outline-dark btn-sm" data-bs-dismiss="modal">
                                    취소
                                </button>
                            </div>
                        </div>
                    </div>
                </div>


                <a id="hiddenDownloadDoc" data-role="button" href="" style="display: none"></a>
            </div>
        </div>
    </div>

    <div class="headerline">
        <div class="anntable">
			<span>
				<div id="divCustomWrapper" style= font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; text-align: center;">
					<!-- Embededd Style이 적용받는 범위. 최하단의 스타일은 이 요소 안에서만 동작. -->
					<!-- 1. Title Section (start) -->

					<div class="titleSection"
						style="font-size: 24pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; text-align: center;">
						휴일/연장 근무신청서</div><!-- 1. Title Section (end) -->
					<!-- 2. Draft Section (Start) -->

					<div class="partition"
						style="font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; text-align: center;">
						<!-- 2.1 Drafter Information (Start) -->

						<div class="left"
							style=" font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; text-align: center;">

							<table style="width:260px; height: 131px;">
								<colgroup>
									<col width="60">
									<col width="200">
								</colgroup>

								<tbody>
									<tr>
										<td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											문서번호
										</td>
										<td class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											<p style="text-align: center; font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">
												<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0"
													data-dsl="{{label:docNo}}" data-wrapper="" style="" data-value=""
													data-autotype=""><span class="comp_item">문서번호</span>
													<span contenteditable="false" class="comp_hover"
														data-content-protect-cover="true" data-origin="0">
														<a contenteditable="false" class="ic_prototype ic_prototype_trash"
															data-content-protect-cover="true" data-component-delete-button="true">
														</a>
													</span>
												</span>
											</p>
										</td>
									</tr>
									<tr>
										<td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											작성일자
										</td>
										<td class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											<p style="text-align: center;  font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">
												<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="1"
													data-dsl="{{label:draftDate}}" data-wrapper="" style="" data-value="" data-autotype=""></span>
													<span class="comp_item">기안일</span>
													<span contenteditable="false" class="comp_active" style="display:none;">

													<span contenteditable="false" class="comp_hover"
														data-content-protect-cover="true" data-origin="1">
														 <a contenteditable="false" class="ic_prototype ic_prototype_trash"
															data-content-protect-cover="true" data-component-delete-button="true">
														</a>
													</span>
												</span>
											</p>
										</td>
									</tr>
									<tr>
										<td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											작성부서
										</td>
										<td class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											<p style="text-align: center;  font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">
												<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2"
													data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value=""
													data-autotype=""><span class="comp_item">기안부서</span>
													<span contenteditable="false" class="comp_hover"
														data-content-protect-cover="true" data-origin="2">
														 <a contenteditable="false" class="ic_prototype ic_prototype_trash"
															data-content-protect-cover="true"
															data-component-delete-button="true">
														</a>
													</span>
												</span>
											</p>
										</td>
									</tr>
									<tr>
										<td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											작 성 자
										</td>
										<td class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
											<p style="text-align: center; font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">
												<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3"
													data-dsl="{{label:draftUser}}" data-wrapper="" style="" data-value="" data-autotype="">
													<span class="comp_item">기안자</span>
													<span contenteditable="false" class="comp_hover"
														data-content-protect-cover="true" data-origin="3">
														<a contenteditable="false" class="ic_prototype ic_prototype_trash"
															data-content-protect-cover="true" data-component-delete-button="true">
														</a>
													</span>
												</span>
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div><!-- 2.1 Drafter Information (end) -->
						<!-- 2.2 Draft Line (start) -->


					</div><!-- 2. Draft Section (end) -->
					<!-- 3. Detail Section (start) -->

					<table class="detailSection" style="width: 892px;">
						<colgroup>
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="100">
						</colgroup>

						<tbody>
							<tr>
								<td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									연장근무 신청자
								</td>
								<td colspan="3"
									class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="width: 84px;">
									<p
										style=" font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4"
											data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value=""
											data-autotype=""><span class="comp_item">기안부서</span>
											<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4">
												<a mcontenteditable="false" class="ic_prototype ic_prototype_trash"
													data-content-protect-cover="true" data-component-delete-button="true">
												</a>
											</span>
										 </span>&nbsp;
										 <span unselectable="on" contenteditable="false" class="comp_wrap"
											data-cid="5" data-dsl="{{label:draftUser}}" data-wrapper="" style="" data-value=""
											data-autotype=""><span class="comp_item">기안자</span>
											<span contenteditable="false"
												class="comp_hover" data-content-protect-cover="true" data-origin="5">
												<a contenteditable="false" class="ic_prototype ic_prototype_trash"
													data-content-protect-cover="true" data-component-delete-button="true">
												</a>
											</span>
										</span>
									</p>
								</td>
								<td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="width: 150px;">
									<p style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										사번</p>
								</td>
								<td colspan="3" class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="width: 439.4px;">
									<p style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6"
											data-dsl="{{label:empNo}}" data-wrapper="" style="" data-value="" data-autotype="">
											<span class="comp_item">사번</span>
											<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6">
												<a contenteditable="false" class="ic_prototype ic_prototype_trash"
													data-content-protect-cover="true" data-component-delete-button="true">
												</a>
											</span>
										</span>
										<br>
									</p>
								</td>
							</tr>
							<tr>
								<td colspan="8" class="BCel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									<p style="text-align: center;  font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">
										아래와 같이 휴일/연장 근무를 신청합니다.</p>
								</td>
							</tr>
						</tbody>
						<tbody id="dynamic_table1">
							<tr>
								<td rowspan="2" class="ACel rowspanTd1 dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									근무시간<br>
									<div class="viewModeHiddenPart div_button"
										style=" font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										<a class="button" id="plus1" data-bypass="">+</a>
										<a class="button" id="minus1" data-bypass="">-</a>
									</div>
								</td>
								<td colspan="3" class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="width: 84px;">
									<p style=" font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										날짜</p>
								</td>
								<td colspan="2" class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="width: 713px;">
									<p style=" font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										시간</p>
								</td>
								<td colspan="2" class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="width: 192.2px;">
									<p style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										총 연장근무 시간</p>
								</td>
							</tr>
							<tr class="copyRow1">
								<td colspan="3" class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="width: 84px;">
									<p style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7"
											data-dsl="{{calendar}}" data-wrapper="" style="" data-value="" data-autotype="">
											<input class="ipt_editor ipt_editor_date" type="text">
											<span contenteditable="false"
												class="comp_hover" data-content-protect-cover="true" data-origin="7">
												<a contenteditable="false" class="ic_prototype ic_prototype_trash"
													data-content-protect-cover="true" data-component-delete-button="true">
												</a>
											</span>
										 </span>
										 <br>
									</p>
								</td>
								<td colspan="2" class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="width: 713px;">
									<p style=" font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8"
											data-dsl="{{time}}" data-wrapper="" style="" data-value="" data-autotype="">
											<select>
												<option value="00" selected="selected">00</option>
												<option value="01">01</option>
											</select>시<select>
												<option value="00" selected="selected">00</option>
												<option value="01">01</option>
											</select>분
											<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8">
												<a contenteditable="false" class="ic_prototype ic_prototype_trash"
													data-content-protect-cover="true" data-component-delete-button="true">
												</a>
											</span>
										</span>~
										<span unselectable="on" contenteditable="false" class="comp_wrap"
											data-cid="9" data-dsl="{{time}}" data-wrapper="" style="" data-value="" data-autotype="">
											<select>
												<option value="00" selected="selected">00</option>
												<option value="01">01</option>
											</select>시<select>
												<option value="00" selected="selected">00</option>
												<option value="01">01</option>
											</select>분
											<span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
												data-origin="9"> <a contenteditable="false" class="ic_prototype ic_prototype_trash"
													data-content-protect-cover="true" data-component-delete-button="true"></a>
											</span>
										</span>
									</p>
								</td>
								<td colspan="2" class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="width: 192.2px;">
									<p style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="10"
											data-dsl="{{time}}" data-wrapper="" style="" data-value="" data-autotype="">
											<select>
												<option value="00" selected="selected">00</option>
												<option value="01">01</option>
											</select>시<select>
												<option value="00" selected="selected">00</option>
												<option value="01">01</option>
											</select>분
											<span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
												data-origin="10"> <a contenteditable="false" class="ic_prototype ic_prototype_trash"
													data-content-protect-cover="true" data-component-delete-button="true">
												</a>
											</span>
										</span>
										<br>
									</p>
								</td>
							</tr>
						</tbody>
						<tbody id="dynamic_table2">
						</tbody>
						<tbody id="dynamic_table3">
							<tr>
								<td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="background-color: rgb(255, 255, 255);" colspan="8">
									<p
										style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										※ 18:00시 부터 30분단위로 신청 가능, 날짜/시각/총 연장근무 시간 기입.<br></p>
									<p
										style=" font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										금주 내 연장근무 확정 예상 시 복수일 신청 가능.(+/- 버튼으로 날짜추가)</p>
								</td>
							</tr>
							<tr>
								<td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									<p style=" font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										근무사유</p>
								</td>
								<td colspan="7"
									class="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									<p style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="11"
											data-dsl="{{textarea}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype="">
											<textarea class="txta_editor"></textarea>
											<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="11">
												<a contenteditable="false" class="ic_prototype ic_prototype_trash"
													data-content-protect-cover="true" data-component-delete-button="true">
												</a>
											</span>
										</span>
										<br>
									</p>
								</td>
							</tr>
							<tr>
								<td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									<p style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										특이사항</p>
								</td>
								<td colspan="7" lass="BCel center dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									<p style="font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px; text-align: center;">
										<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="12"
											data-dsl="{{textarea}}" data-wrapper="" style="width: 100%;" data-value="" data-autotype="">
											<textarea class="txta_editor"></textarea>
											<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="12">
												<a contenteditable="false" class="ic_prototype ic_prototype_trash"
													data-content-protect-cover="true" data-component-delete-button="true">
												</a>
											</span>
										</span>
										<br>
									</p>
								</td>
							</tr>
							<tr>
								<td class="ACel dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"
									style="background-color: rgb(255, 255, 255);" colspan="8">
									<p
										style="text-align: center;line-height: 150%; margin-top: 0px; margin-bottom: 0px; font-size: 9pt;">
										<span
											style="color: rgb(255, 0, 0); font-size: 14pt;">※
											연장근무(휴일 포함)는 주 12시간을 초과할 수 없습니다.</span></p>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 3. Detail Section (end) -->
				</div><!-- Page Wrapping (end) -->
			</span>
            <!--  첨부파일 부분   -->
            <div class="file">
                <div id="editView">
                    <form>
                        <fieldset>
                            <table class="form_type form_report_nonscheduled">
                                <tbody>
                                    <tr id="attachPart">
                                        <th><span class="title">파일첨부</span></th>
                                        <td>
                                            <!-- 첨부파일 default -->
                                            <div id="dropZone" class="dd_attach">
                                                <div class="area_txt">
                                                    <span class="ic_attach ic_upload"></span>
                                                    <span class="msg">이곳에 파일을 드래그 하세요. 또는
                                                        <span class="btn_file">
                                                            <span class="txt">파일선택</span>
                                                            <input type="file" class="edit" name="file" title="파일선택"
                                                                multiple="" accept="undefined">
                                                        </span>
                                                        <span id="total_size" class="size"></span>
                                                    </span>
                                                </div>

                                                <!-- 파일 첨부 스타일  -->
                                                <ul class="file_wrap" id="fileWrap"></ul>
                                                <!-- 이미지 첨부 스타일  -->
                                                <ul class="img_wrap" id="imgWrap"></ul>
                                            </div>

                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </fieldset>
                    </form>
                </div>
            </div>
            <br>
        </div>
    </div>
    				<!--Style Start---------------------------------------->
<style type="text/css">
	#divCustomWrapper {
		word-break: break-all;
		font-family: malgun gothic, dotum, arial, tahoma;
		width: 800px !important;
	}

	#divCustomWrapper * {
		max-width: 800px !important;
	}

	#divCustomWrapper .titleSection {
		text-align: center;
		font-size: 24pt;
		font-weight: bold;
		margin-bottom: 30px !important;
		margin-top: 20px !important;
	}

	#divCustomWrapper .detailSection>* {
		margin-bottom: 10px;
	}

	#divCustomWrapper .detailSection {
		width: 800px !important;
		clear: both;
		margin-top: 10px !important;
		vertical-align: middle;
	}

	#divCustomWrapper table {
		border-collapse: collapse;
		word-break: break-all;
	}

	#divCustomWrapper div.partition {
		display: flex;
	}

	#divCustomWrapper div.partition.left {
		flex: 1;
	}

	#divCustomWrapper div.inaRowRight {
		flex: 1;
		text-align: right;
	}

	#divCustomWrapper td.BCel {
		font-size: 9pt !important;
		height: 25px;
		border: 1px solid black !important;
		padding: 3px 5px 3px 5px;
		/*top right bottom left*/
	}

	#divCustomWrapper td.ACel {
		font-size: 9pt !important;
		height: 25px;
		border: 1px solid black !important;
		padding: 3px 5px 3px 5px;
		text-align: center !important;
		background: rgb(221, 221, 221);
		font-weight: bold;
	}

	#divCustomWrapper td.noneborder {
		border: none !important;
	}

	#divCustomWrapper td.center {
		text-align: center;
	}

	#divCustomWrapper td.right {
		text-align: right;
	}

	#divCustomWrapper td.editor {
		height: 300px;
		vertical-align: top;
	}

	#divCustomWrapper td.area {
		height: 120px;
		vertical-align: middle;
	}

	#divCustomWrapper .div_button {
		word-break: break-all;
		padding: 3px;
		margin-top: 2px;
		margin-bottom: 2px !important;
		height: 22px;
		vertical-align: middle;
	}

	#divCustomWrapper a.button {
		background: rgb(102, 102, 102);
		color: rgb(255, 255, 255);
		padding: 2px 5px;
		border-radius: 3px;
	}

	p.freeP {
		font-weight: normal;
		font-size: 9pt;
		margin: 3px 1px 3px 5px;
	}
</style>
<style type="text/css">
	/* 인쇄 스타일. */
	@media print {
		.viewModeHiddenPart {
			display: none;
		}

		h1,
		h2,
		h3,
		h4,
		h5,
		dl,
		dt,
		dd,
		ul,
		li,
		ol,
		th,
		td,
		p,
		blockquote,
		form,
		fieldset,
		legend,
		div,
		body {
			-webkit-print-color-adjust: exact;
		}

		#divCustomWrapper {
			margin-left: auto !important;
			margin-right: auto !important;
		}

		#divCustomWrapper td.ACel {
			border: none\9 !important;
			outline: black solid 0.5px\9 !important;
		}
	}

	#divCustomWrapper td.BCel {
		border: none\9 !important;
		outline: black solid 0.5px\9 !important;
	}

</style>

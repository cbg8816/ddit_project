<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
                                                                        <td class="name">${empvo.empName }</td>
                                                                        <td class="depart">${empvo.department.depNm }</td>
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
            <span
                style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">

                <table
                    style="background: rgb(255, 255, 255); border: 0px currentcolor; width: 800px; color: rgb(0, 0, 0); font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse !important;">
                    <!-- Header -->
                    <colgroup>
                        <col width="310">
                        <col width="540">
                    </colgroup>

                    <tbody>
                        <tr>
                            <td style="padding: 0px; text-align: center; font-weight: bold; vertical-align: middle; border: 0px currentcolor !important; height: 90px !important;"
                                colspan="2"
                                class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                                <span
                                    style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                    <span
                                        style="font-size: 24pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">시내교통비청구서</span></span>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 0px !important; border: 0px currentColor; border-image: none;"
                                class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">

                                <table style="border-collapse: collapse !important;"><!-- User -->
                                    <colgroup>
                                        <col width="90">
                                        <col width="220">
                                    </colgroup>

                                    <tbody>
                                        <tr>
                                            <td
                                                style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                                                <span style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                                	작성일
                                                </span>
                                            </td>
                                            <td
                                                style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                                                <span unselectable="on" contenteditable="false" class="comp_wrap"
                                                    data-cid="76" data-dsl="{{label:draftDate}}" data-wrapper=""
                                                    style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                                    data-value="" data-autotype="">
                                                    <span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                                     <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd"/>
                                                    </span>
                                                        <span
                                                        contenteditable="false" class="comp_active"
                                                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                                    </span> <span contenteditable="false" class="comp_hover"
                                                        data-content-protect-cover="true" data-origin="76"
                                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                                        <a contenteditable="false"
                                                            class="ic_prototype ic_prototype_trash"
                                                            data-content-protect-cover="true"
                                                            data-component-delete-button="true"><span
                                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                                    </span> </span><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td
                                                style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                                                <span
                                                    style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                                    부서
                                                </span>
                                            </td>
                                            <td
                                                style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                                                <span unselectable="on" contenteditable="false" class="comp_wrap"
                                                    data-cid="77" data-dsl="{{label:draftDept}}" data-wrapper=""
                                                    style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                                    data-value="" data-autotype=""><span class="comp_item"
                                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                                        	${empvo.department.depNm }
                                                        </span><span
                                                        contenteditable="false" class="comp_active"
                                                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                                    </span> <span contenteditable="false" class="comp_hover"
                                                        data-content-protect-cover="true" data-origin="77"
                                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                                        <a contenteditable="false"
                                                            class="ic_prototype ic_prototype_trash"
                                                            data-content-protect-cover="true"
                                                            data-component-delete-button="true"><span
                                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                                    </span> </span><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td
                                                style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                                                <span
                                                    style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                                    직급
                                                </span>
                                            </td>
                                            <td
                                                style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                                                <p
                                                    style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                                                    <span unselectable="on" contenteditable="false" class="comp_wrap"
                                                        data-cid="78" data-dsl="{{label:position}}" data-wrapper=""
                                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                                        data-value="" data-autotype=""><span class="comp_item"
                                                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                                            	${empvo.position.posiNm }
                                                            </span>
                                                    </span> <span contenteditable="false" class="comp_hover"
                                                        data-content-protect-cover="true" data-origin="78"
                                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                                        <a contenteditable="false"
                                                            class="ic_prototype ic_prototype_trash"
                                                            data-content-protect-cover="true"
                                                            data-component-delete-button="true"><span
                                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                                    </span>
            </span><br>
            </p>
            </td>
            </tr>
            <tr>
                <td
                    style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                    <span
                        style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                        신청자
                    </span>
                </td>
                <td
                    style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                    <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="79"
                        data-dsl="{{label:draftUser}}" data-wrapper=""
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                        data-value="" data-autotype=""><span class="comp_item"
                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                            	${empvo.empName }
                            </span><span
                            contenteditable="false" class="comp_active"
                            style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                        </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                            data-origin="79"
                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                            <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                data-content-protect-cover="true" data-component-delete-button="true"><span
                                    style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span></a>
                        </span> </span><br>
                </td>
            </tr>
            <tr>
                <td
                    style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                    <span
                        style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                        전화번호
                    </span>
                </td>
                <td
                    style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                    <p
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                        <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="80"
                            data-dsl="{{label:mobileNo}}" data-wrapper=""
                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                            data-value="" data-autotype=""><span class="comp_item"
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                ${empvo.empTel }</span><span
                                contenteditable="false" class="comp_active"
                                style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">

                            </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                                data-origin="80"
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                    data-content-protect-cover="true" data-component-delete-button="true"><span
                                        style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 24px; margin-top: 0px; margin-bottom: 0px;"></span></a>
                            </span> </span><br>
                    </p>
                </td>
            </tr>
            </tbody>
            </table>

            </td>
            <td style="padding: 0px !important; border: 0px currentColor !important; border-image: none !important !important;
							width: 500px; text-align: right; vertical-align: top !important;" class="singnewmember">
                <!-- 결재선 기본값으로 신청 1명, 승인 7명으로 설정-->
                <span class="sign_type1_inline" style="line-height: normal; font-family: malgun gothic,dotum,arial,tahoma; font-size: 9pt; margin-top: 0px; margin-bottom: 0px;
			    			 	" data-group-seq="0" data-group-name="승인" data-group-max-count="7" data-group-type="type1"
                    data-is-reception="">
                    <span class="sign_tit_wrap">
                        <span class="sign_tit">
                            <strong>승인</strong>
                        </span>
                    </span>
                    <span class="sign_member_wrap" id="activity_">
                        <span class="sign_member">
                            <span class="sign_rank_wrap">
                                <span class="sign_posi">${empvo.position.posiNm }</span>
                            </span>
                            <span class="sign_wrap">
                                <span class="sign_name">${empvo.empName }</span>
                            </span>
                            <span class="sign_date_wrap">
                                <span class="sign_date" id="date_"></span>
                            </span>
                        </span>
                    </span>
                </span>
            </td>
            </tr>
            </tbody>
            </table>
            <br>

            <table style="background: rgb(255, 255, 255); border: 0px currentcolor; width: 800px; color: rgb(0, 0, 0); font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; margin-top: 10px; height: 423.636px; border-collapse: collapse !important;">
                <colgroup>
                    <col width="80">
                    <col width="80">
                    <col width="80">
                    <col width="80">
                    <col width="80">
                    <col width="80">
                    <col width="80">
                    <col width="80">
                    <col width="80">
                    <col width="80">
                </colgroup>

                <tbody>
                    <tr>
                        <td style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;"
                            colspan="10">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                ※ 시내 교통비 내역
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td
                            style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                일자
                            </span>
                        </td>
                        <td
                            style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                시간
                            </span>
                        </td>
                        <td
                            style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                사용자
                            </span>
                        </td>
                        <td
                            style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                출발지
                            </span>
                        </td>
                        <td
                            style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                목적지
                            </span>
                        </td>
                        <td
                            style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                거리(Km)
                            </span>
                        </td>
                        <td
                            style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                용무
                            </span>
                        </td>
                        <td
                            style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                금액
                            </span>
                        </td>
                        <td
                            style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                교통편
                            </span>
                        </td>
                        <td
                            style="background: rgb(221, 221, 221); padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                증빙유무
                            </span>
                        </td>
                    </tr>


                    <tr>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="38"
                                data-dsl="{{calendar}}" data-wrapper=""
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                data-value="">
                                <input class="ipt_editor ipt_editor_date" type="text" style="font-size: 10pt;">

                              </span><br>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="46"
                                data-dsl="{{time}}" data-wrapper=""
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                data-value=""><select style="font-size: 10pt;">
                                    <option value="00" selected="selected">
                                    	<span style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">00</span>
                                    </option>
                                    <option value="01">
                                    	<span style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">01</span>
                                    </option>
                                </select>시<select style="font-size: 10pt;">
                                    <option value="00" selected="selected">
                                    	<span style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">00</span>
                                    </option>
                                    <option value="01">
                                   	 <span style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">01</span>
                                    </option>
                                </select>분
                            </span>
                            <br>
                        </td>
                        <td style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="58"
                                data-dsl="{{text}}" data-wrapper=""
                                style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                data-value="">
                                <input class="ipt_editor" type="text" style="font-size: 10pt;">
                            </span>
                            <br>
                        </td>
                        <td style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="60"
                                data-dsl="{{text}}" data-wrapper=""
                                style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                data-value="">
                                <input class="ipt_editor" type="text" style="font-size: 10pt;">
                            </span>
                            <br>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="61"
                                data-dsl="{{text}}" data-wrapper=""
                                style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                data-value="">
                                <input class="ipt_editor" type="text" style="font-size: 10pt;">
                            </span>
                            <br>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: right; vertical-align: middle;">
                            <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="5"
                                data-dsl="{{number}}" data-wrapper=""
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                data-value="">
                                <input class="ipt_editor ipt_editor_num" type="text"  style="font-size: 10pt;">
                            </span>
                            <br>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2"
                                    data-dsl="{{text}}" data-wrapper=""
                                    style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                    data-value="">
                                    <input class="ipt_editor" type="text" style="font-size: 10pt;">
                                  </span>
                                <br>
                            </p>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: right; vertical-align: middle;">
                            <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="13"
                                data-dsl="{{currency_0}}" data-wrapper=""
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                data-value="">
                                <input class="ipt_editor ipt_editor_currency" type="text"
                                    style="font-size: 10pt;">
                            </span>
                            <br>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="22"
                                data-dsl="{{text}}" data-wrapper=""
                                style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                data-value=""><input class="ipt_editor" type="text" style="font-size: 10pt;">
                            </span>
                            <br>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="30"
                                data-dsl="{{cSel_O_X}}" data-wrapper=""
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                data-value=""><select class="editor_slt" style="font-size: 10pt;">
                                    <option selected="selected">
                                        <span style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">O</span>
                                    </option>
                                    <option>
                                        <span style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">X</span>
                                    </option>
                                </select><span contenteditable="false" class="comp_active" "="" style=" display: none;
                                    font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal;
                                    margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"> <span class="Active_dot1"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span><span
                                        class="Active_dot2"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span>
                                    <span class="Active_dot3"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span><span
                                        class="Active_dot4"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span>
                                </span> <span contenteditable="false" class="comp_hover"
                                    data-content-protect-cover="true" data-origin="30"
                                    style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                    <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                        data-content-protect-cover="true" data-component-delete-button="true"><span
                                            style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                </span>
                            </span>
                            <br>
                        </td>
                    </tr>




                    <tr>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <p
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="43"
                                    data-dsl="{{calendar}}" data-wrapper=""
                                    style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                    data-value=""><input class="ipt_editor ipt_editor_date" type="text"
                                        style="font-size: 10pt;"><span contenteditable="false" class="comp_active"
                                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <span class="Active_dot1"
                                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span>
                                    </span>
                                    <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                                        data-origin="43"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                            data-content-protect-cover="true" data-component-delete-button="true">
                                            <span
                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                    </span>
                                </span>
                                <br>
                            </p>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <p
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="51"
                                    data-dsl="{{time}}" data-wrapper=""
                                    style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                    data-value=""><select style="font-size: 10pt;">
                                        <option value="00" selected="selected"><span
                                                style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">00</span>
                                        </option>
                                        <option value="01"><span
                                                style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">01</span>
                                        </option>
                                    </select>시<select style="font-size: 10pt;">
                                        <option value="00" selected="selected"><span
                                                style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">00</span>
                                        </option>
                                        <option value="01"><span
                                                style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">01</span>
                                        </option>
                                    </select>분<span contenteditable="false" class="comp_active"
                                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <span class="Active_dot1"
                                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span>
                                    </span>
                                    <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                                        data-origin="51"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                            data-content-protect-cover="true" data-component-delete-button="true"><span
                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                    </span> </span><br>
                            </p>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <p
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="73"
                                    data-dsl="{{text}}" data-wrapper=""
                                    style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                    data-value=""><input class="ipt_editor" type="text" style="font-size: 10pt;">
                                    <span contenteditable="false" class="comp_active"
                                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <span class="Active_dot1"
                                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span>
                                    </span>
                                    <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                                        data-origin="73"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                            data-content-protect-cover="true" data-component-delete-button="true">
                                            <span
                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                    </span>
                                </span>
                                <br>
                            </p>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <p
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="74"
                                    data-dsl="{{text}}" data-wrapper=""
                                    style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                    data-value="">
                                    <input class="ipt_editor" type="text" style="font-size: 10pt;">
                                    <span contenteditable="false" class="comp_active"
                                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <span class="Active_dot1"
                                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span>
                                    </span>
                                    <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                                        data-origin="74"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                            data-content-protect-cover="true" data-component-delete-button="true">
                                            <span
                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                    </span>
                                </span>
                                <br>
                            </p>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <p
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="75"
                                    data-dsl="{{text}}" data-wrapper=""
                                    style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                    data-value=""><input class="ipt_editor" type="text" style="font-size: 10pt;">
                                    <span contenteditable="false" class="comp_active"
                                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <span class="Active_dot1"
                                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span>
                                    </span>
                                    <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                                        data-origin="75"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                            data-content-protect-cover="true" data-component-delete-button="true">
                                            <span
                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                    </span>
                                </span>
                                <br>
                            </p>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <p
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="9"
                                    data-dsl="{{number}}" data-wrapper=""
                                    style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                    data-value=""><input class="ipt_editor ipt_editor_num" type="text"
                                        style="font-size: 10pt;"><span contenteditable="false" class="comp_active"
                                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <span class="Active_dot1"
                                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span>
                                    </span>
                                    <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                                        data-origin="9"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                            data-content-protect-cover="true" data-component-delete-button="true">
                                            <span
                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                    </span>
                                </span>
                                <br>
                            </p>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                총계
                            </span>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: right; vertical-align: middle;">
                            <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="18"
                                data-dsl="{{currency_0}}" data-wrapper=""
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                data-value=""><input class="ipt_editor ipt_editor_currency" type="text"
                                    style="font-size: 10pt;"><span contenteditable="false" class="comp_active"
                                    style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                    <span class="Active_dot1"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                    </span>
                                </span>
                                <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                                    data-origin="18"
                                    style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                    <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                        data-content-protect-cover="true" data-component-delete-button="true"><span
                                            style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span>
                                    </a>
                                </span>
                            </span>
                            <br>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <p
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="27"
                                    data-dsl="{{text}}" data-wrapper=""
                                    style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                    data-value=""><input class="ipt_editor" type="text" style="font-size: 10pt;"><span
                                        contenteditable="false" class="comp_active"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <span class="Active_dot1"
                                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span>
                                    </span>
                                    <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                                        data-origin="27"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                            data-content-protect-cover="true" data-component-delete-button="true"><span
                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                    </span>
                                </span>
                                <br>
                            </p>
                        </td>
                        <td
                            style="padding: 3px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; vertical-align: middle;">
                            <p
                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 12pt;">
                                <span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="35"
                                    data-dsl="{{cSel_O_X}}" data-wrapper=""
                                    style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"
                                    data-value=""><select class="editor_slt" style="font-size: 10pt;">
                                        <option selected="selected">
                                            <span  style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">O</span>
                                        </option>
                                        <option>
                                            <span  style="font-size: 10pt; font-family: &quot;Malgun Gothic&quot;; line-height: normal; margin-top: 0px; margin-bottom: 0px;">X</span>
                                        </option>
                                    </select><span contenteditable="false" class="comp_active" "="" style=" display:
                                        none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height:
                                        18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <span class="Active_dot1"
                                            style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;"></span>
                                    </span>
                                    <span contenteditable="false" class="comp_hover" data-content-protect-cover="true"
                                        data-origin="35"
                                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px; font-size: 10pt;">
                                        <a contenteditable="false" class="ic_prototype ic_prototype_trash"
                                            data-content-protect-cover="true" data-component-delete-button="true"><span
                                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"></span></a>
                                    </span>
                                </span>
                                <br>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 10px; border: 1px solid rgb(0, 0, 0); border-image: none; height: 20px; text-align: center; vertical-align: middle;"
                            colspan="10">
                            <span
                                style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                                ※ 유류대 계산 기준 : 주행거리 (km) ÷ 연비 (km/ℓ) × ( ℓ당 연료비/보통 휘발유) × 150 % (10원 미만 절사)
                            </span>
                        </td>
                    </tr>
                    <span style="font-size: 10pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
                    </span>
                </tbody>
            </table>
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
            </span>
        </div>
    </div>

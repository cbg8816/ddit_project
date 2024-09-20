<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
        <div id="hd">
            <h1 id="hd_h1">루나힐풀빌라</h1>
            <div id="skip_to_container"><a href="#container">본문 바로가기</a></div>

            <div id="hd_wrapper">
                <div id="logo">
                    <a href="${cPath }/web/home.do">
                        <img src="${cPath }/resources/images/hotel_logo_small.png" alt="델루나">
                    </a>
                </div>
                <div id="hd_btn">

<!--                 	로그인 -->
					<c:set value="${pageContext.request.userPrincipal }" var="autentication"/>
					<security:authorize access="!isAuthenticated()">
	                    <a href="${cPath }/web/login.do" id="btn_resv">로그인</a>
	                </security:authorize>

					<security:authorize access="isAuthenticated()">
	                    <a href="${cPath}/web/revPage.do?what=${autentication.principal.realUser.memId}">${autentication.principal.realUser.memName } 님</a>&emsp;
	                    <a href="${cPath }/web/logout.do">로그아웃</a>&emsp;&emsp;
					</security:authorize>

					<security:authorize access="!isAuthenticated()">
                    	<a href="${cPath }/web/check" id="btn_resv">비회원 예약 확인</a>
                    </security:authorize>
                    <button type="button" id="gnb_menu_btn" title="전체메뉴">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                        <span class="sound_only">전체메뉴열기</span>
                    </button>
                </div>
            </div>
            <nav id="gnb">
                <h2>메인메뉴</h2>
                <div class="gnb_wrap">
                    <ul id="gnb_1dul">
                        <li class="gnb_btn">
                            <img src="http://nstayimg7.speedgabia.com/lunarhill2/common/logo.png" alt="루나힐풀빌라">
                            <button type="button" id="gnb_close_btn">
                                <i class="fa fa-times" aria-hidden="true"></i>
                                <span class="sound_only">메뉴닫기</span>
                            </button>
                        </li>
                        <li class="gnb_1dli">
                            <a href="${cPath }/web/introduce" class="gnb_1da">
                                <div class="flip-wrap js-flip">
                                    <span class="flip-txt">소개</span>
                                    <span class="flip-txt">Introduce</span>
                                </div>
                            </a>
                            <span class="bg"><i class="fa fa-angle-right pull-right"></i></span>
                            <div class="gnb_2dul">
                                <ul class="gnb_2dul_box">
                                    <li class="gnb_2dli"><a href="${cPath }/web/introduce" class="gnb_2da"
                                            data-text="호텔소개">호텔소개</a></li>
                                    <li class="gnb_2dli"><a href="${cPath }/web/membership"
                                            class="gnb_2da" data-text="회원등급소개">회원등급소개</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="gnb_1dli">
                            <a href="${cPath }/web/room/roomGuide" class="gnb_1da">
                                <div class="flip-wrap js-flip">
                                    <span class="flip-txt">객실</span>
                                    <span class="flip-txt">Room</span>
                                </div>
                                <div class="gnb_txt">객실</div>
                            </a>
                            <span class="bg"><i class="fa fa-angle-right pull-right"></i></span>
                            <div class="gnb_2dul">
                                <ul class="gnb_2dul_box">
                                    <li><a href="${cPath }/web/room/roomStandard" class="gnb_2da" data-text="스탠다드">스탠다드</a></li>
                                    <li><a href="${cPath }/web/room/roomDeluxe" class="gnb_2da" data-text="디럭스">디럭스</a></li>
                                    <li><a href="${cPath }/web/room/roomSuperior" class="gnb_2da" data-text="슈페리어">슈페리어</a></li>
                                    <li><a href="${cPath }/web/room/roomExecutive" class="gnb_2da" data-text="이그제큐티브">이그제큐티브</a></li>
                                    <li><a href="${cPath }/web/room/roomSweet" class="gnb_2da" data-text="스위트">스위트</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="gnb_1dli">
                            <a href="${cPath }/web/facility" class="gnb_1da h_facil">
                                <div class="flip-wrap js-flip">
                                    <span class="flip-txt">부대시설</span>
                                    <span class="flip-txt">Facilities</span>
                                </div>
                                <div class="gnb_txt">부대시설</div>
                            </a>
                            <span class="bg"><i class="fa fa-angle-right pull-right"></i></span>
                            <div class="gnb_2dul">
                                <ul class="gnb_2dul_box">
                                    <li><a href="${cPath }/web/facility/dining" class="gnb_2da" data-text="다이닝">다이닝</a></li>
                                    <li><a href="${cPath }/web/facility/fitness" class="gnb_2da" data-text="헬스장">헬스장</a></li>
                                    <li><a href="${cPath }/web/facility/indoorPool" class="gnb_2da" data-text="실내풀">실내풀</a></li>
                                    <li><a href="${cPath }/web/facility/outdoorPool" class="gnb_2da" data-text="인피니티풀">인피니티풀</a></li>
                                    <li><a href="${cPath }/web/facility/banquet" class="gnb_2da" data-text="연회장">연회장</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="gnb_1dli">
                            <a href="${cPath }/web/tour" class="gnb_1da">
                                <div class="flip-wrap js-flip">
                                    <span class="flip-txt">관광지</span>
                                    <span class="flip-txt">Tour</span>
                                </div>
                            </a>
                            <span class="bg"><i class="fa fa-angle-right pull-right"></i></span>
                            <div class="gnb_2dul">
                                <ul class="gnb_2dul_box">
                                    <li><a href="${cPath }/web/tour" class="gnb_2da" data-text="관광지안내">관광지안내</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="gnb_1dli">
                            <a href="${cPath }/web/reservation" class="gnb_1da">
                                <div class="flip-wrap js-flip">
                                    <span class="flip-txt">예약</span>
                                    <span class="flip-txt">Reservation</span>
                                </div>
                                <div class="gnb_txt">예약</div>
                            </a>
                            <span class="bg"><i class="fa fa-angle-right pull-right"></i></span>
                            <div class="gnb_2dul">
                                <ul class="gnb_2dul_box">
                                    <li><a href="${cPath }/web/reservationGuide" class="gnb_2da" data-text="예약안내">예약안내</a></li>
                                    <li><a href="${cPath }/web/reservation" class="gnb_2da" data-text="실시간예약">실시간예약</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="gnb_1dli">
                            <a href="${cPath }/web/inquire/list.do" class="gnb_1da">
                                <div class="flip-wrap js-flip">
                                    <span class="flip-txt">문의</span>
                                    <span class="flip-txt">Inquiry</span>
                                </div>
                                <div class="gnb_txt">이용문의</div>
                            </a>
                            <span class="bg"><i class="fa fa-angle-right pull-right"></i></span>
                            <div class="gnb_2dul">
                                <ul class="gnb_2dul_box">
                                	<li><a href="${cPath }/web/inquire/list.do" class="gnb_2da" data-text="이용문의">이용문의</a></li>
                                    <li><a href="${cPath }/web/faq" class="gnb_2da" data-text="FAQ">FAQ</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <script>
                $(function () {
                    $(window).scroll(function () {
                        if ($(this).scrollTop() > 0) {
                            $("#hd").addClass("sticky");
                        } else {
                            $("#hd").removeClass("sticky");
                        }
                    });

                    var $gnb = $(".gnb_1dli > a");
                    $gnb.mouseover(function () {
                        $("#hd").addClass("hd_over");
                        $(".gnb_1dli").removeClass("gnb_1dli_over gnb_1dli_on");
                        $(this).parent().addClass("gnb_1dli_over gnb_1dli_on");
                    });

                    $gnb.bind("click", function (e) {
                        if ($("#gnb .gnb_wrap").hasClass("active")) {
                            var $li = $(this).closest(".gnb_1dli");

                            if ($li.hasClass("gnb_1dli_over") && $li.find(".gnb_2dul").is(":visible"))
                                $li.removeClass("gnb_1dli_over gnb_1dli_on").find(".gnb_2dul").slideUp();
                            else if (!$li.find(".gnb_2dul").is(":visible")) {
                                $(".gnb_1dli").removeClass("gnb_1dli_over gnb_1dli_on").find(".gnb_2dul").slideUp();
                                $li.addClass("gnb_1dli_over gnb_1dli_on").find(".gnb_2dul").slideDown();
                            }
                            return false;
                        }
                    });

                    $('#gnb_1dul>li').bind('mouseleave', function () {
                        submenu_hide();
                    });

                    $(".gnb_2dli > a").mouseover(function () {
                        $(".gnb_1dli").removeClass("gnb_1dli_over gnb_1dli_on");
                        $(this).closest(".gnb_1dli").addClass("gnb_1dli_over gnb_1dli_on");
                    });

                    $('.gnb_2dli').bind('mouseleave', function () {
                        submenu_hide();
                    });

                    $('#hd').bind('mouseleave', function () {
                        $(this).removeClass("hd_over");
                    });

                    $("#gnb_menu_btn").click(function () {
                        $("#gnb").addClass("gnb_open");
                        setTimeout(function () {
                            $("#gnb .gnb_wrap").addClass("active");
                        }, 1);
                    });

                    $("#gnb_close_btn").click(function () {
                        $("#gnb .gnb_wrap").removeClass("active");
                        setTimeout(function () {
                            $("#gnb").removeClass("gnb_open");
                        }, 300);
                    });
                });

                function submenu_hide() {
                    $(".gnb_1dli").removeClass("gnb_1dli_over gnb_1dli_on");
                }
            </script>
        </div>
        <script>
            $(function () {
                $(".hd_pops_reject").click(function () {
                    var id = $(this).attr('class').split(' ');
                    var ck_name = id[1];
                    var exp_time = parseInt(id[2]);
                    $("#" + id[1]).css("display", "none");
                    set_cookie(ck_name, 1, exp_time, g5_cookie_domain);
                });

                $('.hd_pops_close').click(function () {
                    var idb = $(this).attr('class').split(' ');
                    $('#' + idb[1]).css('display', 'none');
                });
            });
        </script>

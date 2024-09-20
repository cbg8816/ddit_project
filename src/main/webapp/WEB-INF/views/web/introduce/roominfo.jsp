<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <section>

        <div class="svisual payment">
            ROOM GUIDE<br>
            <b>객실 안내</b>
        </div>

        <div id="room">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-title">객실 안내</h3>
                        <div class="room-intro-guide">
                            <div class="room-intro wow sildeUp">
                                <div class="room-image wow slideRight">
                                    <img src="${cPath }/resources/PMS/image/호텔객실11.jpg" alt="스탠다드" />
                                </div>
                                <div class="room-description wow slideLeft">
                                    <p class="room-des-title">스탠다드</p>
                                    <p class="room-des-des">최고의 호텔 서비스를 부담 없는 가격으로</p>
                                    <div class="room-in">
                                        <p>면적 : 33m²</p>
                                        <p>인원 : 2명</p>
                                        <p>베드 타입 : KING</p>
                                    </div>
                                    <a href="${cPath }/web/room/roomStandard" class="room-more">상세보기</a>
                                </div>
                            </div>
                            <div class="room-intro wow sildeUp">
                                <div class="room-image wow slideRight">
                                    <img src="${cPath }/resources/PMS/image/호텔객실12.jpg" alt="디럭스" />
                                </div>
                                <div class="room-description wow slideLeft">
                                    <p class="room-des-title">디럭스</p>
                                    <p class="room-des-des">온돌과 더블온돌 및 트윈, 헐리우드, 더블 등 다섯 가지의 타입의 객실이 있습니다. 한실 구조의 온돌은 유리장과 벽지를 한지로 마감하여 아늑하고 은은한 한식의 분위기가 방안 가득히 배어나는 고급 한옥의 정갈한 맛을 더해 드립니다.</p>
                                    <div class="room-in">
                                        <p>면적 : 42.1m²</p>
                                        <p>인원 : 2명</p>
                                        <p>베드 타입 : KING</p>
                                    </div>
                                    <a href="${cPath }/web/room/roomDeluxe" class="room-more">상세보기</a>
                                </div>
                            </div>
                            <div class="room-intro wow sildeUp">
                                <div class="room-image wow slideRight">
                                    <img src="${cPath }/resources/PMS/image/호텔객실1.jpg" alt="슈페리어" />
                                </div>
                                <div class="room-description wow slideLeft">
                                    <p class="room-des-title">슈페리어</p>
                                    <p class="room-des-des">부담 없는 가격으로 즐기는 최고급 호텔서비스</p>
                                    <div class="room-in">
                                        <p>면적 : 42.1m²</p>
                                        <p>인원 : 2명</p>
                                        <p>베드 타입 : KING</p>
                                    </div>
                                    <a href="${cPath }/web/room/roomSuperior" class="room-more">상세보기</a>
                                </div>
                            </div>

                            <div class="room-intro wow sildeUp">
                                <div class="room-image wow slideRight">
                                    <img src="${cPath }/resources/PMS/image/호텔객실2.jpg" alt="이그제큐티브" />
                                </div>
                                <div class="room-description wow slideLeft">
                                    <p class="room-des-title">이그제큐티브</p>
                                    <p class="room-des-des">EXECUTIVE SUITE는 시설 하나 하나에 최고의 품격을 담기 위해 최선을 다한 객실입니다. 특히 하이원 그랜드호텔 메인타워의 EXECUTIVE SUITE는 모시는 분의 품격에 맞춰 최고의 아름다움을 표현하기에 부족함이 없도록 준비한 객실입니다.</p>
                                    <div class="room-in">
                                        <p>면적 : 130.9m²</p>
                                        <p>인원 : 2명</p>
                                        <p>베드 타입 : DOUBLE/DOUBLE</p>
                                    </div>
                                    <a href="${cPath }/web/room/roomExecutive" class="room-more">상세보기</a>
                                </div>
                            </div>
                            <div class="room-intro wow sildeUp">
                                <div class="room-image wow slideRight">
                                    <img src="${cPath }/resources/PMS/image/호텔객실스위트3.jpg" alt="스위트" />
                                </div>
                                <div class="room-description wow slideLeft">
                                    <p class="room-des-title">스위트 룸</p>
                                    <p class="room-des-des">최고급 객실의 진수를 선보이기 위한 하이원 그랜드호텔(메인타워)의 단 하나의 객실 PRESIDENTIAL SUITE입니다. 아름답고 화려한 응접실과 침실, 우아한 인테리어 소품들은 그것 자체 만으로도 최고라고 자부할 수 있습니다.</p>
                                    <div class="room-in">
                                        <p>면적 : 478.4m²</p>
                                        <p>인원 : 4명</p>
                                        <p>베드 타입 : KING/KING</p>
                                    </div>
                                    <a href="${cPath }/web/room/roomSweet" class="room-more">상세보기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            new WOW().init();
        </script>

    </section>
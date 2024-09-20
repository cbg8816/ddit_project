<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
	<div class="svisual payment">
		room<br> <b>객실 소개</b> <br>
	</div>
	<div class="roomType">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-title">스탠다드</h3>
					<div class="swiper wow slideDown">
						<!-- Additional required wrapper -->
						<div class="swiper-wrapper">
							<!-- Slides -->
							<div class="swiper-slide">
								<img src="${cPath }/resources/PMS/image/호텔객실11.jpg" alt="호텔객실" />
							</div>
							<div class="swiper-slide">
								<img src="${cPath }/resources/PMS/image/호텔객실8.jpg" alt="호텔객실" />
							</div>
							<div class="swiper-slide">
								<img src="${cPath }/resources/PMS/image/호텔객실9.jpg" alt="호텔객실" />
							</div>
							<div class="swiper-slide">
								<img src="${cPath }/resources/PMS/image/호텔객실10.jpg" alt="호텔객실" />
							</div>
						</div>
						<!-- 이전, 다음 버튼 필요시 추가 -->
						<div class="swiper-prev slide-button">
							<i class="fa-solid fa-chevron-left"></i>
						</div>
						<div class="swiper-next slide-button">
							<i class="fa-solid fa-chevron-right"></i>
						</div>
					</div>
					<div class="room-each-box row room-res-info">
						<div class="room-each-title col-lg-2 wow slideRight">
							<p>객실정보</p>
						</div>
						<div class="room-each-des col-lg-10 wow slideLeft">
							<dl>
								<dd>체크인</dd>
								<dt>15:00</dt>
							</dl>
							<dl>
								<dd>체크아웃</dd>
								<dt>12:00</dt>
							</dl>
							<dl>
								<dd>객실구성</dd>
								<dt>침실 1, 욕실 1</dt>
							</dl>
							<dl>
								<dd>투숙인원</dd>
								<dt>2명/3명(추가)</dt>
							</dl>
							<dl>
								<dd>베드</dd>
								<dt>KING</dt>
							</dl>
							<dl>
								<dd>면적</dd>
								<dt>33m²</dt>
							</dl>
							<dl>
								<dd>프런트</dd>
								<dt>033-339-1225</dt>
							</dl>
							<dl>
								<dd>예약</dd>
								<dt>033-339-0000</dt>
							</dl>
						</div>
					</div>
					<div class="room-each-box row amenity">
						<div class="room-each-title col-lg-2 wow slideRight">
							<p>어메니티</p>
						</div>
						<div class="room-each-des col-lg-10 wow slideLeft">
							<div class="amenity-each-box d-flex">
								<div class="icon shape1"></div>
								<dl>
									<dd>타월류</dd>
									<dt>핸드 타월, 베스 타월, 발 매트, 워시 타월, 가운</dt>
								</dl>
							</div>
							<div class="amenity-each-box d-flex">
							<div class="icon shape2"></div>
							<dl>
								<dd>가전류</dd>
								<dt>사운드 바, 미니바 냉장고, IP TV 2</dt>
							</dl>
							</div>
							<div class="amenity-each-box d-flex">
							<div class="icon shape3"></div>
							<dl>
								<dd>비품류</dd>
								<dt>안전금고, 캡슐 커피머신, 커피포트, 헤어 드라이어, 다리미&보드, 글라스류, 체중계, 우산</dt>
							</dl>
							</div>
							<div class="amenity-each-box d-flex">
							<div class="icon shape4"></div>
							<dl>
								<dd>소모품</dd>
								<dt>
									욕실 어메니티 : 샴푸, 컨디셔너, 샤워 젤, 로션, 비누, 핸드워시, 면봉, 화장솜, 위생 백, 샤워캡, 네일 파일, 바늘쌈
									<br />
									커피, 차 종류 : 원두커피, 디카페인 커피, 홍차, 녹차, 허브차, 우롱차, 생수
								</dt>
							</dl>
							</div>
							<div class="amenity-each-box d-flex">
							<div class="icon shape5"></div>
							<dl>
								<dd>인쇄물</dd>
								<dt>서비스 디렉토리, 룸서비스 메뉴 비치된 QR로 확인 가능</dt>
							</dl>
							</div>
							<div class="amenity-each-box d-flex">
							<div class="icon shape6"></div>
							<dl>
								<dd>대여품</dd>
								<dt>가습기, 엑스트라 베드, 베드 가드, 아기 침대 및 욕조</dt>
							</dl>
							</div>
							<div class="amenity-each-box d-flex">
							<div class="icon shape7"></div>
							<dl>
								<dd>TV/인터넷</dd>
								<dt>50개 이상의 채널, Wi fi 가능, 랜선 대여 (무료)</dt>
							</dl>
							</div>
						</div>
					</div>
					<div class="res-dir-btn wow slideUp">
						<a href="${cPath }/web/reservation" >예약하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>

<script>
	new WOW().init();

	new Swiper('.swiper', {
		direction : 'horizontal', // 슬라이드 진행 방향, 기본값 horizontal(가로)
		loop : true, // 반복재생 여부
		slidesPerView : 3, // 한번에 보여줄 슬라이드 개수
		spaceBetween : 10, // 슬라이드 사이 여백
		// nav 화살표 출력 시 추가
		navigation : {
			prevEl : '.swiper-prev',
			nextEl : '.swiper-next',
		},
	});
</script>
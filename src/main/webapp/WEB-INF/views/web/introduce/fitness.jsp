<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section id="tour">

	<div class="svisual payment">
		FACILITIES<br> <b>부대시설</b>
	</div>

	<div id="room">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-title">헬스장</h3>
					<div class="swiper wow slideDown">
						<!-- Additional required wrapper -->
						<div class="swiper-wrapper">
							<!-- Slides -->
							<div class="swiper-slide">
								<img src="${cPath }/resources/PMS/image/피트니스.png" alt="피트니스" />
							</div>
							<div class="swiper-slide">
								<img src="${cPath }/resources/PMS/image/피트니스1.png" alt="피트니스1" />
							</div>
							<div class="swiper-slide">
								<img src="${cPath }/resources/PMS/image/피트니스2.png" alt="피트니스2" />
							</div>
							<div class="swiper-slide">
								<img src="${cPath }/resources/PMS/image/피트니스3.png" alt="피트니스3" />
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
							<p>부대시설 정보</p>
						</div>
						<div class="room-each-des col-lg-10 wow slideLeft">
							<dl>
								<dd>운영시간</dd>
								<dt>08:00~22:00</dt>
							</dl>
							<dl>
								<dd>요금</dd>
								<dt>별도 안내</dt>
							</dl>
							<dl>
								<dd>위치</dd>
								<dt>HOTEL PARADISE GOLD WING 3층</dt>
							</dl>
							<dl>
								<dd>연락처</dd>
								<dt>033-339-1225</dt>
							</dl>
						</div>
					</div>
					<div class="guide-box wow slideUp">
						<div class="guide-title">
							<p>유의사항</p>
						</div>
						<div class="dotList">
							<ul>
								<li>피트니스 입장은 영업 종료시간 30분전까지 입니다.</li>

								<li>투숙객 전용 시설로 투숙 기간 內 이용 가능합니다. (1객실 당 2인 기준)</li>

								<li>피트니스는 1박 1회 이용 가능합니다.</li>

								<li>분실 위험이 있는 귀중품은 데스크에 보관해주시기 바랍니다.</li>
								<li>쾌적한 환경을 위하여 외부음식 반입을 삼가여 주시기 바랍니다.</li>
								<li>Fitness는 만 16세 이상 고객에 한해 입장 가능합니다.</li>
								<li>운동복, 운동화, 양말은 유료 서비스로 제공되며, 대여 가능시간은 06:00 ~ 21:30 입니다. (대여료 : 10,000원)</li>

								<li>입장 시 운동복과 실내운동화를 착용해 주시기 바랍니다.</li>
								<li>고객 부주의로 인한 사고 발생 시 호텔은 책임지지 않습니다.</li>
								<li>안전한 이용을 위해 금속, 플라스틱, 유리제품 등 날카롭거나 깨질 수 있는 물건의 반입을 금하고 있습니다. </li>
								<li>타인에게 상해를 입힐 수 있는 액세서리 및 안경 등의 착용을 삼가 주시기 바랍니다.</li>
							</ul>
						</div>
					</div>
					<div class="res-dir-btn wow slideUp">
						<a href="${cPath }/web/facility" >부대시설 전체보기</a>
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
		slidesPerView : 1, // 한번에 보여줄 슬라이드 개수
		spaceBetween : 10, // 슬라이드 사이 여백
		// nav 화살표 출력 시 추가
		navigation : {
			prevEl : '.swiper-prev',
			nextEl : '.swiper-next',
		},
	});
</script>
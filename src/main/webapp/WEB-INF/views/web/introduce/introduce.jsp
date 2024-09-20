<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0db3bd582c867980af2098bbb92300d0"></script>

<section>
	<div class="svisual payment">
		INTRODUCE<br> <b>호텔 소개</b> <br>
	</div>
	<div id="hotel-intro">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	                <h3 class="page-title">호텔 소개</h3>
	                <div class="prolog-intro">
	                    <div class="intro wow slideRight">
							<p style="font-weight:bold; font-size: 2rem;">PROLOG</p>
							<p style="font-size: 2rem;">끝없는 하늘과 바다가 이어진 <br />H HOTEL</p>
							아름다운 동해바다가 파노라마로 펼쳐지는 캔버스 위 그림 같은 이 곳
							사랑하는 사람이 더욱 사랑스러워지고
							가정의 관계가 더욱 돈독해지는 시간
							광활한 블루로드 속에서
							연인과 가족의 소중함을 세겨갈 수 있는 곳
							눈 앞에 그려진 하늘과 바다는 경계 없이 그라데이션을 이루고
							Pool 에는 물감을 한 방울 떨군 듯 부드럽지만 선명하게 물든 달이
							하늘의 달보다 더욱 밝은 이 곳에서, 고요한 이 곳에서 밖에서의
							모든 소음을 차단하고 오로지 당신만을 위한 시간을 쓸 수 있도록
							당신을 보듬어 주는 이 곳은 바로 H HOTEL 입니다.
	                    </div>
	                    <div class="intro prolog-image  wow slideLeft">
	                        <img src="${cPath }/resources/PMS/image/진도_쏠비치.jpg" alt="introduce" />
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
		<div id="pro_txt" class="wow slideDown">
		    프라이빗하게 즐기는 휴식 시간<br>
		    아름다운 바다를 품은<br>
		    <b>경주 최고의 휴식처를 소개</b>합니다.
		</div>
		<div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	            	<div class="wow slideRight">
	                    <h3 class="page-title">호텔 오시는길</h3>
	                    <p>경상북도 경주시 감포읍 감포로 287</p>
						<p>TEL. 010-3333-3333</p>
	            	</div>
	            	<div class="wow slideUp">
	            		<div id="map" style="width: 1000px; height: 650px; margin: 0 auto;">

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
<script type="text/javascript">

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
// 	    center: new kakao.maps.LatLng(36.3250154, 127.4088838), // 지도의 중심좌표
	    center: new kakao.maps.LatLng(35.8129185720344, 129.508789261983), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	//마커가 표시될 위치입니다
// 	var markerPosition  = new kakao.maps.LatLng(36.3250154, 127.4088838);
	var markerPosition  = new kakao.maps.LatLng(35.8129185720344, 129.508789261983);

	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
	position: markerPosition
	});

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

</script>
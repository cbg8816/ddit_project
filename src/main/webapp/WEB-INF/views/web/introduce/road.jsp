<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3209ae58b5945fe5cc6a9ff514dfe583"></script>
   <section>

      <div class="svisual payment">
		INTRODUCE<br> <b>오시는길</b> <br>
	</div>

        <div id="hotel-road">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-title">오시는길</h3>
                        <div id="map" style="width: 500px; height: 400px;">

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

	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(36.3250154, 127.4088838), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

</script>
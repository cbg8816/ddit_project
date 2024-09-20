<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty message }">
<script>
	swal("${message}", "", "success");

</script>
<c:remove var="message" scope="session"/>
</c:if>


<section id="index">

        <div class="section video" style="height: 945px;">
            <div class="MyFrame">
                <video id="MyVideo" autoplay="" loop="" playsinline="" muted="" width="100%" height="auto">
                    <source src="http://gonylabvid02.speedgabia.com/therivers/main.mp4" type="video/mp4" />
                </video>
            </div>

            <!--<h2><img src="images/idx_ttl.png" alt="" width="650" height="350" /></h2>-->

            <div class="btns">
<!--                 <div class="b01"> -->
<!--                     <a href="rooms.html?num=01"><span>View Our Rooms</span></a> -->
<!--                 </div> -->
<!--                 <div class="b02"> -->
<!--                     <a href="video.html"><span>Watch Full Video</span></a> -->
<!--                 </div> -->
            </div>

            <!-- <div class="scroll">
                <a href="#"><img src="images/scroll.png" alt="" width="40" height="52" /></a>
            </div> -->
        </div>

        <div class="section special">
            <div class="wow slideUp">
                <div class="wow slideDown">
                    <div class="main_txt">THE RIVER.S</div>

                    <h3>이국적인 럭셔리 기준의 재정의</h3>

                    <h4>
                        지중해풍 아치가 펼쳐지는 이국적인 미온수 수영장과<br>
                        그 주변을 감싸듯이 위치하고 있는 2가지 타입, 총 10개의 객실로 구성되어 있습니다.<br>
                        리버뷰 가든과 어울어지는 더리버S풀빌라는 여러분의 럭셔리의 기준을 재정의합니다.
                    </h4>
                </div>
            </div>
        </div>

        <div id="mtourNS">
            <div class="mttit">
                <div class="wow slideUp">호텔이 <b>추천하는</b> 관광지</div>
                <ul class="wow slideDown">
                    <li>#대릉원</li>
                    <li>#첨성대</li>
                    <li>#문무대왕릉</li>
                    <li>#옥산서원</li>
                    <li>#보문관광단지</li>
                    <li>#황성공원</li>
                </ul>
            </div>
            <div class="mtitem wow slideUp">
                <ul>
                    <li data-tour="대릉원"><img src="http://nstayimg7.speedgabia.com/lunarhill2/main/mto_01.png" alt=""></li>
                    <li data-tour="첨성대"><img src="http://nstayimg7.speedgabia.com/lunarhill2/main/mto_02.png" alt=""></li>
                    <li data-tour="문무대왕릉"><img src="http://nstayimg7.speedgabia.com/lunarhill2/main/mto_03.png" alt=""></li>
                    <li data-tour="옥산서원"><img src="http://nstayimg7.speedgabia.com/lunarhill2/main/mto_04.png" alt=""></li>
                    <li data-tour="보문관광단지"><img src="http://nstayimg7.speedgabia.com/lunarhill2/main/mto_05.png" alt=""></li>
                    <li data-tour="황성공원"><img src="http://nstayimg7.speedgabia.com/lunarhill2/main/mto_06.png" alt=""></li>
                </ul>
            </div>
            <a href="${cPath }/web/tour" class="wow slideUp">관광지 자세히 보기</a>
        </div>

        <script>
            new WOW().init();
        </script>

    </section>
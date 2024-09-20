<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.selected {
  background-color: #ddd; /* 원하는 색상으로 변경 */
}
.room-grid {
  perspective: 1000px; /* 입체 효과를 위한 투영점 설정 */
  transition: transform 0.3s ease-in-out; /* 부드러운 변환 효과 */
}

.room-grid:hover {
  transform: scale(1.05); /* 마우스 호버 시 5% 확대 */
  box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
}
 div[data-coreui-calendar-index="1"] {
            display: none; /* 요소를 완전히 숨김 */
}
.counter-container {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}

.humanNoBtn {
    background-color: #6F5F4B; /* 버튼 배경색 */
    border: none;
    color: white; /* 버튼 텍스트 색상 */
    padding: 10px 20px;
    font-size: 18px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s, transform 0.2s;
}

.humanNoBtn:hover {
    background-color: #6F5F4B; /* 호버 시 배경색 */
}

.humanNoBtn:active {
    transform: scale(0.95); /* 클릭 시 버튼 눌리는 효과 */
}

#humanNo {
    width: 80px;
    height: 40px; /* 세로 크기 증가 */
    text-align: center;
    font-size: 18px;
    padding: 10px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    box-sizing: border-box; /* padding과 border를 포함한 전체 박스 크기 계산 */
}

.unit {
    font-size: 18px;
    line-height: 40px; /* 입력 필드와 동일한 높이로 맞춰서 수직 가운데 정렬 */
}
.room-grid{
display:none;
}
</style>

<section id="reservation">
        <div class="svisual payment">
            RESERVATION<br>
            <b>예약</b>
        </div>


        <div class="container res-tab">
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-bs-toggle="tab" href="#tab-res-1">실시간예약</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#tab-res-2">예약안내</a>
                </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div id="tab-res-1" class="container tab-pane active"><br>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="text-container">
                                <h3 class="tab-content-title">RESERVATION</h3>
                                <div class="page-progress">
                                    <div class="progress-info">
                                        <div class="progress-circle active">
                                            <i class="fa-solid fa-calendar-days"></i>
                                        </div>
                                        <p>객실선택</p>
                                    </div>
                                    <div class="progress-next">
                                        <div class="circle"></div>
                                        <div class="circle"></div>
                                        <div class="circle"></div>
                                    </div>
                                    <div class="progress-info">
                                        <div class="progress-circle">
                                            <i class="fa-regular fa-credit-card"></i>
                                        </div>
                                        <p>결제</p>
                                    </div>
                                    <div class="progress-next">
                                        <div class="circle"></div>
                                        <div class="circle"></div>
                                        <div class="circle"></div>
                                    </div>
                                    <div class="progress-info">
                                        <div class="progress-circle">
                                            <i class="fa-solid fa-check"></i>
                                        </div>
                                        <p>결제완료</p>
                                    </div>
                                </div>
                                <P>[체크인/체크아웃 날짜를 먼저 선택 해 주세요.]</P>
                                <!-- 참고용 예약 폼 -->
                                <!-- <div class="thumb tab_01">
                                    <iframe src="https://digitalnow.co.kr/booking/stepR1/riverflows" width='100%' height='2300' frameborder=0></iframe>
                                </div> -->
                                <div class="res-flex">
                                    <div class="col-lg-9 me-2">
                                        <div data-coreui-start-date="2024/09/03" data-coreui-end-date="2024/09/05"
                                            data-coreui-locale="ko-KR" data-coreui-toggle="date-range-picker">
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <a href="#" id="dateBtn" class="res-room-btn">검색</a>
                                    </div>
                                    
                                </div>
                                <P>[인원을 먼저 선택 해 주세요.]</P>
                                <div>
   										 <button onclick="decrease()" class="humanNoBtn">-</button>
    										<input type="number" id="humanNo" value="0" min="0" readonly>
    										 <span class="unit">명</span>
   										 <button onclick="increase()" class="humanNoBtn">+</button>
									</div>
									<div id="roomsContainer" class="room-select">
										<div class="room-grid" id="roomTypeDiv1">
											<div class="res-room-image">
                            			   		<img src="${cPath}/resources/PMS/image/호텔객실11.jpg" alt="Standard" />
                        		   			</div>
                          			 		<div class="res-room-description">
                              				 	<p class="room-title">Standard</p>
                              				 	<p class="room-des">고급스러운 분위기와 함께 편안한 휴식을 제공합니다.</p>
                               					<p class="room-price"><i class="fa-solid fa-won-sign"></i>150,000</p>
                            				</div>
										</div>
										<div class="room-grid" id="roomTypeDiv2">
											<div class="res-room-image">
                            			   		<img src="${cPath}/resources/PMS/image/호텔객실1.jpg" alt="Superior" />
                        		   			</div>
                          			 		<div class="res-room-description">
                              				 	<p class="room-title">Superior</p>
                              				 	<p class="room-des">편안하고 기본적인 편의 시설을 갖춘 방입니다.</p>
                               					 <p class="room-price"><i class="fa-solid fa-won-sign"></i>180,000</p>
                            				</div>
										</div>
									<div class="room-grid" id="roomTypeDiv3">
											<div class="res-room-image">
                            			   		<img src="${cPath}/resources/PMS/image/호텔객실12.jpg" alt="Deluxe" />
                        		   			</div>
                          			 		<div class="res-room-description">
                              				 	<p class="room-title">Deluxe</p>
                              				 	<p class="room-des">기본 방보다 업그레이드된 시설과 추가 편의 시설을 제공하는 방입니다.</p>
                               					 <p class="room-price"><i class="fa-solid fa-won-sign"></i>210,000</p>
                            				</div>
										</div>
									<div class="room-grid" id="roomTypeDiv4">
											<div class="res-room-image">
                            			   		<img src="${cPath}/resources/PMS/image/호텔객실2.jpg" alt="executive" />
                        		   			</div>
                          			 		<div class="res-room-description">
                              				 	<p class="room-title">executive</p>
                              				 	<p class="room-des"> 프리미엄 편의 시설과 추가 공간을 제공합니다.</p>
                               					 <p class="room-price"><i class="fa-solid fa-won-sign"></i>250,000</p>
                            				</div>
										</div>
									<div class="room-grid" id="roomTypeDiv5">
											<div class="res-room-image">
                            			   		<img src="${cPath}/resources/PMS/image/호텔객실스위트3.jpg" alt="Sweet" />
                        		   			</div>
                          			 		<div class="res-room-description">
                              				 	<p class="room-title">Sweet</p>
                              				 	<p class="room-des">넓고 우아하게 꾸며진 스위트룸으로, 별도의 생활 공간이 있어 가족 단위 또는 장기 숙박에 적합합니다.</p>
                               					 <p class="room-price"><i class="fa-solid fa-won-sign"></i>500,000</p>
                            				</div>
										</div>
									</div>
                                <div class="payment-btn-box">
                                    <a href="#" class="payment-btn">결제</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab-res-2" class="container tab-pane fade"><br>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="text-container">
                                <h3 class="tab-content-title">RESERVATION GUIDE</h3>

                                <div class="item">
                                    <div>이용안내</div>
                                    <div class="resertxt">
                                        <ul class="li-marker">
                                            <li><b class="redtxt">입실시간 오후 15시~22시입니다.(22시 이후에 도착할 시에는 사전에 연락 주시기
                                                    바랍니다.)</b></li>
                                            <li><b class="redtxt">퇴실시간 오전 11시까지입니다.</b></li>
                                            <li>객실 정리 시간이 오전 11시부터 오후 3시까지이며, 오후 3시 이전 입실은 어렵습니다.</li>
                                            <li>예약하신 인원 외 손님초대나 방문 시에도 추가요금이 적용됩니다.</li>
                                            <li>최대인원 초과 시 입실 및 환불이 불가합니다.</li>
                                            <li>미성년자는 보호자 동반 없이 이용하실 수 없습니다.</li>
                                            <li>개인의 부주의로 인한 분실 및 사고가 일어나지 않도록 주의해 주시기 바랍니다.</li>
                                            <li>상업적인 용도로 펜션내 촬영을 삼가해 주시기 바라며, 필요시 펜션에 사전 문의 부탁드립니다.</li>
                                            <li>안전한 휴식을 위해 객실내 불꽃, 촛불, 그릴, 숯 등의 반입을 금지합니다.</li>
                                            <li>반려동물은 입실이 불가합니다..</li>
                                            <li>시설물 및 비품의 외부유출을 금하며, 파손이나 분실시에는 변상하셔야 됨을 알려드립니다.</li>
                                            <li>실내에서 육류 또는 생선류 등의 조리를 금지하며, 지정된 장소를 이용해주시기 바랍니다.</li>
                                            <li>객실내 시설 및 집기가 훼손 또는 분실되지 않도록 이용에 주의해 주시기 바랍니다.</li>
                                            <li>객실 내에서는 절대 금연이며, 야외 흡연구역을 이용해주시기 바랍니다.</li>
                                            <li>시설물 이용시, 유아를 포함한 개인 안전관리에 유념해주시고 본인 부주의에 의한 안전사고는 본인에게 책임이 있음을 알려드립니다.
                                            </li>
                                            <li>퇴실 시 음식물을 비롯한 모든 쓰레기는 지정된 장소에 분리수거 해주시고, 사용하신 주방기구는 세척해주시기 바랍니다.</li>
                                            <br>

                                            <li class="marker-none">
                                                <ul class="li-marker">
                                                    <div><b class="bluetxt">[추가인원 안내]</b></div>
                                                    <li>성인(14세 이상) : 30,000원</li>
                                                    <li>아동(4세~13세) : 20,000원</li>
                                                    <li>유아(4세 미만) : 10,000원</li>
                                                    <li>24개월 미만은 무료</li>
                                                </ul>
                                            </li>

                                            <li class="marker-none">
                                                <ul class="li-marker">
                                                    <div><b class="bluetxt">[수영장 이용안내]</b></div>
                                                    <li>독채풀빌라에 한하여 개별 수영장 이용 가능</li>
                                                    <li>입실시부터 21:00 까지 이용 가능</li>
                                                    <li>1박당 50,000원(이용필수)</li>
                                                    <li>현장결제</li>
                                                </ul>
                                            </li>

                                            <li class="marker-none">
                                                <ul class="li-marker">
                                                    <div><b class="bluetxt">[개별바베큐 이용안내]</b></div>
                                                    <li>전기그릴 2인 기준 30,000원(1인 추가시마다 5,000원)</li>
                                                </ul>
                                            </li>

                                            <li class="marker-none">
                                                <ul class="li-marker">
                                                    <div><b class="bluetxt">[주차장 이용안내]</b></div>
                                                    <li>독채풀빌라 : 독채 바로 옆 주차 1대 가능 그 외 추가 차량은 관리동 앞 공용주차장 사용</li>
                                                    <li>원룸형 : 관리동 앞 공용주차장 사용</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="item">
                                    <div><b class="bluetxt">[환불규정]</b></div>
                                    <div class="resertxt">
                                        <ul>
                                            <!-- <li>올바른 예약 문화를 위한 불가피한 조치입니다. 아래의 환불규정을 꼭 숙지하신 후 예약해 주시기 바랍니다.</li>
                                            <li>보호자 동반 없는 미성년자 예약 발견 시 환불 없이 예약 취소됩니다.</li>
                                            <li>예약의 특성상 모든 예약금 입금 후 취소시에는 날짜와 무관하게 10%의 위약금이 있습니다.</li>
                                            <li>환불은 입금자와 동일인에게만 가능합니다.</li>
                                            <li>예약일 변경 시 발생하는 수수료도 취소 수수료가 동일하게 적용되오니 예약 시 신중하게 생각하시고 결정해 주시기 바랍니다.</li> -->
                                            <li class="redtxt">아래의 환불수수료 정책을 꼭 확인해 주시기 바랍니다.
                                                <table cellspacing="0" class="reser_tableNS">
                                                    <tbody>
                                                        <tr>
                                                            <td>이용일
                                                                기준</td>
                                                            <td>기본취소</td>
                                                            <td>9일 전</td>
                                                            <td>8일 전</td>
                                                            <td>7일 전</td>
                                                            <td>6일 전</td>
                                                            <td>5일 전</td>
                                                            <td>4일 전</td>
                                                            <td>3일 전</td>
                                                            <td>2일 전</td>
                                                            <td>1일 전</td>
                                                            <td>이용당일</td>
                                                        </tr>
                                                        <tr>
                                                            <td>환불 금액</td>
                                                            <td>90%</td>
                                                            <td>90%</td>
                                                            <td>80%</td>
                                                            <td>70%</td>
                                                            <td>60%</td>
                                                            <td>50%</td>
                                                            <td>40%</td>
                                                            <td>30%</td>
                                                            <td>20%</td>
                                                            <td>10%</td>
                                                            <td>0%</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function decrease() {
	  const humanNo = document.getElementById('humanNo');
	  let value = parseInt(humanNo.value);
	  if (value > 0) {
	    value--;
	    humanNo.value = value;
	  }
	}

	function increase() {
	  const humanNo = document.getElementById('humanNo');
	  let value = parseInt(humanNo.value);
	  if (value < 3) {
	  value++;
	  humanNo.value = value;
	  }
	}

const roomsContainer = document.getElementById('roomsContainer');
let selectedRoomId = null;
let humanValue = null;
let startDay = null;
let lastDay = null;

// 객실 클릭 이벤트 처리 함수
function handleRoomClick(event) {
    const clickedRoom = event.target.closest('.room-grid');
    selectedRoomId = clickedRoom.id;
    console.log('선택된 객실 ID:', selectedRoomId);
    
	const human = document.getElementById('humanNo');
	humanValue = human.value;
    console.log('humanValue:', humanValue);

}

const roomGrids = document.querySelectorAll('.room-grid');
roomGrids.forEach(roomGrid => {
	    roomGrid.addEventListener('click', () => {
	        roomGrid.style.backgroundColor = '#ddd';
	        roomGrids.forEach(otherRoomGrid => {
	            if (otherRoomGrid !== roomGrid) {
	                otherRoomGrid.style.backgroundColor = '';
	            }
	        });
	    });
    roomGrid.addEventListener('click', handleRoomClick);
});


document.addEventListener("DOMContentLoaded", function() {
    const inpGroup = document.querySelector(".res-flex").children[0].children[0];
    const dateArray = []; // 날짜를 저장할 배열
    const dateBtn = document.getElementById('dateBtn'); // 버튼의 ID를 가져옵니다
    
    function formatDateToLocal(date) {
    	  const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
    	    const formattedDate = new Intl.DateTimeFormat('ko-KR', options).format(date);

    	    const dateParts = formattedDate.split('.').map(part => part.trim()).filter(Boolean); // 빈 문자열 제거
    	    
    	    return dateParts.join('-'); // "YYYY-MM-DD" 형식으로 반환
    }

    inpGroup.addEventListener('calendarDateChange.coreui.calendar', function(event) {
        const selectedDate = event.date;
		console.log(selectedDate);
        // 로컬 시간 기준으로 날짜를 변환
        const formattedDate = formatDateToLocal(selectedDate);
        
        dateArray.push(formattedDate);

        console.log("Selected Date: ", formattedDate);
        console.log("Date Array: ", dateArray);
    });

    document.getElementById('dateBtn').addEventListener('click', function(event) {
        event.preventDefault();  // 기본 동작 막기
        const human = document.getElementById('humanNo');
    	humanValue = human.value;
    	console.log(humanValue);
        if (dateArray.length < 2) {
        	 alert("날짜를 선택해 주세요");
            return;
        }
        if (humanValue <= 0) {
       	 alert("인원을 선택해 주세요");
           return;
       }
        lastDay = dateArray[dateArray.length - 1];
        startDay = dateArray[dateArray.length - 2];

        $.ajax({
            url: `${cPath}/totalRev/totalRevDate`,
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                lastDay: lastDay,
                startDay: startDay
            }),
            success: function(response) {
                console.log("Data successfully received from the server");
                console.log("Response:", response);

                // room-grid 클래스를 가진 모든 요소 선택
                const roomGrids = document.querySelectorAll('.room-grid');
                
                // 모든 방을 보이도록 설정
                roomGrids.forEach(roomDiv => {
                    roomDiv.style.display = 'block'; // 모든 방을 보이게 함
                });
            },
            error: function(error) {
                console.error("Error sending data to the server:", error);
            }
        });
    });
 // 결제 버튼 클릭 이벤트 처리 함수
    const paymentBtn = document.querySelector('.payment-btn');

    paymentBtn.addEventListener('click', (event) => {
    	event.preventDefault();
        if (!selectedRoomId) {
            alert("객실정보가 누락되었습니다.");
            return;
        }
        if (!humanValue) {
            alert("인원정보가 누락되었습니다.");
            return;
        }
        if (!startDay) {
            alert("날짜정보가 누락되었습니다.");
            return;
        }
        // form 태그 생성 및 설정
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = `${cPath}/totalRev/totalRevPayment`; // 서버 URL

        // hidden input 생성 및 추가
        const roomIdInput = document.createElement('input');
        roomIdInput.type = 'hidden';
        roomIdInput.name = 'roomId';
        roomIdInput.value = selectedRoomId;
        form.appendChild(roomIdInput);

        const humanNoInput = document.createElement('input');
        humanNoInput.type = 'hidden';
        humanNoInput.name = 'humanNo';
        humanNoInput.value = humanValue;
        form.appendChild(humanNoInput);

        const startDayInput = document.createElement('input');
        startDayInput.type = 'hidden';
        startDayInput.name = 'startDay';
        startDayInput.value = startDay;
        form.appendChild(startDayInput);

        const lastDayInput = document.createElement('input');
        lastDayInput.type = 'hidden';
        lastDayInput.name = 'lastDay';
        lastDayInput.value = lastDay;
        form.appendChild(lastDayInput);

        // form 태그를 body에 추가하고 submit
        document.body.appendChild(form);
        form.submit();
    });
});
</script>
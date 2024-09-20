<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
  .paymentDiv {
    padding: 40px; /* 내부 여백 */
    margin: 40px;  /* 외부 여백 */
    border: 1px solid #ccc; /* 경계선 추가하여 여백이 더 눈에 보이도록 */
  }
</style>
 <section>
        <div class="svisual payment">
            PAYMENT<br>
            <b>결제</b>
        </div>

        <div class="container pay-content">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-title">결제</h3>
                    <div class="page-progress">
                        <div class="progress-info">
                            <div class="progress-circle">
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
                            <div class="progress-circle active">
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

                    <div class="room-detail-des">
                        <div>
                            <ul class="room-detail-list">
                                <li>객실타입 :${roomType.roomtypeNm }</li>
                                <c:if test="${roomType.roomtypeNm eq '스탠다드' }">
	                                <li>객실 설명 : 킹 베드 1개, 2인(최대 3인)</li>
                                </c:if>
                                <c:if test="${roomType.roomtypeNm eq '디럭스' }">
	                                <li>객실 설명 : 킹 베드 1개, 2인(최대 3인)</li>
                                </c:if>
                                <c:if test="${roomType.roomtypeNm eq '슈페리어' }">
	                                <li>객실 설명 : 킹 베드 1개, 2인(최대 3인)</li>
                                </c:if>
                                <c:if test="${roomType.roomtypeNm eq '이그제큐티브' }">
	                                <li>객실 설명 : 더블 베드 2개, 2인(최대 3인)</li>
                                </c:if>
                                <c:if test="${roomType.roomtypeNm eq '스위트' }">
	                                <li>객실 설명 : 킹 베드 2개, 2인(최대 3인)</li>
                                </c:if>
                                <li>인원수 :${humanNo }명</li>
                            </ul>
                        </div>
                        <div class="pay-day">
                            <div class="pay-res-period start-date">
                                <p id="start">${startDay }</p>
                                <p>15:00</p>
                            </div>
                            <div class="period">
								<p id="stayDay">${stayDay }박</p>
                            </div>
                            <div class="pay-res-period end-date">
                                <p id="last">${lastDay }</p>
                                <p>11:00</p>
                            </div>
                        </div>
                    </div>
                    <div class="room-all-pay">
<!--                         <p>총금액 :  -->
<%-- 						   <span class="text-red">${roomType.roomtypePrice}</span>원 --%>
<!-- 						</p> -->
                    </div>
                    <div class="total-info">
                        <div class="pay-res-person">
                            <div>
                                <div class="pay-res-info-top">
                                    <p class="pay-res-title">예약자 정보입력</p>
                                </div>
                               <form id="paymentForm" method="post" action="${cPath }/totalRev/totalRevPaymentData">
                                <table class="pay-res-info">
                                    <colgroup>
                                        <col width="20%"/>
                                        <col width="80%" />
                                    </colgroup>
                                    <tr>
                                        <th>예약자명<span class="text-red">*</span></th>
                                        <td><input class="res-pay-input" type="text" name="name" value="${autentication.principal.realUser.memName }"/></td>
                                    </tr>
                                    <tr>
                                        <th>연락처<span class="text-red">*</span></th>
                                        <td><input class="res-pay-input" type="text" name="Phone" value="${autentication.principal.realUser.memTel }"/></td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td><input class="res-pay-input" type="text" name="email" value="${autentication.principal.realUser.memEmail }"/></td>
                                    </tr>
                                    <tr>
                                        <th>차량 번호</th>
                                        <td><input class="res-pay-input" type="text" name="carNo" /></td>
                                    </tr>
                                    <tr>
                                        <th>요청사항</th>
                                        <td><input class="res-pay-input" type="text" name="revCn" /></td>
                                    </tr>
                                    <tr>
									   <th>마일리지</th>
									   <td style="text-align: left;">
									       <input class="res-pay-input" type="number" name="milUse" id="memMilInput" value="0" style="width:30%" />
									       <button type="button" id="applyMileageBtn" style="margin-left: 10px; border: 1px solid #ccc;">적용</button>
									       보유 마일리지: <span id="memMil"></span> <span style="color: red;">P</span>
									   </td>
									</tr>
                                    
                                </table>
                                    	<input class="res-pay-input" type="hidden" name="roomType" value="${roomType.roomtypeId }" />
                                    	<input class="res-pay-input" type="hidden" name="roomTypePrice" id="roomTypePriceInput" value="${roomType.roomtypePrice }" />
                                    	<input class="res-pay-input" type="hidden" name="startDay" value="${startDay }" />
                                    	<input class="res-pay-input" type="hidden" name="lastDay" value="${lastDay }" />
                                    	<input class="res-pay-input" type="hidden" name="stayDay" value="${stayDay }" />
                                    	<input class="res-pay-input" type="hidden" name="humanNo" value="${humanNo }" />
                                    	<input class="res-pay-input" type="hidden" name="memId" value="${autentication.principal.realUser.memId }" />
                                    	<input class="res-pay-input" type="hidden" name="milEarn" id="milEarn" value="0"/>
                               </form>
                            </div>
                            <div>
                                <div class="pay-res-info-top">
                                    <p class="pay-res-title">결제 정보</p>
                                </div>
                                <div class="pay-res-info-content">
                                    <div class="pay-info-select">
                                        <div class="payment-method">
                                        	  <div class="total-meny-box" style="font-size: 30px;">
									                <p>총 금액 : <span class="price" style="color: red;" id="originalPrice">${roomType.roomtypePrice}</span>원</p>
									                <p>마일리지 사용량 : <span class="text-red" id="mileageUsed">0</span> P</p>
									           </div>
                                        </div>
											<div class="total-meny-box" style="font-size: 40px;">
											    <p>총결제 금액 : <span class="price" style="color: red;" id="totalPrice">${roomType.roomtypePrice}</span>원</p>
											</div>                                    </div>
                                    <div class="pay-res-btn-bottom" style="display:none;">
                                        <button class="pay-res-btn cancel">취소</button>
                                        <button class="pay-res-btn confirm" id="paymentBtn">결제</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 <div class="paymentDiv">
    <div style="display: none;">
      <input type="checkbox" id="coupon-box" />
      <label for="coupon-box"> 5,000원 쿠폰 적용 </label>
    </div>
    <!-- 결제 UI -->
    <div id="payment-method"></div>
    <!-- 이용약관 UI -->
    <div id="agreement"></div>
    <!-- 결제하기 버튼 -->
         <button class="pay-res-btn confirm" id="payment-button" style="margin-top: 30px">결제하기</button>
 </div>       
    </section>
<script src="https://js.tosspayments.com/v2/standard"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>       
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//총 결제 금액 및 마일리지 입력 요소 참조
const totalPriceElement = document.getElementById('totalPrice');
const originalPriceElement = document.getElementById('originalPrice');
const mileageInput = document.getElementById('memMilInput');
const applyButton = document.getElementById('applyMileageBtn');
const roomTypePriceInput = document.getElementById('roomTypePriceInput');
const memMilElement = document.getElementById('memMil');
const mileageUsedElement = document.getElementById('mileageUsed');
const milEarnElement = document.getElementById('milEarn');
const discountedAmountElement = document.getElementById('discountedAmount');
const finalPriceElement = document.getElementById('finalPrice');

// 초기 총 결제 금액 및 보유 마일리지 (문자열에서 숫자로 변환)
let originalPrice = parseInt(totalPriceElement.textContent);
let availableMileage = parseInt(memMilElement.textContent); // 보유 마일리지

// 적용 버튼 클릭 시 이벤트 처리
applyButton.addEventListener('click', function() {
    // 입력된 마일리지 값 가져오기
    const mileageValue = mileageInput.value.trim(); // 공백 제거

    // 유효한 숫자인지 확인
    if (mileageValue === "" || isNaN(parseInt(mileageValue)) || parseInt(mileageValue) < 0) {
        alert("유효한 마일리지 값을 입력하세요.");
        return;
    }

    const mileage = parseInt(mileageValue); // 실제 마일리지 값

    // 보유 마일리지보다 적은지 확인
    if (mileage > availableMileage) {
        alert("입력한 마일리지가 보유한 마일리지보다 많습니다.");
    } else {
        // 새로운 결제 금액 계산
        const discountedPrice = originalPrice - mileage;

        // 최소 금액을 0으로 제한
        const finalPrice = Math.max(discountedPrice, 0);

        // 화면에 표시된 총 결제 금액 업데이트
        totalPriceElement.textContent = numberWithCommas(finalPrice) ;

        // 숨겨진 input의 roomTypePrice 값도 업데이트
        roomTypePriceInput.value = finalPrice;

        // 원래 가격, 마일리지 사용량, 차감 금액 및 최종 결제 금액 업데이트
        originalPriceElement.textContent = numberWithCommas(originalPrice);
        mileageUsedElement.textContent = mileage;
        discountedAmountElement.textContent = mileage;
        finalPriceElement.textContent = finalPrice;
        milEarnElement.value = mileageUsedElement * 0.05;
    }
});

main();

async function main() {
  const button = document.getElementById("payment-button");
  const coupon = document.getElementById("coupon-box");
  // ------  결제위젯 초기화 ------
  const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
  const tossPayments = TossPayments(clientKey);
  // 회원 결제
  const customerKey = "ZF0pQssyN7Ey8sZNDHmLN";
  const widgets = tossPayments.widgets({
    customerKey,
  });
  // 비회원 결제
  // const widgets = tossPayments.widgets({ customerKey: TossPayments.ANONYMOUS });

  // ------ 주문의 결제 금액 설정 ------
  await widgets.setAmount({
    currency: "KRW",
    value: 1,
  });

  await Promise.all([
    // ------  결제 UI 렌더링 ------
    widgets.renderPaymentMethods({
      selector: "#payment-method",
      variantKey: "DEFAULT",
    }),
    // ------  이용약관 UI 렌더링 ------
    widgets.renderAgreement({ selector: "#agreement", variantKey: "AGREEMENT" }),
  ]);

  // ------  주문서의 결제 금액이 변경되었을 경우 결제 금액 업데이트 ------
  coupon.addEventListener("change", async function () {
    if (coupon.checked) {
      await widgets.setAmount({
        currency: "KRW",
        value: 1 - 1,
      });

      return;
    }

    await widgets.setAmount({
      currency: "KRW",
      value: 1,
    });
  });

  // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
  button.addEventListener("click", async function () {
    await widgets.requestPayment({
      orderId: "UQp_i_w4FT9EVQvtKdptQ",
      orderName: "H hotel",
      customerEmail: "customer123@gmail.com",
      customerName: "김토스",
      customerMobilePhone: "01012341234",
    });
	  document.getElementById('paymentForm').submit();
  });
}

  document.addEventListener('DOMContentLoaded', function() {
	    const memName = `${autentication.principal.realUser.memName}`;
	    if (memName) {
	        // memId가 존재하면 AJAX 요청을 보냄
	        $.ajax({
	            url: `${cPath}/totalRev/memMil`, // AJAX 요청을 보낼 URL
	            type: 'POST',
	            data: { memName: memName }, // 데이터 전송
	            success: function(response) {
	                console.log("Response:", response);
	                const memMilElement = document.getElementById('memMil');
	            	  if (memMilElement) {
	            	    memMilElement.textContent = response; // 응답 값으로 업데이트
	           		 }
	            },
	            error: function(error) {
	                console.error("Error with AJAX request:", error);
	            }
	        });
	    }
	});
  </script>
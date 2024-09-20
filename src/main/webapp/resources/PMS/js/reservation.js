// 달력에서 표기하는 날짜 객체
var thisMonth = moment();
// 달력에서 표기하는 연
var currentYear = parseInt(thisMonth.format('YYYY'));
// 달력에서 표기하는 월
var currentMonth = parseInt(thisMonth.format('MM'));
// 공휴일 정보
var holi_day = {};
// 체크인 날짜
var checkInDate = "";
// 체크아웃 날짜
var checkOutDate = "";
// 날짜 포맷 정규식 (yyyy-mm-dd)
var regexDate = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
// 스크롤 이벤트 여부
var scrollEvent = '';

$(document).ready(function () {
    // 임시공휴일을 정보 가져오기.
    cmmAjax('/booking/holidayList/', { 'USER_ID': user_id }, function (data) {
        holi_day = $.parseJSON(data);
    }, true);

    var paramBeginDate = getParam('s');
    var paramEndDate = getParam('e');

    // 날짜변수를 파라미터로 넘겨 받았을때
    if (paramBeginDate !== '' && paramEndDate !== '') {
        // 날짜 형태가 (yyyy-mm-dd) 가 아닐경우
        if (!regexDate.test(paramBeginDate) || !regexDate.test(paramBeginDate)) {
            sweetalert2Message('체크인 체크아웃 날짜를 정확히 입력 해주세요.')
            calendarInit(thisMonth);
            return;
        }

        // 스크립트에서 날짜 비교를 위해 getTime() 함수를 통한 시간값 반환
        var paramBeginDateTime = moment(paramBeginDate).valueOf();
        var paramEndDateTime = moment(paramEndDate).valueOf();
        var todayTime = moment(moment().format('YYYY-MM-DD')).valueOf();

        // 체크인 날짜가 현재일 보다 이전일 일때
        if (paramBeginDateTime < todayTime) {
            sweetalert2Message('해당 날짜로 예약 할 수 없습니다.');
            calendarInit(thisMonth);
            return;
        }

        // 체크아웃 날짜가 현재일 보다 이전일 이거나 같을때
        if (paramEndDateTime <= todayTime) {
            sweetalert2Message('해당 날짜로 예약 할 수 없습니다.');
            calendarInit(thisMonth);
            return;
        }

        // 체크아웃 날짜가 체크인 날짜보다 이전일 이거나 같을때
        if (paramBeginDateTime >= paramEndDateTime) {
            sweetalert2Message('해당 날짜로 예약 할 수 없습니다.');
            calendarInit(thisMonth);
            return;
        }

        // 예약 가능 최대 개월수 넘겼는지 체크
        if (getLimitMonthCheck(moment(paramEndDate).format('YYYY'), moment(paramEndDate).format('MM')) < 0) {
            sweetalert2Message('최대예약 기간은 ' + limitMonth + '개월 입니다.');
            calendarInit(thisMonth);
            return;
        }

        thisMonth = moment(paramBeginDate);

        checkInDate = paramBeginDate.replace(/\-/g, '');
        checkOutDate = paramEndDate.replace(/\-/g, '');

        // 달력 만들기
        calendarInit(thisMonth);

        $('#check_in_day').html(getCheckIndateHtml());
        $('#check_out_day').html(getCheckOutdateHtml());

        var param = {};
        param.s = conversion_date(checkInDate, 1);
        param.e = conversion_date(checkOutDate, 1);
        param.SKIN_TYPE = skinType;
        param.USER_ID = user_id;

        scrollEvent = getParam('scroll');

        getDocumentReadyParameter(param);
    } else {
        // 달력 만들기
        calendarInit(thisMonth);
    }
});

// 개월수 비교 위한 변수값 생성
function getLimitMonthCheck(year, month) {
    var lastYear = moment().add(limitMonth, "M").format("YYYY");
    var lastMonth = moment().add(limitMonth, "M").format("MM");
    return moment(lastYear + "-" + lastMonth).valueOf() - moment(parseInt(year) + "-" + parseInt(month).zf(2)).valueOf();
}

// 파라미터값 찾기
function getParam(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    let regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

var go_memory=[];

// 이전달로 이동
$(document).on('click', '.go-prev', function () {
	console.log("이전달");
    
    var startDate = $('.start-year-month').html().split('.');
//    if(go_memory[0] == startDate[0] && go_memory[1] == startDate[1]){
//		console.log("여기란다");
//		return;
//	}
    go_memory=startDate;

    var thisCalendar = moment(moment().format("YYYY") + "-" + moment().format("MM")).valueOf();
    var prevCalendar = moment(startDate[0] + "-" + startDate[1]).valueOf();

    // 달력이 현재 년 월 과 같거나 작을경우 뒤로가기 막기
    if ((thisCalendar - prevCalendar) >= 0) {
		//console.log("여기임");
        return;
    }

    var startYear = parseInt(startDate[0]);
    if ((parseInt(startDate[1]) - 1) <= 0) {
        startYear = startYear - 1
        currentMonth = 13;
    }

    thisMonth = moment(startYear + "-" + (parseInt(currentMonth) - 1).zf(2) + "-01");
	
	//console.log(thisMonth);

    calendarInit(thisMonth);
});

// 다음달로 이동
$(document).on('click', '.go-next', function () {
	console.log("다음달");

    var lastDate = $('.last-year-month').html().split('.');
    if(go_memory[0] == lastDate[0] && go_memory[1] == lastDate[1]) return;
    go_memory=lastDate;

    // 예약 가능 최대 개월수와 같거나 크다면 다음달 이동 막기
    if (getLimitMonthCheck(lastDate[0], lastDate[1]) <= 0) {
        alert('최대예약 기간은 ' + limitMonth + '개월 입니다.');
        return;
    }

    var limitYear = parseInt(lastDate[0]);
    if ((parseInt(lastDate[1]) + 1 )> 13) {
        limitYear = limitYear + 1
        currentMonth = 0;
    }

	let pcm = (parseInt(currentMonth) + 1).zf(2);


	if( pcm > 12 ) {
		pcm = '01';
	}

    thisMonth = moment(limitYear + "-" + pcm + "-01");
	//console.log(thisMonth);

    calendarInit(thisMonth);
});

// 날짜선택 버튼
$(document).on('click', '.reservation-date-btn', function () {
    if($('.reserve-bar').find('div').hasClass('check-in-out-select-text')) {
        $('.check-in-out-select-text').remove();
    }

    $('.calendar-wrap').css('display', 'flex');
});

// 달력 닫기 버튼
$(document).on('click', '#calendar_hide_btn', function () {
    $('.calendar-wrap').css('display', 'none');
});

// 예약 확인
$(document).on("click", "#myorder", function (e) {
    e.preventDefault();
    location.href = "/reserve/myorder/" + user_id;
});

// info 정보 상세 보기
$(document).on("click", ".list .ex", function (e) {    
        
   let ex = e.screenX;
   let ey = e.screenY;     
   let alertAgent = navigator.userAgent.toUpperCase();
   
   if (alertAgent.indexOf('SAFARI') >= 0 && alertAgent.indexOf('CHROME') <= 0 ) {
    sweetalert2Messageios($(this).parents(".list").find(".info").html(), ex, ey);    
   } else {
    sweetalert2Message($(this).parents(".list").find(".info").html());    
   }   
   
    return false;
});

// info 정보 상세 보기 닫기
$(document).on("click", ".info .close", function () {
    $(".info").css({ "height": "0", "opacity": "0" });
    return false;
});

// 체크인 / 아웃을 선택 안하고 객실 선택시 선택하라는 text추가 및 포커스 이벤트
function selectCheckInOutTextEvent() {
    if($('.reserve-bar').find('div').hasClass('check-in-out-select-text')) {
        $('.check-in-out-select-text').remove();
        clearTimeout(timer);
    }

    var html = "";

    html += "<div class='check-in-out-select-text'>"
    html += "<span>*체크인/아웃 날짜를 먼저 선택하세요.</span>"
    html += "</div>"

    $('.reserve-bar').append(html);
    $('.reserve-bar').find('.reserveBar-wrap').get(0).scrollIntoView({ behavior: 'smooth', block: 'start' });

    // 시간 지연후 텍스트 삭제
    timer = setTimeout(() => {
        $('.check-in-out-select-text').remove();
    }, 3000);
}

// 몇요일인지 알려주는 함수 (숫자 형태)
function weekday(YYYYMMDD) {
    return moment(YYYYMMDD).day();
}

// 요일 리턴
function strWeekDay(weekday) {
    switch (weekday) {
        case 0: return "일"
            break;
        case 1: return "월"
            break;
        case 2: return "화"
            break;
        case 3: return "수"
            break;
        case 4: return "목"
            break;
        case 5: return "금"
            break;
        case 6: return "토"
            break;
    }
}

// 날짜형태 변환
function conversion_date(YYMMDD, choice) {
    var yyyy = YYMMDD.substring(0, 4);
    var mm = YYMMDD.substring(4, 6);
    var dd = YYMMDD.substring(6, 8);

    if (choice === 1)
        var new_YYMMDD = yyyy + "-" + mm.zf(2) + "-" + dd.zf(2);
    else if (choice === 2)
        var new_YYMMDD = yyyy + "." + mm.zf(2) + "." + dd.zf(2);

    return new_YYMMDD;
}

// 콤마
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 요금 합계
function total_price() {
    var ori_room_price = parseInt($("#ori_room_price").val());
    var room_price = parseInt($("#room_price").val());
    var pers_price = parseInt($("#pers_price").val());
    var optn_price = parseInt($("#optn_price").val());

    if ($("#vat_opt").val() === 'Y') {
        var Room_VAT = VATCalculation(ori_room_price);
        var Pers_VAT = VATCalculation(pers_price);
        var Opt_VAT = VATCalculation(optn_price);
        var Pers_VAT_Exclusion = WithoutVATPrice(pers_price, Pers_VAT);
        var Opt_VAT_Exclusion = WithoutVATPrice(optn_price, Opt_VAT);

        $("#total_pers_price").text("￦" + comma((Pers_VAT_Exclusion)));
        $("#total_optn_price").text("￦" + comma((Opt_VAT_Exclusion)));
        $("#tax").text("￦" + comma((Room_VAT + Pers_VAT + Opt_VAT)));
    }

    $("#total_price").text("￦" + comma(pers_price + optn_price + room_price));
}

//요일에 대한 가격
function weekdayPrice(week, week_prce, fri_prce, sat_prce, sun_prce) {
    //일요일
    switch (week) {
        case 0:
            //  일요일
            return sun_prce;
            break;
        case 6:
            // 토요일
            return sat_prce;
            break;
        case 5:
            // 금요일
            return fri_prce;
            break;
        default:
            // 평일
            return week_prce;
            break;
    }
}

// 달력 그리기
function calendarInit(thisMonth) { 



    // 렌더링을 위한 데이터 정리
    currentYear = thisMonth.format('YYYY');
    currentMonth = thisMonth.format('MM');

    // 렌더링 html 요소 생성
    var start_calendar = '';
    var last_calendar = '';

    makeStartCalendar();

    // start_calendar
    function makeStartCalendar() {
        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = moment(new Date(currentYear, currentMonth - 1, 0));   
        var prevDate = parseInt(startDay.format('DD'));
        var prevDay = startDay.day();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = moment(new Date(currentYear, currentMonth, 0));        
        var nextDate = parseInt(endDay.format('DD'));
        var nextDay = endDay.day()

        var param = {};
        param.STARTDAY = (currentYear + "-" + parseInt(currentMonth).zf(2) + "-" + '01');
        param.LASTDAY = (currentYear + "-" + parseInt(currentMonth).zf(2) + "-" + nextDate);

        cmmAjax('/booking/soldOutDay/' + user_id, param, function (data) {
            data = JSON.parse(data);
            // 지난달
            for (var i = prevDate - prevDay; i <= prevDate; i++) {
                start_calendar += pervDisableDay(i);
            }

            // 이번달
            for (var i = 1; i <= nextDate; i++) {
                // 이번달이 현재 년도와 월이 같을경우
                if (currentYear === moment().format('YYYY') && currentMonth === moment().format('MM')) {
					console.log("진입1="+i);
                    // 지난 날짜는 disable 처리
                    if (i < parseInt(moment().format('DD'))) {
                        start_calendar += pervDisableDay(i)
                    } else {
                        var slodoutCheckDay = currentYear + "" + parseInt(currentMonth).zf(2) + "" + i.zf(2);

                        if (data[slodoutCheckDay] === 'N') {
                            start_calendar += dailySolodOutDay(currentYear, currentMonth, i);
                        } else {
                            start_calendar += dailyDay(currentYear, currentMonth, i);
                        }
                    }
                } else {
					console.log("진입2="+i);
                    var slodoutCheckDay = currentYear + "" + (currentMonth + 1).zf(2) + "" + i.zf(2);

                    if (data[slodoutCheckDay] === 'N') {
                        start_calendar += dailySolodOutDay(currentYear, currentMonth, i);
                    } else {
                        start_calendar += dailyDay(currentYear, currentMonth, i);
                    }
                }
            }

            // 다음달 7 일 표시
            for (var i = 1; i <= (6 - nextDay); i++) {
                start_calendar += nextDisableDay(i);
            }

            $('.start-calendar').html(start_calendar);

			//console.log(currentYear + currentMonth);
            $('.start-year-month').text(currentYear + '.' + parseInt(currentMonth).zf(2));


            makeLastCalendar();
        });
    }

    // last_calendar
    function makeLastCalendar() {
        var tempCurrentYear = parseInt(currentYear);
        var tempCurrentMonth = parseInt(currentMonth) + 1;

        if (tempCurrentMonth > 12) {
            tempCurrentYear = parseInt(tempCurrentYear) + 1;
            tempCurrentMonth = 1;
        }
        
        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = moment(new Date(currentYear, currentMonth, 0));
        
        var prevDate = parseInt(startDay.format('DD'));
        var prevDay = startDay.day();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = moment(new Date(tempCurrentYear, tempCurrentMonth, 0));
        
        var nextDate = parseInt(endDay.format('DD'));
        var nextDay = endDay.day();

        var param = {};
        param.STARTDAY = (tempCurrentYear + "-" + parseInt(tempCurrentMonth).zf(2) + "-" + '01');
        param.LASTDAY = (tempCurrentYear + "-" + parseInt(tempCurrentMonth).zf(2) + "-" + nextDate);

        cmmAjax('/booking/soldOutDay/' + user_id, param, function (data) {
            data = JSON.parse(data);
            // 지난달
            for (var i = prevDate - prevDay; i <= prevDate; i++) {
                last_calendar += pervDisableDay(i);
            }

            // 이번달
            for (var i = 1; i <= nextDate; i++) {
                // 이번달이 현재 년도와 월이 같을경우
                if (tempCurrentYear === moment().format('YYYY') && tempCurrentMonth === moment().format('MM')) {
                    // 지난 날짜는 disable 처리
                    if (i < parseInt(moment().format('DD'))) {
                        last_calendar += pervDisableDay(i)
                    } else {
                        var slodoutCheckDay = tempCurrentYear + "" + (tempCurrentMonth + 1).zf(2) + "" + i.zf(2);

                        if (data[slodoutCheckDay] === 'N') {
                            last_calendar += dailySolodOutDay(tempCurrentYear, tempCurrentMonth, i);
                        } else {
                            last_calendar += dailyDay(tempCurrentYear, tempCurrentMonth, i);
                        }
                    }
                } else {
                    var slodoutCheckDay = tempCurrentYear + "" + (tempCurrentMonth).zf(2) + "" + i.zf(2);

                    if (data[slodoutCheckDay] === 'N') {
                        last_calendar += dailySolodOutDay(tempCurrentYear, tempCurrentMonth, i);
                    } else {
                        last_calendar += dailyDay(tempCurrentYear, tempCurrentMonth, i);
                    }
                }
            }

            // 다음달 7 일 표시
            for (var i = 1; i <= (6 - nextDay); i++) {
                last_calendar += nextDisableDay(i);
            }

            $('.last-calendar').html(last_calendar);
            $('.last-year-month').text(tempCurrentYear + '.' + parseInt(tempCurrentMonth).zf(2));

            addClassSelectDay();
        });

    }

    // 지난달 미리 보기
    function pervDisableDay(day) {
        return '<div class="day prev disable">' + day + '</div>';
    }

    // 이번달
    function dailyDay(currentYear, currentMonth, day) {
        var date = currentYear + '' + currentMonth.zf(2) + '' + day.zf(2);
        var index = holi_day.findIndex((name, index) => {
            return name.BASE_HOLI_DATE === date;
        });

        if (index !== -1) {
            if (checkInDate !== '' || checkOutDate !== '') {
                if (checkInDate === date) {
                    return '<div class="day current checkIn" style="color: #ed2a61;" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p class="holi_day_p">' + holi_day[index].BASE_HOLI_NM + '</p></div>';
                } else if (checkOutDate === date) {
                    return '<div class="day current checkOut" style="color: #ed2a61;" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p class="holi_day_p">' + holi_day[index].BASE_HOLI_NM + '</p></div>';
                } else {
                    return '<div class="day current" style="color: #ed2a61;" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p class="holi_day_p">' + holi_day[index].BASE_HOLI_NM + '</p></div>';
                }
            } else {
                return '<div class="day current" style="color: #ed2a61;" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p class="holi_day_p">' + holi_day[index].BASE_HOLI_NM + '</p></div>';
            }
        } else {
            if (checkInDate === date) {
                return '<div class="day current checkIn" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
            } else if (checkOutDate === date) {
                return '<div class="day current checkOut" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
            } else {
                return '<div class="day current" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
            }

        }
    }

    // soldout
    function dailySolodOutDay(currentYear, currentMonth, day) {
        var date = currentYear + '' + (parseInt(currentMonth)).zf(2) + '' + parseInt(day).zf(2);

        if (checkOutDate === date) {
            return '<div class="day disable soldout checkOut" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p" style="color:red;font-size:10px">예약마감</p><p>' + '</div>';
        } else {
            return '<div class="day disable soldout" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p" style="color:red;font-size:10px">예약마감</p><p>' + '</div>';
        }
    }

    // 다음달 미리 보기
    function nextDisableDay(day) {
        return '<div class="day next disable">' + day + '</div>';
    }
}

// 체크인 날짜 표기
function getCheckIndateHtml() {
    checkInDate = checkInDate.toString();
    return checkInDate.substring('0', '4') + "-" + checkInDate.substring('4', '6') + "-" + checkInDate.substring('6', '8') + " ( " + strWeekDay(weekday(checkInDate)) + " )";
}

// 체크아웃 날짜 표기
function getCheckOutdateHtml() {
    checkOutDate = checkOutDate.toString();
    return checkOutDate.substring('0', '4') + "-" + checkOutDate.substring('4', '6') + "-" + checkOutDate.substring('6', '8') + " ( " + strWeekDay(weekday(checkOutDate)) + " )";
}

// 체크인 체크아웃 기간 안에 날짜 선택 처리
function addClassSelectDay() {
    if (checkInDate !== "" && checkOutDate != "") {
        if ($('.checkIn').find('p').hasClass('holi_day_p')) {
            $('.checkIn').find('.holi_day_p').hide();
        }

        if ($('.checkOut').find('p').hasClass('holi_day_p')) {
            $('.checkOut').find('.holi_day_p').hide();
        }

        $('.checkIn').find('.check_in_out_p').html('체크인');
        $('.checkOut').find('.check_in_out_p').html('체크아웃');

        $('.day').each(function () {
            var data_day = $(this).data('day');
            if (data_day !== undefined && data_day >= checkInDate && data_day <= checkOutDate) {
                $(this).addClass('selectDay');
            }
        });
    }
}

// 타입 또는 객실 선택시 예약 가능일인지 체크
function getCheckDate() {
    var result = true;
    var endDate = moment(checkOutDate).subtract(1, 'days');

    // 예약 가능 최대 개월수 넘겼는지 체크
    if (getLimitMonthCheck(endDate.format('YYYYY'), endDate.format('MM')) < 0) {
        alert('최대예약 기간은 ' + limitMonth + '개월 입니다.');
        result = false;
    }

    return result
}

// 인원 추가
function add_pers(pers_name) {
    var adlt_excs_prce = parseInt($('#adlt_excs_prce').val());
    var kids_excs_prce = parseInt($('#kids_excs_prce').val());
    var inft_excs_prce = parseInt($('#inft_excs_prce').val());
    var adlt_pers_num = parseInt($("#adlt_pers_num").val());
    var kids_pers_num = parseInt($("#kids_pers_num").val());
    var inft_pers_num = parseInt($("#inft_pers_num").val());
    var total_pers_num = adlt_pers_num + kids_pers_num + inft_pers_num;
    var adlt_base_pers_param = parseInt($("#adlt_base_pers").val());
    var adlt_max_pers = parseInt($("#adlt_max_pers").val());
    var kids_max_pers = parseInt($("#kids_max_pers").val());
    var inft_max_pers = parseInt($("#inft_max_pers").val());
    var inft_incl_yn = $('#inft_incl_yn').val();

    if(total_pers_num >= adlt_max_pers){
        alert("더이상 인원을 추가할 수 없습니다");
        return;
    }

    if(pers_name == "kids_pers_num"){
        if(parseInt($("#"+pers_name).val()) >= kids_max_pers){
            alert("더이상 인원을 추가할 수 없습니다");
            return;
        }
    }

    if(pers_name == "inft_pers_num"){
        if(inft_incl_yn != "Y"){
            total_pers_num -= inft_pers_num;
        }

        if(parseInt($("#"+pers_name).val()) >= inft_max_pers){
            alert("더이상 인원을 추가할 수 없습니다");
            return;
        }
    }

    var pers_num = parseInt($("#" + pers_name).val()) + 1;
    $("#" + pers_name).val(pers_num);
    if (pers_name == "adlt_pers_num") {
        $("#adt_num").text(pers_num);
    } else if (pers_name == "kids_pers_num") {
        $("#kids_num").text(pers_num);
    } else if (pers_name == "inft_pers_num") {
        $("#inft_num").text(pers_num);
    }

    //데이터 갱신
    adlt_pers_num = parseInt($("#adlt_pers_num").val());
    kids_pers_num = parseInt($("#kids_pers_num").val());
    inft_pers_num = parseInt($("#inft_pers_num").val());

    //성인 기준인원 책정
    if ((adlt_pers_num - adlt_base_pers_param) > 0) {
        adlt_pers_num -= adlt_base_pers_param;
        adlt_base_pers_param = 0;
    } else {
        adlt_base_pers_param -= adlt_pers_num;
        adlt_pers_num = 0;
    }

    //아동/유아 기준인원 책정
    if ((kids_pers_num - adlt_base_pers_param) > 0) {
        kids_pers_num -= adlt_base_pers_param;
        adlt_base_pers_param = 0;
    } else {
        adlt_base_pers_param -= kids_pers_num;
        kids_pers_num = 0;
    }

    //영유아 기준인원 책정
    if ((inft_pers_num - adlt_base_pers_param) > 0) {
        inft_pers_num -= adlt_base_pers_param;
        adlt_base_pers_param = 0;
    } else {
        adlt_base_pers_param -= inft_pers_num;
        inft_pers_num = 0;
    }

    var selectedDays = $('.selectDay').length;
    var minSelectedDays = Math.max(selectedDays - 1, 1);

    var adlt_prce = (adlt_pers_num * adlt_excs_prce) * minSelectedDays;
    var kids_prce = (kids_pers_num * kids_excs_prce) * minSelectedDays;
    var inft_prce = (inft_pers_num * inft_excs_prce) * minSelectedDays;

  /*  var adlt_prce = (adlt_pers_num * adlt_excs_prce) * ($('.selectDay').length - 1);
    var kids_prce = (kids_pers_num * kids_excs_prce) * ($('.selectDay').length - 1);
    var inft_prce = (inft_pers_num * inft_excs_prce) * ($('.selectDay').length - 1);*/

    $("#adlt_pers_price").val(adlt_prce);
    $("#kids_pers_price").val(kids_prce);
    $("#inft_pers_price").val(inft_prce);
    $("#pers_price").val((adlt_prce + kids_prce + inft_prce));
    $("#total_pers_price").text("￦" + comma((adlt_prce + kids_prce + inft_prce)));

    total_price();
}

// 인원 감소
function remove_pers(pers_name) {
    var adlt_excs_prce = parseInt($('#adlt_excs_prce').val());
    var kids_excs_prce = parseInt($('#kids_excs_prce').val());
    var inft_excs_prce = parseInt($('#inft_excs_prce').val());
    var adlt_prce = parseInt($("#adlt_pers_num").val()) * adlt_excs_prce;
    var kids_prce = parseInt($("#kids_pers_num").val()) * kids_excs_prce;
    var inft_prce = parseInt($("#inft_pers_num").val()) * inft_excs_prce;
    var adlt_base_pers_param = parseInt($("#adlt_base_pers").val());

    if (pers_name == "adlt_pers_num") {
        if (parseInt($("#" + pers_name).val()) <= 1) {
            return;
        }
    }else {
        if (parseInt($("#" + pers_name).val()) <= 0) {
            return;
        }
    }

    var pers_num = (parseInt($("#" + pers_name).val()) - 1);
    $("#" + pers_name).val(pers_num);
    if (pers_name == "adlt_pers_num") {
        $("#adt_num").text(pers_num);
    } else if (pers_name == "kids_pers_num") {
        $("#kids_num").text(pers_num);
    } else if (pers_name == "inft_pers_num") {
        $("#inft_num").text(pers_num);
    }

    //데이터 갱신
    adlt_pers_num = parseInt($("#adlt_pers_num").val());
    kids_pers_num = parseInt($("#kids_pers_num").val());
    inft_pers_num = parseInt($("#inft_pers_num").val());
    //성인 기준인원 책정
    if ((adlt_pers_num - adlt_base_pers_param) > 0) {
        adlt_pers_num -= adlt_base_pers_param;
        adlt_base_pers_param = 0;
    } else {
        adlt_base_pers_param -= adlt_pers_num;
        adlt_pers_num = 0;
    }

    //아동/유아 기준인원 책정
    if ((kids_pers_num - adlt_base_pers_param) > 0) {
        kids_pers_num -= adlt_base_pers_param;
        adlt_base_pers_param = 0;
    } else {
        adlt_base_pers_param -= kids_pers_num;
        kids_pers_num = 0;
    }

    //영유아 기준인원 책정
    if ((inft_pers_num - adlt_base_pers_param) > 0) {
        inft_pers_num -= adlt_base_pers_param;
        adlt_base_pers_param = 0;
    } else {
        adlt_base_pers_param -= inft_pers_num;
        inft_pers_num = 0;
    }

    var adlt_prce = (adlt_pers_num * adlt_excs_prce) * ($('.selectDay').length - 1);
    var kids_prce = (kids_pers_num * kids_excs_prce) * ($('.selectDay').length - 1);
    var inft_prce = (inft_pers_num * inft_excs_prce) * ($('.selectDay').length - 1);

    $("#adlt_pers_price").val(adlt_prce);
    $("#kids_pers_price").val(kids_prce);
    $("#inft_pers_price").val(inft_prce);
    $("#pers_price").val((adlt_prce + kids_prce + inft_prce));
    $("#total_pers_price").text("￦" + comma((adlt_prce + kids_prce + inft_prce)));

    total_price();
}

// 옵션 추가
function add_optn(optn_code) {
    //현재 옵션 개수
    var optn_qty = parseInt($("#optn_qty_" + optn_code).val());
    //옵션 최소 개수
    var optn_min_qty = parseInt($("#optn_min_qty_" + optn_code).val());
    //옵션 최대 개수
    var optn_max_qty = parseInt($("#optn_max_qty_" + optn_code).val());
    //총 옵션금액
    var total_optn_price = 0;
    var now_in_week = weekday(checkInDate);

    if (optn_qty >= optn_max_qty) {
        sweetalert2Message("더이상 옵션을 추가할수 없습니다");
        return;
    }

    // 증가시 최소 개수 값으로 바로 증가
    if ((optn_min_qty > 1) && (optn_qty < optn_min_qty)) {
        $("#optn_qty_" + optn_code).val(optn_min_qty);
    } else {
        $("#optn_qty_" + optn_code).val(optn_qty + 1);
    }

    optn_qty = parseInt($("#optn_qty_" + optn_code).val());

    var optn_code_len = $("input[name='optn_code[]']").length;

    for (fn_i = 0; fn_i < optn_code_len; fn_i++) {
        var fn_optn_code = $("input[name='optn_code[]']").eq(fn_i).val();
        //옵션개수
        var fn_optn_len = parseInt($("#optn_qty_" + fn_optn_code).val());
        //요일별 요금사용여부
        var fn_optn_use_daily_price_yn = $("#optn_use_daily_price_yn_" + fn_optn_code).val();
        //평일금액
        var fn_optn_week_prce = parseInt($("#optn_week_prce_" + fn_optn_code).val());
        //금요일금액
        var fn_optn_frd_prce = parseInt($("#optn_frd_prce_" + fn_optn_code).val());
        //토요일금액
        var fn_optn_sat_prce = parseInt($("#optn_sat_prce_" + fn_optn_code).val());
        //일요일금액
        var fn_optn_sun_prce = parseInt($("#optn_sun_prce_" + fn_optn_code).val());

        if (fn_optn_use_daily_price_yn == "Y") {
            for (fn_j = 0; fn_j < fn_optn_len; fn_j++) {
                var fn_week = (now_in_week + fn_j) % 7;
                total_optn_price += weekdayPrice(fn_week, fn_optn_week_prce, fn_optn_frd_prce, fn_optn_sat_prce, fn_optn_sun_prce);
            }
        } else {
            total_optn_price += (weekdayPrice(now_in_week, fn_optn_week_prce, fn_optn_frd_prce, fn_optn_sat_prce, fn_optn_sun_prce) * fn_optn_len);
        }
    }

    $("#optn_name_" + optn_code).text(optn_qty);
    $("#optn_price").val(total_optn_price);
    $("#total_optn_price").text("￦" + comma(total_optn_price));

    total_price();
}

// 옵션 삭제
function remove_optn(optn_code) {
    //현재 옵션 개수
    var optn_qty = parseInt($("#optn_qty_" + optn_code).val());
    //옵션 최소 개수
    var optn_min_qty = parseInt($("#optn_min_qty_" + optn_code).val());
    //총 옵션금액
    var total_optn_price = 0;
    var now_in_week = weekday(checkInDate);

    if (optn_qty <= 0) {
        return;
    }

    // 감소시 최소 값에서 바로 0으로 감소
    if ((optn_min_qty > 1) && (optn_qty == optn_min_qty)) {
        $("#optn_qty_" + optn_code).val(0);
    } else {
        $("#optn_qty_" + optn_code).val(optn_qty - 1);
    }

    optn_qty = parseInt($("#optn_qty_" + optn_code).val());

    var optn_code_len = $("input[name='optn_code[]']").length;
    for (fn_i = 0; fn_i < optn_code_len; fn_i++) {
        var fn_optn_code = $("input[name='optn_code[]']").eq(fn_i).val();
        //옵션개수
        var fn_optn_len = parseInt($("#optn_qty_" + fn_optn_code).val());
        //요일별 요금사용여부
        var fn_optn_use_daily_price_yn = $("#optn_use_daily_price_yn_" + fn_optn_code).val();
        //평일금액
        var fn_optn_week_prce = parseInt($("#optn_week_prce_" + fn_optn_code).val());
        //금요일금액
        var fn_optn_frd_prce = parseInt($("#optn_frd_prce_" + fn_optn_code).val());
        //토요일금액
        var fn_optn_sat_prce = parseInt($("#optn_sat_prce_" + fn_optn_code).val());
        //일요일금액
        var fn_optn_sun_prce = parseInt($("#optn_sun_prce_" + fn_optn_code).val());

        if (fn_optn_use_daily_price_yn == "Y") {
            for (fn_j = 0; fn_j < fn_optn_len; fn_j++) {
                var fn_week = (now_in_week + fn_j) % 7;
                total_optn_price += weekdayPrice(fn_week, fn_optn_week_prce, fn_optn_frd_prce, fn_optn_sat_prce, fn_optn_sun_prce);
            }
        } else {
            total_optn_price += (weekdayPrice(now_in_week, fn_optn_week_prce, fn_optn_frd_prce, fn_optn_sat_prce, fn_optn_sun_prce) * fn_optn_len);
        }
    }

    $("#optn_name_" + optn_code).text(optn_qty);
    $("#optn_price").val(total_optn_price);
    $("#total_optn_price").text("￦" + comma(total_optn_price));

    total_price();
}

function step2() {
    if (1 > (parseInt($("#adlt_pers_num").val()) + parseInt($("#kids_pers_num").val()) + parseInt($("#inft_pers_num").val()))) {
        sweetalert2Message('입실 인원 을 선택 해주세요.');
        return;
    }

    var RESV_INFO = {};
    var RESV_INFO_ROOMS = [];
    var RESV_INFO_DTLS = [];
    var DATE = [];
    var period = parseInt($('#period').val());

    RESV_INFO.TYPE_IDX = $("#type_idx").val();
    RESV_INFO.ROOM_CODE = $("#room_code").val();

    RESV_INFO.ROOM_NAME = $("#room_info_nm").val();

    RESV_INFO.ROOM_PRCE = parseInt($("#room_price").val());
    RESV_INFO.PERS_PRCE = parseInt($("#pers_price").val());
    RESV_INFO.OPTN_PRCE = parseInt($("#optn_price").val());

    RESV_INFO.NUM_PER_DIV_ADT = $("#num_per_div_adt").val();
    RESV_INFO.NUM_PER_DIV_KID = $("#num_per_div_kid").val();
    RESV_INFO.NUM_PER_DIV_INF = $("#num_per_div_inf").val();

    if (skinType === 'ROOM') {
        var day_price = $($(".price a[data-roomcode='" + RESV_INFO.ROOM_CODE + "']")).data('day_price');
    } else {
        var day_price = $($(".price a[data-idx='" + RESV_INFO.TYPE_IDX + "']")).data('day_price');
    }


    $('.selectDay').each(function (k, v) {
        if (k === period) {
            return false;
        }

        var RESV_INFO_ROOM = {};

        RESV_INFO_ROOM.ADIT_ADLT_NUM = $("#adlt_pers_num").val();
        RESV_INFO_ROOM.ADIT_ADLT_PRCE = parseInt($("#adlt_pers_price").val()) / period;
        RESV_INFO_ROOM.ADIT_KIDS_NUM = $("#kids_pers_num").val();
        RESV_INFO_ROOM.ADIT_KIDS_PRCE = parseInt($("#kids_pers_price").val()) / period;
        RESV_INFO_ROOM.ADIT_INFT_NUM = $("#inft_pers_num").val();
        RESV_INFO_ROOM.ADIT_INFT_PRCE = parseInt($("#inft_pers_price").val()) / period;
        RESV_INFO_ROOM.ROOM_PRCE = parseInt(day_price['PRICE'][$(this).data('day')]);
        RESV_INFO_ROOM.CHCK_IN_DATE = $(this).data('day');
        RESV_INFO_ROOM.TYPE_IDX = RESV_INFO.TYPE_IDX;
        RESV_INFO_ROOMS.push(RESV_INFO_ROOM);
        DATE.push(RESV_INFO_ROOM.CHCK_IN_DATE);
    });

	if( day_price['SALE_PRICE'] ){
	    RESV_INFO.CONS_SALE_PRCE = parseInt(day_price['SALE_PRICE']);
	}
    RESV_INFO.TOT_PRCE = RESV_INFO.ROOM_PRCE + RESV_INFO.PERS_PRCE + RESV_INFO.OPTN_PRCE;

    var optn_code_len = $("input[name='optn_code[]']").length;

    for (i = 0; i < optn_code_len; i++) {
        var RESV_INFO_DTL = {};
        // 옵션 코드
        var optn_code = $("input[name='optn_code[]']").eq(i).val();
        // 옵션 사용수
        var optn_qty = $("#optn_qty_" + optn_code).val();
        // 옵션명
        var optn_nm = $("#optn_nm_" + optn_code).val();
        // 옵션 UNIT 명
        var optn_unit_nm = $("#optn_unit_nm_" + optn_code).val();
        // 요일별 요금사용여부
        var optn_use_daily_price_yn = $("#optn_use_daily_price_yn_" + optn_code).val();
        // 평일금액
        var optn_week_prce = parseInt($("#optn_week_prce_" + optn_code).val());
        // 금요일금액
        var optn_frd_prce = parseInt($("#optn_frd_prce_" + optn_code).val());
        // 토요일금액
        var optn_sat_prce = parseInt($("#optn_sat_prce_" + optn_code).val());
        // 일요일금액
        var optn_sun_prce = parseInt($("#optn_sun_prce_" + optn_code).val());
        var total_optn_price = 0;
        var now_in_week = weekday(checkInDate);

        if (optn_use_daily_price_yn == "Y") {
            for (j = 0; j < optn_qty; j++) {
                var week = (now_in_week + j) % 7;
                total_optn_price += weekdayPrice(week, optn_week_prce, optn_frd_prce, optn_sat_prce, optn_sun_prce);
            }
        } else {
            total_optn_price += (weekdayPrice(now_in_week, optn_week_prce, optn_frd_prce, optn_sat_prce, optn_sun_prce) * optn_qty);
        }

        RESV_INFO_DTL.OPTN_NM = optn_nm;
        RESV_INFO_DTL.OPTN_CODE = optn_code;
        RESV_INFO_DTL.QTY = optn_qty;
        RESV_INFO_DTL.UNIT_NM = optn_unit_nm;
        RESV_INFO_DTL.OPTN_PRCE = total_optn_price;
        RESV_INFO_DTLS.push(RESV_INFO_DTL);
    }

    RESV_INFO.RESV_INFO_ROOMS = RESV_INFO_ROOMS;
    RESV_INFO.RESV_INFO_DTLS = RESV_INFO_DTLS;

    var param = {};
    param.USER_ID = user_id;
    param.TYPE_IDX = RESV_INFO.TYPE_IDX;
    param.ROOM_CODE = RESV_INFO.ROOM_CODE;
    param.SKIN_TYPE = skinType;
    param.DATE = DATE;

    cmmAjax('/booking/isRvAbleDt', param, function (data) {
        if (data === 'Y') {
            var submit_param = {};
            submit_param.RESV = RESV_INFO;

            $("#frm").append("<input type=\"hidden\" id=\"USER_ID\" name=\"USER_ID\">");
            $("#frm").append("<input type=\"hidden\" id=\"RESV\" name=\"RESV\">");
            $("#frm").append("<input type=\"hidden\" id=\"DATE\" name=\"DATE\">");
            $("#frm").append("<input type=\"hidden\" id=\"SKIN_TYPE\" name=\"SKIN_TYPE\">");

            if (skinType === "TYPE") {
                $("#frm").append("<input type=\"hidden\" id=\"RESV_TYPE_CODE\" name=\"RESV_TYPE_CODE\">");
                $("#RESV_TYPE_CODE").val($($(".price a[data-idx='" + RESV_INFO.TYPE_IDX + "']")).data('resv_type_code'));
            }

            $("#RESV").val(JSON.stringify(submit_param));
            $("#DATE").val(JSON.stringify(DATE));
            $("#SKIN_TYPE").val(skinType);
            $("#USER_ID").val(user_id);

            $("#frm").attr({
                action: "/booking/step2"
            }).submit();
        } else {
            sweetalert2Message('해당객실이 이미 예약완료 되었거나 예약 진행중입니다.');
        }
    })
}
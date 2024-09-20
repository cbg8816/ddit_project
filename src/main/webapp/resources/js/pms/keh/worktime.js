
document.addEventListener('DOMContentLoaded', function(){
     const checkInTextElement = document.getElementById('checkInText');
    const checkOutTextElement = document.getElementById('checkOutText');
    const checkInBtn = document.getElementById('checkInBtn');
    const checkOutBtn = document.getElementById('checkOutBtn');

	  function getCurrentUserId() {
	        return document.getElementById('currentUserId').value;
	    }

	    // localStorage 키에 사용자 ID를 포함시키는 함수
	    function getUserSpecificKey(key) {
	        const userId = getCurrentUserId();
	        return `${userId}_${key}`;
	    }

  // 페이지 로드 시 저장된 시간 정보 불러오기
   loadtime();

 if (checkInBtn) {
    checkInBtn.addEventListener('click', function(e){
        e.preventDefault();
        recordtime('checkIn');
    });
}

if (checkOutBtn) {
    checkOutBtn.addEventListener('click', function(e){
        e.preventDefault();
        recordtime('checkOut');
    });
}

    function recordtime(type){

		// 즁복 출근 체크
		if(type ==='checkIn' &&localStorage.getItem(getUserSpecificKey('checkInTime'))){
			swal("금일은 출근등록이 완료되었습니다.", "", "warning");
			return;
		}

        fetch(`/pms/pmsworkstatus/attendance`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({type: type})
        })
        .then(response => response.json())
         .then(data => {
            if(data.success){
                const now = new Date();
                const timeString = formatTime(now);

                if(type === 'checkIn'){
                    checkInTextElement.textContent = timeString;
 					localStorage.setItem(getUserSpecificKey('checkInTime'), timeString);
                    swal('출근 등록 완료', "", "success").then(() => {
                    refreshCalendar();
                });
                checkInBtn.disabled = true;
                } else {
                    checkOutTextElement.textContent = timeString;
					localStorage.setItem(getUserSpecificKey('checkOutTime'), timeString);
                    swal('퇴근 등록 완료', "", "success").then(() => {
                    refreshCalendar();
                });
                }

            } else {
                swal('등록 실패. 다시 시도해주세요.', "", "warning");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            swal('처리 중 오류가 발생했습니다.', "", "warning");
        });
    }


	// 캘린더 새로고침 함수
function refreshCalendar() {
    if (window.calendar) {
        window.calendar.refetchEvents();
    } else {
        console.error('캘린더 객체를 찾을 수 없습니다.');
    }
}

	function loadtime(){
		if (!checkInTextElement || !checkOutTextElement) {
        console.error('출퇴근 시간을 표시할 요소를 찾을 수 없습니다.');
        return;
    }
		const lastRecordDate = localStorage.getItem(getUserSpecificKey('lastRecordDate'));
	    const today = getTodayDate();

	    // 날짜가 변경되었으면 저장된 시간 초기화
	    if (lastRecordDate !== today) {
	         localStorage.removeItem(getUserSpecificKey('checkInTime'));
            localStorage.removeItem(getUserSpecificKey('checkOutTime'));
            localStorage.setItem(getUserSpecificKey('lastRecordDate'), today);
	    }


        const checkInTime = localStorage.getItem(getUserSpecificKey('checkInTime'));
        const checkOutTime = localStorage.getItem(getUserSpecificKey('checkOutTime'));

        checkInTextElement.textContent = checkInTime || '미등록';
        checkOutTextElement.textContent = checkOutTime || '미등록';

		 if (checkInBtn && checkOutBtn) {
        checkInBtn.disabled = !!checkInTime;
        checkOutBtn.disabled = !checkInTime;  // 출근 기록이 없을 때만 퇴근 버튼 비활성화
    }

 	// 서버에서 최신 데이터 가져오기
	 fetch('/pms/pmsworkstatus/worktime?workStart=' + getTodayDate() + '&workEnd=' + getTodayDate())
	    .then(response => response.json())
	    .then(data => {
	       if (data && data.length > 0) {
                const todayRecord = data[0];
                if (todayRecord.workStart) {
                    const formattedCheckInTime = formatTime(todayRecord.workStart);
                    checkInTextElement.textContent = formattedCheckInTime;
                    localStorage.setItem(getUserSpecificKey('checkInTime'), formattedCheckInTime);
                    if (checkInBtn && checkOutBtn) {
                        checkInBtn.disabled = true;
                        checkOutBtn.disabled = false;
                    }
                }
	             if (todayRecord.workEnd) {
                    const formattedCheckOutTime = formatTime(todayRecord.workEnd);
                    checkOutTextElement.textContent = formattedCheckOutTime;
                    localStorage.setItem(getUserSpecificKey('checkOutTime'), formattedCheckOutTime);
                }
	        }
	    })
	    .catch(error => {
	        console.error('Error fetching work status:', error);
	    });
	}
});

// 시간 계속 뜨게하는거
function parseDate(dateArray) {
    if (!Array.isArray(dateArray) || dateArray.length < 7) {
        console.error('Invalid date array:', dateArray);
        return null;
    }
    return new Date(dateArray[0], dateArray[1] - 1, dateArray[2], dateArray[3], dateArray[4], dateArray[5]);
}


function getTodayDate() {
    const today = new Date();
    return today.getFullYear() + '-' +
           String(today.getMonth() + 1).padStart(2, '0') + '-' +
           String(today.getDate()).padStart(2, '0');
}


	function formatTime(date) {
	  if (Array.isArray(date)) {
		date = parseDate(date);
		}
		if (!(date instanceof Date) || isNaN(date.getTime())) {
		    console.error('Invalid date:', date);
		    return '시간 정보 없음';
		}
		const hours = String(date.getHours()).padStart(2, '0');
		const minutes = String(date.getMinutes()).padStart(2, '0');
		const seconds = String(date.getSeconds()).padStart(2, '0');
		return `${hours}:${minutes}:${seconds}`;
	}
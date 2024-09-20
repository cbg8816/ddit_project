document.addEventListener('DOMContentLoaded', function() {
    let empId = document.getElementById('currentUserId').value;
    initializeCalendar(empId);
});

const contextPath = document.body.dataset.contextPath;

function initializeCalendar(empId) {
    const calendarEl = document.getElementById('calendar');
    if (calendarEl) {
        calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek'
            },
            initialDate: new Date(),
            navLinks: true,
            dayMaxEvents: true,
            height: 800,
            locale: 'ko',
           events: function(info, successCallback, failureCallback) {
    const startDate = info.startStr.split('T')[0]; // YYYY-MM-DD 형식으로 변환
    const endDate = info.endStr.split('T')[0];   // YYYY-MM-DD 형식으로 변환

    fetch(`/pms/pmsworkstatus/worktime?workStart=${startDate}&workEnd=${endDate}`)
        .then(response => {
            if (!response.ok) {
                if (response.status === 401) {
                    window.location.href = contextPath + '/pmslogin.do';  // 인증 실패 시 로그인 페이지로 리다이렉트
                    throw new Error('인증되지 않은 사용자입니다. 다시 로그인해주세요.');
                }
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
			console.log("aaaaaa",data);

            let events1 = data.map(e => ({
                title: formatEventTitle(e,1),
                start: ehForm(e.workStart),
                end: e.workEnd ? ehForm(e.workEnd) : null,
                color: '#4CAF50'
            }));

            let events2 = data.map(e => ({
                title: formatEventTitle(e,2),
                start: ehForm(e.workStart),
                end: e.workEnd ? ehForm(e.workEnd) : null,
                color: '#FFC107'
            }));

			const events = [...events1,...events2]; // 베앨 2개 합치깅

			console.log("bbb",events);
            successCallback(events);

        })
        .catch(error => {
            console.error("근무일정 불러오기 실패:", error);
            failureCallback(error);
        });
},
        });
        calendar.render();
    } else {
        console.error('캘린더 없다');
    }
}

function ehForm(sDate){

	const month = parseInt(sDate[1])< 10 ? `0${sDate[1]}` : sDate[1];
	const day =  parseInt(sDate[2]) < 10 ? `0${sDate[2]}` : sDate[2];
/*	const hour =  parseInt(sDate[3]) < 10 ? `0${sDate[3]}` : sDate[3];
	const minute =  parseInt(sDate[4]) < 10 ? `0${sDate[4]}` : sDate[4];*/
	return `${sDate[0]}-${month}-${day}`;
}

function formatEventTitle(event,pOpt) {
	console.log("event check",event);
	if(pOpt == 1){
    	return "출근: " +formatTime(event.workStart);
	}
	return "퇴근: " +formatTime(event.workEnd);

}




function formatTime(timeString) {
    return `${timeString[3]}:${timeString[4]}:${timeString[5]}`;
}


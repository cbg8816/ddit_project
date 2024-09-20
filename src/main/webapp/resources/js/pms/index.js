document.addEventListener('DOMContentLoaded', function() {
    // 캘린더 초기화
    const calendarEl = document.getElementById('calendar');
    if (calendarEl) {
        const calendar = new FullCalendar.Calendar(calendarEl, {
            // 기본 옵션
            headerToolbar: {
                left: 'prev,next',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            initialDate: new Date(),
            navLinks: true,
            editable: true,
            dayMaxEvents: true, // 'eventLimit' 대신 'dayMaxEvents' 사용
            locale: 'ko', // 한국어 로케일 (필요한 경우)
        });
        calendar.render();
    } else {
        console.error('Calendar element not found');
    }

    // 시간 업데이트 함수
    function updateTime() {
        var now = new Date();
        var hours = now.getHours().toString().padStart(2, '0');
        var minutes = now.getMinutes().toString().padStart(2, '0');
        var seconds = now.getSeconds().toString().padStart(2, '0');
        var formattedTime = hours + ':' + minutes + ':' + seconds;
        var currentTimeEl = document.getElementById('currentTime');
        if (currentTimeEl) {
            currentTimeEl.innerHTML = formattedTime;
        }
    }

    // 1초마다 updateTime 함수 실행
    setInterval(updateTime, 1000);

    // 페이지 로드 시 즉시 시간 표시
    updateTime();

    // 클릭 가능한 행에 이벤트 리스너 추가
    document.querySelectorAll('.clickable-row').forEach(row => {
        row.addEventListener('click', () => {
            window.location.href = row.dataset.href;
        });
    });
});
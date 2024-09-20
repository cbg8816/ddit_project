document.querySelectorAll('.nav a, .toggle-item .content a').forEach(link => {
	  link.addEventListener('click', function(event) {
	    event.preventDefault(); // 기본 링크 동작 방지

	    const url = this.getAttribute('href'); // 링크의 href 속성값 가져오기

	    // AJAX 요청
	    fetch(url)
	      .then(response => response.text())
	      .then(data => {
	        // 페이지의 특정 부분만 업데이트
	       $('.page-inner .row').html(data);
	        // 필요한 경우 새로 로드된 콘텐츠에 대해 추가 스크립트를 실행
 	        initToggleItems();

	        // 모달 닫기 (필요한 경우)
	        const modal = document.querySelector('#appmodal');
	        if (modal) {
	          const modalInstance = bootstrap.Modal.getInstance(modal);
	          if (modalInstance) {
	            modalInstance.hide();
	          }
	        }
	      })
	      .catch(error => console.error('Error:', error));
	  });
	});




	// toggle-item 스크립트를 함수로 분리
	function initToggleItems() {
	  document.querySelectorAll('.toggle-item').forEach(function(item) {
	    item.addEventListener('click', function() {
	      const icon = this.querySelector('.toggle-icon');
	      const content = this.querySelector('.content');
	      if (content.style.display === 'none') {
	        content.style.display = 'block';
	        icon.classList.remove('fa-plus');
	        icon.classList.add('fa-minus');
	      } else {
	        content.style.display = 'none';
	        icon.classList.remove('fa-minus');
	        icon.classList.add('fa-plus');
	      }
	    });
	  });
	}

	// 초기 로드 시 실행
	initToggleItems();
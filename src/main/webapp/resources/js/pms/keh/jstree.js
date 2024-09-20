document.addEventListener("DOMContentLoaded",()=>{
		console.log("aaaaaaaaaa")
		$.getScript("https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js");
		$(document).on('shown.bs.modal', '#approvalline',function () {
			console.log("vvvvvvvvvvvvv")
		    $('#aside-orgtree-tree').jstree({
		        "plugins": ["search"],
		        'core': {
		            'data': function (node, cb) {
		                $.ajax({
		                    url: "${pageContext.request.contextPath}/api/employees", // AJAX로 요청할 URL
		                    method: 'GET',
		                    success: function(data) {
		                        console.log(data);
		                        cb(data);
		                    },
		                    error: function(err) {
		                        console.error("직원 데이터를 불러오는 데 실패했습니다.", err);
		                    }
		                });
		            },
		            "check_callback": true
		        }
		    });
		});
	});
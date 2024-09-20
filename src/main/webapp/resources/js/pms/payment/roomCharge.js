
window.addEventListener("load", function() {

	//최초 페이지 로드 시 : 금년 / 전년 비교 그래프 출력

	const inpFirYear = yearsForm.querySelector("input[name=firstYear]");
	const inpSectYear = yearsForm.querySelector("input[name=secondYear]");
	const inpSingleYear = yearsForm.querySelector("input[name=singleYear]");
	const ctx = document.getElementById('myChart');
	const condition = document.getElementById('condition');
	const colors = ['rgb(051, 102, 255)', 'rgb(183, 109, 252)'
		, 'rgb(255, 051, 051)', 'rgb(30, 170, 0)', 'rgb(250, 205, 27)']

	let flag = "1";

	let firstYear = inpFirYear.value;
	let secondYear = inpSectYear.value;
	let singleYear = inpSingleYear.value;
	let chartCon = condition.value;

	let yearpickers = document.querySelectorAll(".yearpicker");
	let yearpickerOne = document.querySelector(".yearpicker-single");

	let selD = document.getElementById("sel-double");
	let selS = document.getElementById("sel-single");

	const selectDiv = document.querySelector(".select-selected");
	const customSelect = document.querySelector('.custom-select');
	const selectItems = customSelect.querySelectorAll('.select-items div');


	console.log("sled", selD)
	console.log("sles", selS)

	yearpickers[0].value = firstYear;
	yearpickers[1].value = secondYear;
	selS.style.display = "none";

	$(".yearpicker").change(function(){
		inpFirYear.value = yearpickers[0].value;
		inpSectYear.value = yearpickers[1].value;
		console.log("test1 : ", yearpickers[0].value);
		console.log("test1 : ", yearpickers[1].value);
		//condition.value = 'year';
	});

	$(".yearpicker-single").change(function(){
		singleYear.value = yearpickerOne.value;
		console.log(yearpickerOne.value)
		//condition.value = 'year';
	});


	selectItems.forEach(item => {
	    item.addEventListener('click', () => {
	        if (item.classList.contains('same-as-selected')) {
	            const selectedValue = item.textContent;
	            console.log('선택된 값:', selectedValue);

				console.log("div안에 있는 값 : ", selectDiv.textContent);

	            if (selectDiv.textContent === "선택 연도별 비교") {
	                selD.style.display = "block";
					selS.style.display = "none";
	            } else {
	                selD.style.display = "none";
					selS.style.display = "block";
	            }
	        }
	    });
	});


	const graph = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: '',
			datasets: ''
		},
		options: {
			scales: {
				yAxes: [
					{
						ticks: {
							beginAtZero: true,
							userCallback: function(value, index, values) {
								return value.toLocaleString();   // this is all we need
							}
						}
					}
				]
			},
			tooltips: {
				callbacks: {
					label: function(tooltipItem, data) {
						var tooltipValue = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
						return parseInt(tooltipValue).toLocaleString();
					}
				}
			}
		}
	});

	function drawYearChart(room, [data1, data2]){
		graph.data.type = 'bar';
		graph.data.labels = room;
		graph.data.datasets = [data1, data2];
		graph.update();
	}

	function drawMonthTotalChart(data){
		graph.data.type = 'bar';
		graph.data.labels = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
		graph.data.datasets = [data];
		graph.update();
	}

	function drawMonthEachChart(charts){
		graph.config.type = 'line';
		graph.data.labels = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
		graph.data.datasets = charts;
		graph.update();
	}

	yearsForm.addEventListener("submit", function(e) {
		e.preventDefault();
		console.log("ypo : ", yearpickerOne)
		console.log("ypoval : ", yearpickerOne.value)
		console.log("ypdval1 : ", yearpickers[0].value)
		console.log("ypdval2 : ", yearpickers[1].value)
		let url = e.target.action;

		if(flag=="0"){
			firstYear = yearpickers[0].value;
			secondYear = yearpickers[1].value;
			singleYear = yearpickerOne.value;
			chartCon = $("select[id='condition']").val();
			console.log(singleYear);

		}

		axios.post(`${url}`, {
			condition: chartCon,
			firstYear: firstYear,
			secondYear: secondYear,
			singleYear: singleYear
		})
		.then(function(response) {
			let lastYearList = response.data.lastYearPayment;
			let thisYearList = response.data.thisYearPayment;
			let monthTotalList = response.data.monthTotalList;
			let monthEachList = response.data.monthEachList;
			let roomTypes = response.data.roomTypeList;

			const lastYears = {
				type: "bar",
				label: `${firstYear}년 매출`,
				backgroundColor: 'rgb(255, 051, 051)',
				data: lastYearList,
				borderWidth: 1
			};
			const thisYears = {
				type: "bar",
				label: `${secondYear}년 매출`,
				backgroundColor: 'rgb(051, 102, 255)',
				data: thisYearList,
				borderWidth: 1
			};
			const monthTotal = {
				type: "bar",
				label: `${secondYear}년 매출`,
				backgroundColor: 'rgb(051, 102, 255)',
				data: monthTotalList,
				borderWidth: 1
			};
			const monthEach = {
				type: "line",
				label: `${secondYear}년 매출`,
				backgroundColor: 'rgb(051, 102, 255)',
				data: monthEachList,
				borderWidth: 1
			};

			if(condition.value=='year'){
				drawYearChart(roomTypes, [lastYears, thisYears]);
			}else if(condition.value=='month-total'){
				drawMonthTotalChart(monthTotal);
			}else{
				if(monthEachList==null){
					alert("데이타 없음")
				}
				const lineCharts = monthEachList.map((value, index) => ({
					type: "line",
					label: `${roomTypes[index]}`,
					data: value,
					fill: false,
					borderColor: colors[index],
					tension: 0.1
				}));
				drawMonthEachChart(lineCharts);

			}

			flag = "0";

		})
		.catch(function(error) {
			console.log(error);
		})

	});

	yearsForm.requestSubmit();

});

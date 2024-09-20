/**
 *
 */

document.addEventListener("DOMContentLoaded", function(){

	const numbers = document.querySelectorAll(".price");

	numbers.forEach((num)=>{
		num.innerHTML = num.innerHTML.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	})

})
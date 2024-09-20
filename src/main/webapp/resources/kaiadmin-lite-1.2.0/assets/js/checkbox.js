$(document).ready(function() {
	$(".chk-all").click(function() {
		if($(".chk-all").is(":checked")) $(".chk-one").prop("checked", true);
		else $(".chk-one").prop("checked", false);
	});

	$(".chk-one").click(function() {
		var total = $(".chk-one").length;
		var checked = $(".chk-one:checked").length;

		if(total != checked) $(".chk-all").prop("checked", false);
		else $(".chk-all").prop("checked", true); 
	});
});
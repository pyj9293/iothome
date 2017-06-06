$(function() {
	$("#option2").prop("checked", true)
	$("#radioDiv").click(function() {
		var option1 = $("#option1").is(":checked");
		var option2 = $("#option2").is(":checked");
		
		if (option2 == true) {
			$("#radioDiv label").attr('class','btn btn-success');
			
			alert("켜질때");
		} else {
			$("#radioDiv label").attr('class','btn btn-danger');
			
			alert("꺼질때");
		}
	});
});
$(function() {
	$("#option2").prop("checked", true)
	$("#radioDiv").click(function() {
		var option1 = $("#option1").is(":checked");
		var option2 = $("#option2").is(":checked");
		
		if (option2 == true) {
			$("#radioDiv label").attr('class','btn btn-success');
			settingSilent("on");
		} else {
			$("#radioDiv label").attr('class','btn btn-danger');
			settingSilent("off");
		}
	});
	function settingSilent(status) {
		$.ajax({
			type : "post",
			url : "../silentMode/settingSilent.jsp",
			data : {
				key : status
			},
			success : whenSuccess,
			error : whenError
		});
	}
});
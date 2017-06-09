$(function() {
	var temperature = $("#temperature-num").text();
	var humidity = $("#humidity-num").text();
	var temp = false;
	
	if (temperature * 1 < 0) {
		$("#temperature-bar").attr('class','progress-bar progress-bar-danger');
		temp = true;
	}
	
	$("#temperature-num").text(temperature + "˚C");
	$("#humidity-num").text(humidity + "%");

	temperature = (temperature * 1 * 2);
	
	if (temp == true) {
		temperature = (temperature * -1);
	}
	
	$("#temperature-bar").css("width", temperature + "%");
	$("#humidity-bar").css("width", humidity + "%");
	
	$("#environmental-refresh").click(function(){
		alert("실시간 표시");	
	});
	
});

$(function() {
	$("#colors").find('button').prop('disabled', true);

	$("#moodSwith").click(function() {
		var temp = $("#moodSwith").text();

		if (temp.indexOf("OFF") != -1) {

			
			$("#moodSwith").attr('class', 'btn btn-success');
			$("#moodSwith").text("ON");
			$("#colors").find('button').prop('disabled', false);
			var color = "on";
			runAjax(color);

		} else {

			$("#moodSwith").attr('class', 'btn btn-danger');
			$("#moodSwith").text("OFF");
			$("#colors").find('button').prop('disabled', true);
			var color = "off";
			runAjax(color);
		}
	});

	$("#brightnessLeft").click(function() {
		var temp = $("#brigNum").text();

		if (temp > 10) {
			$("#brigNum").text(temp * 1 - 10);
			var color = $("#brigNum").text();
			runAjax(color);
		}
	});

	$("#brightnessRight").click(function() {
		var temp = $("#brigNum").text();

		if (temp < 100) {
		    $("#brigNum").text(temp * 1 + 10);
			var color = $("#brigNum").text();
			runAjax(color);
		}
	});

	$("#r").click(function() {
		var color = "red";
		runAjax(color);
	});

	$("#g").click(function() {
		var color = "green";
		runAjax(color);
	});

	$("#b").click(function() {
		var color = "blue";
		runAjax(color);
	});

	$("#p").click(function() {
		var color = "pink";
		runAjax(color);
	});

	$("#y").click(function() {
		var color = "yellow";
		runAjax(color);
	});

	$("#o").click(function() {
		var color = "orange";
		runAjax(color);
	});

	$("#s").click(function() {
		var color = "skyblue";
		runAjax(color);
	});

	$("#w").click(function() {
		var color = "white";
		runAjax(color);
	});
	
	$("#mood").click(function() {
		var color = "mood";
		runAjax(color);
	});

	$("#club").click(function() {
		var color = "club";
		runAjax(color);
	});
	
});
$(function() {
    $("#colors").find('button').prop('disabled', true);
    
    $("#moodSwith").click(function() {
    	var temp = $("#moodSwith").text();
    	
    	if (temp.indexOf("OFF") != -1) {
        	alert("켜짐");
			$("#moodSwith").attr('class','btn btn-success');
        	$("#moodSwith").text("ON");
            $("#colors").find('button').prop('disabled', false);
    	} else {
        	alert("꺼짐");
			$("#moodSwith").attr('class','btn btn-danger');
        	$("#moodSwith").text("OFF");
            $("#colors").find('button').prop('disabled', true);
    	}
    });
    
    $("#brightnessLeft").click(function() {
    	var temp = $("#brigNum").text();
    	
    	if (temp > 10) {
    		$("#brigNum").text(temp * 1 - 10);    		
    	}
    });
    
    $("#brightnessRight").click(function() {
    	var temp = $("#brigNum").text();
    	
    	if (temp < 100) {
    		$("#brigNum").text(temp * 1 + 10);    		
    	}
    });
    
    $("#r").click(function() {
    	alert("빨강~");
    });
    
    $("#g").click(function() {
    	alert("초록~");
    });
    
    $("#b").click(function() {
    	alert("파랑~");
    });
    
    $("#p").click(function() {
    	alert("분홍~");
    });
    
    $("#y").click(function() {
    	alert("노랑~");
    });
    
    $("#o").click(function() {
    	alert("오랜지~");
    });

    $("#s").click(function() {
    	alert("하늘색~");
    });
    
    $("#w").click(function() {
    	alert("하얗~");
    });
});
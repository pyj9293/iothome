<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="controller"
	class="com.iothome.main.controller.MoodLightController" />

<Script>
	function runAjax(color) {
		$.ajax({
			type : "post",
			url : '../moodLight/moodLight.jsp',
			data : {
				key : color
			},
			success : whenSuccess,
			error : whenError,
		});
	}
</Script>
<%
String color = request.getParameter("key");

if(color !=null){
	try{
		controller.connectWebSocket(color);
		System.out.println(color);
	}catch (Exception e) {
		
	}
}
%>
<div>
	<div id="topButton" class="bg-info">
		<p>당신의 감성을 도와드립니다.</p>
		<button id="moodSwith" type="button" class="btn btn-danger"
			data-toggle="button" aria-pressed="false" autocomplete="off">
			OFF</button>
	</div>
	<div id="colors">
		<button id="r" class="img-circle" style="background-color: red;"></button>
		<button id="g" class="img-circle" style="background-color: green;"></button>
		<button id="b" class="img-circle" style="background-color: blue;"></button>
		<button id="p" class="img-circle" style="background-color: pink;"></button>
		<button id="y" class="img-circle" style="background-color: yellow;"></button>
		<button id="o" class="img-circle" style="background-color: orange;"></button>
		<button id="s" class="img-circle" style="background-color: skyblue;"></button>
		<button id="w" class="img-circle" style="background-color: white;"></button>

		<hr>

		<button id="brightnessLeft" class="colorsBrightness"><</button>
		<p id="brigNum" class="colorsBrightness">100</p>
		<p class="colorsBrightness">%</p>
		<button id="brightnessRight" class="colorsBrightness">></button>
	</div>
</div>
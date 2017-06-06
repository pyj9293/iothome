$(function() {
	
	
	$("#searchBtn").click(function() {
		var searchKey = $("#searchKey").val();
		var result = "";
		
		alert("데이터 가져오는 중");
	
		$(".list-group").remove();
		
		result += "<ul class=\"list-group\">";
		for (i = 0; i < 2; i++) {
			result += "<li class=\"list-group-item\"><a onclick=\"settinglocal();\" href=\"#\">" + searchKey + "</a></li>"
		}
		result += "</ul>"
			
		$("#local").append(result);
	});
	
});

function settinglocal() {
	alert("지역 설정 중");
	$(".list-group").remove();
}
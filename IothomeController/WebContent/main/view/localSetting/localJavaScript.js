$(function() {
	$("#searchResult").css("visibility", "collapse")
	$("#searchBtn").click(function() {
		var searchKey = $("#searchKey").val();
		$.ajax({
			type : "post",
			url : "../localSetting/searchLocal.jsp",
			data : {
				key : searchKey
			},
			success : whenSuccess,
			error : whenError
		});
	});
});
function whenSuccess(resdata) {
	var result = "";
	var str = resdata;
	str = str.replace(/\s+/, "");// 왼쪽 공백제거
	str = str.replace(/\s+$/g, "");// 오른쪽 공백제거
	str = str.replace(/\n/g, "");// 행바꿈제거
	str = str.replace(/\t/g, "");// 탭 제거

	var strArray = str.split(",");
	var count = strArray[0];
	$(".list-group").remove();
	result += "<ul class=\"list-group\">";
	for (i = 1; i <= count; i++) {
		result += "<li class=\"list-group-item\"><a id = select" + i
				+ " onclick=\"settinglocal(" + i + ");\" href=\"#\">"
				+ strArray[i] + "</a></li>"
	}
	result += "</ul>"

	$("#local").append(result);
	console.log(resdata);
}
function whenError() {
	alert("Error");
}

function settinglocal(id) {
	var key = $("#select" + String(id)).text();
		$.ajax({
			type : "post",
			url : "../localSetting/settingLocal.jsp",
			data : {
				key : key
			},
			success : settingSuccess,
			error : settingError
		});
	$(".list-group").remove();
}
function settingSuccess() {
	$(".list-group").remove();
}
function settingError() {
	alert("Error");
}
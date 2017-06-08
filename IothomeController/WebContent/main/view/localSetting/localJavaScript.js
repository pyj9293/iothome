$(function() {

	$("#searchBtn")
			.click(
					function() {
						var searchKey = $("#searchKey").val();
						var result = "";

						$.ajax({
							type : "post",
							url : "../localSetting/local.jsp",
							data : {
								key : searchKey
							},
							success : whenSuccess,
							error : whenError
						});
					});
});

function show() {
	$(".list-group").remove();

	result += "<ul class=\"list-group\">";
	for (i = 0; i < 2; i++) {
		result += "<li class=\"list-group-item\"><a onclick=\"settinglocal();\" href=\"#\">"
				+ searchKey + "</a></li>"
	}
	result += "</ul>"

	$("#local").append(result);
}

function whenSuccess(resdata) {

	$("#local").html(resdata);
	console.log(resdata);
	show();
	
}
function whenError() {
	alert("Error");
}

function settinglocal() {
	alert("지역 설정 중");
	$(".list-group").remove();
}
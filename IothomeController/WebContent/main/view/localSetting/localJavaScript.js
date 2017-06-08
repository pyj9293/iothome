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

function whenSuccess(resdata) {

	$("#local").jsp(resdata);
	console.log(resdata);
}
function whenError() {
	alert("Error");
}

function settinglocal() {
	alert("지역 설정 중");
	$(".list-group").remove();
}
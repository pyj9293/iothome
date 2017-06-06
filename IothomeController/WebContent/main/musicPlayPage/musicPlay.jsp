<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://www.youtube.com/player_api"></script>
<script type="text/javascript">
	var playing = 0;
	var playstate = "";
	
// 	$(document).ready(function() {
// 		callAjax();
// 	});
	function callAjax() {
		$.ajax({
			type : "POST",
			url : "http://121.187.77.136:8080/IothomeController/main/musicPlayPage/dynamicStateData.jsp",
			success : whenSuccess, //성공시 callback
			error : whenError //실패시 callback
		});
		if (playing == 1) {
			setTimeout("callAjax()", 2000);
		}
	}
	
	function whenSuccess(resdata) {
		var temp = String(resdata);
		
		if (temp != playstate && playing == 1) {
			playstate = temp;
			$("#ajaxout").html(playstate);
			
			if (playstate.indexOf("play") != -1) {
				playYoutube();
				console.log("시작");
			} else if (playstate.indexOf("pause") != -1) {
				pauseYoutube();
				console.log("중지");
			} else if (playstate.indexOf("stop") != -1) {
				stopYoutube();
				console.log("종료");
			}
		}
	}
	
	function whenError() {
		alert("서버와 연결이 끊겼습니다. 다시 시도해주세요.");
	}
	
	
	var player = null;
    // 유튜브 플레이어를 생성한다.
    function onYouTubePlayerAPIReady() {
        try {
            player = new YT.Player('playerLayer', {
                height: '300',
                width: '500',
                videoId: '<%=request.getParameter("playLink")%>',
                playerVars: {
                    'autoplay': 0,  // 자동실행여부
                    'controls': 1,  // 재생컨트롤 노출여부
                    'autohide': 0,  // 재생컨트롤이 자동으로 사라질지의 여부
                    'rel': 0,       // 동영상 재생완료 후 유사동영상 노출여부
                    'wmode': 'transparent'
                },
                events: {
                    'onReady': onPlayerReady,
                    'onStateChange': onPlayerStateChange
                }
            });
        } catch (e) {
    		alert("유투브 플레이어 생성 실패.");
        }
    }
    // 유튜브 플레이어가 다 만들어지면 호출됨
    function onPlayerReady(event) {
        event.target.playVideo(); 
    	console.log("통신 시작");
    	playing = 1;
		callAjax();
    }
    // 동영상의 재생이 완료되었을 때 호출됨
    function onPlayerStateChange(event) { 	
    	if (event.data === 0) {
	    	console.log("통신 종료");
	    	playing = 0;
    	}
    }
    
    function playYoutube() {
    	if (player != null) {
            player.playVideo();
    	}
    }
    
    function pauseYoutube() {
    	if (player != null) {
        	player.pauseVideo();
    	}
    }
    
    function stopYoutube() {
    	if (player != null) {
        	player.seekTo(0, true);     // 영상의 시간을 0초로 이동시킨다.
        	player.stopVideo();
    	}
    }
</script>
</head>
</head>
<body>
	전송받은 데이터 :
	<%=request.getParameter("playLink")%><br>
	<div id="playerLayer"></div>
		<br/><br/>
	<div id="ajaxout">ajax리턴값출력</div>
</body>
</html>
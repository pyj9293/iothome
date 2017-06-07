<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>IotHome</title>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="../normalize.css">
    <link rel="stylesheet" type="text/css" href="indexStylesheet.css">
    <link rel="stylesheet" type="text/css" href="../nav/navStylesheet.css">
    <link rel="stylesheet" type="text/css" href="../environmental/environmentalStylesheet.css">
    <link rel="stylesheet" type="text/css" href="../silentMode/silentStylesheet.css">
    <link rel="stylesheet" type="text/css" href="../localSetting/localStylesheet.css">
    <link rel="stylesheet" type="text/css" href="../alam/alamStylesheet.css">
    <link rel="stylesheet" type="text/css" href="../moodLight/moodLightStylesheet.css">

    <!-- bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
 
    
    <!-- javaScript -->
    <script type="text/javascript" src="indexJavaScript.js"></script>
    <script type="text/javascript" src="../environmental/environmentalJavaScript.js"></script>
    <script type="text/javascript" src="../silentMode/silentJavaScript.js"></script>
    <script type="text/javascript" src="../localSetting/localJavaScript.js"></script>
    <script type="text/javascript" src="../alam/alamJavaScript.js"></script>
    <script type="text/javascript" src="../moodLight/moodLightJavaScript.js"></script>
</head>

<body>
    <nav>
        <jsp:include page="../nav/nav.jsp"></jsp:include>
    </nav>

    <div id="title-div">
        <h1>IOTHOME</h1>
        <h4>당신만을 위한 IOTHOME 서비스로 편안한 라이프 스타일을 즐겨보세요</h4>
    </div>

    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingOne">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        온습도 설정
                    </a>    
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                <div class="panel-body">
                	<jsp:include page="../environmental/environmental.jsp"></jsp:include> 
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        무음 모드
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="panel-body">
                	<jsp:include page="../silentMode/silent.jsp"></jsp:include>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingThree">
                <h4 class="panel-title">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        무드등 설정
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                <div class="panel-body">
                	<jsp:include page="../moodLight/moodLight.jsp"></jsp:include>
                </div>
            </div>
        </div>
        
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingFour">
                <h4 class="panel-title">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        지역 설정
                    </a>
                </h4>
            </div>
            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                <div class="panel-body">
                	<jsp:include page="../localSetting/local.jsp"></jsp:include> 
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="headingFive">
                <h4 class="panel-title">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                        알람
                    </a>
                </h4>
            </div>
            <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                <div class="panel-body">
                	<jsp:include page="../alam/alam.jsp"></jsp:include>  
                </div>
            </div>
        </div>
    </div>
</body>

</html>

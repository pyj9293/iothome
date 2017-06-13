/**
 * 
 */

$(function() {
	$("#memu1").click(function() {
        var offset = $("#headingOne").offset();
        
        $('html, body').animate({scrollTop : offset.top}, 400);
	});
	
	$("#memu2").click(function() {
        var offset = $("#headingTwo").offset();
        
        $('html, body').animate({scrollTop : offset.top}, 400);
	});
	
	$("#memu3").click(function() {
        var offset = $("#headingThree").offset();
        
        $('html, body').animate({scrollTop : offset.top}, 400);
	});
	
	$("#memu4").click(function() {
        var offset = $("#headingFour").offset();
        
        $('html, body').animate({scrollTop : offset.top}, 400);
	});
	
	$("#memu5").click(function() {
        var offset = $("#headingFive").offset();
        
        $('html, body').animate({scrollTop : offset.top}, 400);
	});
});
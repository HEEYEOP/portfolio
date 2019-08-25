/**
 * 
 */
$(document).ready(function(){
	//비밀번호찾기->임시 이메일 발송 박스
	
	$('span[name=searchPw]').click(function(){
        $('#sendingBox').removeClass('displayNone');
        $('#sendingEmailBox').removeClass('displayNone');
        
    });
	
	//임시 이메일발송 박스, 닫기버튼 누른 동작
	$('#sendingEmailBox h6').click(function(){
		$('#sendingBox').addClass('displayNone');
        $('#sendingEmailBox').addClass('displayNone');	
	});
	
	
	
	
	
	
	
	
	
});
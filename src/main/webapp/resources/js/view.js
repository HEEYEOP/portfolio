/**
 * 
 */
$(document).ready(function(){
	
	$('.viewVsSelectBox a').click(function(){
		$('.viewVsSelectBox a').attr('style','background-position: 0 -60px;');
		$(this).attr('style','background-position: -60px 0;');
		var typeNum = $(this).next('input').val();
		$('input[name=participationVsTypeNum]').val(typeNum);
		
	});
	
	$('#vsSubmitBtn').click(function(){
		
		if($('input[name=participationVsTypeNum]').val() == ''){
			alert('찬/반 의견을 선택해 주세요');
		}else if($('input[name=participationUserEmail]').val() ==''){
			alert('로그인 후 설문에 참여하실 수 있습니다.');	
		}else{
			$('form[name=vsForm]').submit();
		}
	});
	
	
});
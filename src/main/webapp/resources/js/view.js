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
		if($('input[participationVsTypeNum]').val() == ''){
			alert('찬/반 의견을 선택해 주세요');
		}else{
			$('form[name=vsForm]').submit();
		}
		
	});
	
	
});
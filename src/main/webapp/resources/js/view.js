/**
 * 
 */
$(document).ready(function(){
	
	//내가 선택한 결과를 결과그래프에 체크표시
	if($('input[name=myChoice]').val() % 2 != 0){
		console.log($('input[name=myChoice]').val() % 2);
		$('.viewVS_res_myChoice').attr('style','left:15px');
	}else{
		console.log($('input[name=myChoice]').val() % 2);
		$('.viewVS_res_myChoice').attr('style','right:10px')
	}
	
	
	//찬/반형 선택에 따른 체크표시
	$('.viewVsSelectBox a').click(function(){
		$('.viewVsSelectBox a').attr('style','background-position: 0 -60px;');
		$(this).attr('style','background-position: -60px 0;');
		var typeNum = $(this).next('input').val();
		$('input[name=participationVsTypeNum]').val(typeNum);
		
	});
	
	//찬/반형 제출하기 버튼을 눌렀을 때, 유효성 체크
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
/**
 * 
 */
$(document).ready(function(){
	
	//내가 선택한 결과를 결과그래프에 체크표시
	if($('input[name=myChoice]').val() % 2 != 0){
		//console.log($('input[name=myChoice]').val() % 2);
		$('.viewVS_res_myChoice').attr('style','left:15px');
	}else{
		//console.log($('input[name=myChoice]').val() % 2);
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
	
	//댓글등록 버튼 눌렀을 때, 체크
	$('#commentSubmitBtn').click(function(){
		if($('input[name=commentUserEmail]').val() ==''){
			alert('로그인 후 댓글을 작성할 수 있습니다.')
		}else if($('form[name=commentForm] textarea').val()==''){
			alert('댓글을 작성해주세요.');
		}else{
			$('form[name=commentForm]').submit();
		}
			
	});
	
	//게시물공감 버튼 눌렀을 때,
	var val = parseInt($('#likeCount').html());
	$('.likeBtn').click(function(){
		
		if($('input[name=likeUserEmail]').val() == ''){
			alert('공감_은 로그인 후 이용 가능합니다.');
		}else{
			$(this).toggleClass('likeBtnActive');
			
			if($(this).hasClass('likeBtnActive') == true){
				val = val+1;
			}else{
				val = val-1;
			}
			$('#likeCount').html(val);
			
			/*$.ajax({
		        async:true,
		        type:'POST',
		        data:id,
		        url:"test",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		            console.log(data);
		        }
		    });*/
		}
		
	});
	
	
	
	// 찬/반형 투표결과 %에 따른 결과 보여주기
	var jointotal = parseInt( $('input[name=calc_Total]').val() );
	console.log("분모값"+jointotal);
	var yesNum = parseInt( $('input[name=yesNum]').val() );
	var noNum = parseInt( $('input[name=noNum]').val() );
	console.log("찬성값"+yesNum);
	console.log("반대값"+noNum);
	
	var yesWidth = parseFloat((yesNum / jointotal) * 100);
	var noWidth = 100 - yesWidth;
	console.log("찬성%"+yesWidth);
	console.log("반대%"+noWidth);
	
	if(yesWidth == 0){
		$('.viewVS_res_graphBox2').attr('style','width:'+yesWidth+'%; border: 10px solid #288fb4;');
	}else{
		$('.viewVS_res_graphBox2').attr('style','width:'+yesWidth+'%;');
	}
	
	$('.partiNum_Yes').html(yesNum+'명'+'('+yesWidth+'%)');
	$('.partiNum_No').html(noNum+'명'+'('+noWidth+'%)');
	
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});
/**


 * 
 */
$(document).ready(function(){
	
	/*boardType에 따른 대화형*설문형 페이지 보여주기*/
	if($('input[name=boardType]').val() == 'talkType'){
		$('.subType').addClass('displayNone');
		$('.joinPeriod').addClass('displayNone');
	}
	
	/*써머노트*/
	$('#summernote').summernote({ 
		  placeholder: '내용을 작성해주시기 바랍니다', 
		  tabsize: 1, 
		  height: 400, 
		  lang: 'ko-KR' 
	});
	
	/*서브타입 클릭했을 때,  버튼에 체크표시 띄우기*/
	$('.ttl .forTypeCheck').click(function(){
		$('.ttl .forTypeCheck').find('i').each(function(){
			$('.ttl .forTypeCheck').attr('style','background-color: #e5e5e5;');
			$(this).addClass('displayNone');
		})
		$(this).attr('style','background-color: #ff5f4d')
        $(this).find('i').removeClass('displayNone');
		
		var val = $(this).prev().val();
		$('input[name=boardSubtype]').val(val);
		
		if(val == 'VS'){
			$('.typeSurvey').addClass('displayNone');
			$('.typeVS').removeClass('displayNone');
		}else if(val == 'SURVEY'){
			$('.typeVS').addClass('displayNone');
			$('.typeSurvey').removeClass('displayNone');
		}else{
			$('.typeSurvey').addClass('displayNone');
			$('.typeVS').addClass('displayNone');
		}
		
    });
	
	/*참여기간 버튼을 통해서 값 입력받기*/
	$('.sel1 .forTypeCheck').click(function(){
		$('.sel1 .forTypeCheck').find('i').each(function(){
			$('.sel1 .forTypeCheck').attr('style','background-color: #e5e5e5;');
			$(this).addClass('displayNone');
		});
		$(this).attr('style','background-color: #ff5f4d');
		$(this).find('i').removeClass('displayNone');
		var val = $(this).prev().val();
		$('input[name=periodValue]').val(val);
		$('input[name=periodValue]').change();
	});
	
    /*기간 설정버튼에 대한 함수들과 기간설정 기능*/
    function getDateStr(myDate){
    	return (myDate.getFullYear() + '-' + (myDate.getMonth() + 1) + '-' + myDate.getDate())
    }
    function today(){
    	var today = new Date();
    	return getDateStr(today);
    }
    function nextWeek() {
	  var today = new Date()
	  today.setDate(today.getDate()+7);
	  return getDateStr(today);
	}
    function nextTwoWeek() {
  	  var today = new Date()
  	  today.setDate(today.getDate()+14);
  	  return getDateStr(today);
  	}
    function nextMonth() {
  	  var today = new Date()
  	  today.setDate(today.getDate()+30);
  	  return getDateStr(today);
  	}
 
    $('input[name=startDate]').val(today());
    $('input[name=deadline]').val(nextWeek());
    
    $('input[name=periodValue]').change(function(){
    	if($(this).val() == 'twoWeek'){
    		$('input[name=deadline]').val(nextTwoWeek());
    	}else if($(this).val() == 'aMonth'){
    		$('input[name=deadline]').val(nextMonth());
    	}else{
    		$('input[name=deadline]').val(nextWeek());
    	}
    	
    	
    	
    });
    
    
	
});
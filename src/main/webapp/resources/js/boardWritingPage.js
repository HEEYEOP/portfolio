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
    
    
    
    //addA();
    //addAnswerBox();
    
    
	
    /*질문추가버튼 클랙했을 때, 질문 추가하기*/
    $('.addButton').click(function(){
    	$('.Qs').append(Qcode());
    	//addA();
    	//addAnswerBox();
    });
    
    
    
	
}); //document.ready()--------------------------------------


//추가버튼 클릭 시 그에 따른 박스 띄우기
function answerCode(obj) {
	var index = obj.find('.answerBox').length+1;
	var html = ('<div class="answerBox">'+'<div class="answer">'+
    '<label class="redLabel">'+(index)+'</label>'+'<input class="Qtext" style="margin: 0px 0px 5px 55px;" placeholder="질문1에 대한 보기 내용을 적어주세여(100자이내)">'+
    '<a class="QdeleteButton">'+'삭제'+'<i class="fa fa-times-circle"></i>'+'</a>'+'</div>'+'</div>')
    return html;
}

function Qcode(){
	var index =$('.Qs .QBox').length+1;
    var html = ('<div class="QBox">'+'<div class="que">'+'<label class="redLabel">질문'+index+'</label>'+'<input type="text" class="Qtext QtextDeco ">'+
    '<a class="QdeleteButton">'+'삭제'+'<i class="fa fa-times-circle"></i>'+'</a>'+'</div>'+'<div class="queTypeBox">'+
    '<select class="queType">'+'<option>질문형태</option>'+'<option>객관식(단일선택)</option>'+'<option>객관식(복수선택)</option>'+
    '<option>분기형(하위질문)</option>'+'<option>척도형</option>'+'</select>'+'<select class="queType isRequired" onchange="addA2('+(index-1)+',this.value)">'+
    '<option value="is">필수여부</option>'+'<option value="required">필수</option>'+'<option value="NotRequired">필수아님</option>'+
    '</select>'+'<div class="addQueButton displayNone" onclick="addAnswerBox2('+(index-1)+')">'+'질문'+index+'의 보기추가'+'<i class="fa fa-plus-circle"></i>'+
    '</div>'+'</div>'+'<div class="answerBoxSpot"></div>'+'</div>');

    return html;
}

//function addA(){
//	/*필수여부를 선택했을때, 보기추가 버튼 띄우기*/
//    $('.isRequired').change(function(){
//    	if($(this).val() == 'is'){
//    		$(this).siblings('div .addQueButton').addClass('displayNone');
//    	}else{
//    		$(this).siblings('div .addQueButton').removeClass('displayNone');
//    	}
//    });   
//}
//var count = 0;
//function addAnswerBox (){
//	/*보기추가버튼을 클릭했을 때, 보기란 추가하기*/
//    $('.addQueButton').click(function(){
//    	$(this).parent().siblings('.answerBoxSpot').append(answerCode($(this)));
//    	//$('.answerBoxSpot').append(answerCode());
//    });
//}
function addAnswerBox2 (index){

	$('.addQueButton').eq(index).parent().siblings('.answerBoxSpot').append(answerCode($('.QBox').eq(index).find('.answerBoxSpot')));
}
function addA2(index, val){
	if(val == 'is'){
		$('.addQueButton').eq(index).addClass('displayNone');
	}else{
		$('.addQueButton').eq(index).removeClass('displayNone');
	}

}

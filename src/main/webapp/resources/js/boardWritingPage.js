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
	
	//파일첨부 팝업창 띄우기
	$('.addFile').click(function(){
		$('.fileInput').val('');
		$('.baseScreen').removeClass('displayNone');
		$('.addFileWindow').removeClass('displayNone');
	});
	
	//파일첨부 팝업창 닫기
	$('.closeBtn').click(function(){
		$('.baseScreen').addClass('displayNone');
		$('.addFileWindow').addClass('displayNone');
	});
	
	//파일첨부시 첨부파일명 보여주기
	$('input[name=fileTitle]').change(function(){	
		var fileName = $(this).val();
		$('.fileInput').val(fileName);
	});
	
	//파일첨부 확인을 누르면 첨부파일 리스트란에 파일명을 띄움.
	$('.button_Complete').click(function(){
		var fileName = $('.fileInput').val();
		if(fileName !=''){
			$('.fileList').attr('style','padding: 15px 5px 0px 10px');
			$('.fileList').append(fileName+'<br>');
		}
		$('.closeBtn').click();
		
	});
	
	//파일첨부 취소 버튼을 누르면 파일명
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
    
    
    
    //------------------------------설문 추가 기능들-----------------------------
    
    /*질문추가버튼 클랙했을 때, 질문 추가하기*/
    $('.addButton').click(function(){
    	$('.Qs').append(Qcode());
    });
    
    
    
	
}); //document.ready()--------------------------------------

//--------------------------------------------함수---------------------------------------------//
function Qcode(){ //큰 질문박스
	var index =$('.Qs .QBox').length+1;
    var html = ('<div class="QBox">'+'<div class="que">'+'<label class="redLabel">질문'+index+'</label>'+'<input type="text" class="Qtext QtextDeco ">'+
    '<a class="QdeleteButton">'+'삭제'+'<i class="fa fa-times-circle"></i>'+'</a>'+'</div>'+'<div class="queTypeBox">'+
    '<select class="queType">'+'<option>질문형태</option>'+'<option>객관식(단일선택)</option>'+'<option>객관식(복수선택)</option>'+
    '<option>분기형(하위질문)</option>'+'<option>척도형</option>'+'</select>'+'<select class="queType isRequired" onchange="addAnswerButton('+(index-1)+',this.value)">'+
    '<option value="is">필수여부</option>'+'<option value="required">필수</option>'+'<option value="NotRequired">필수아님</option>'+
    '</select>'+'<div class="addQueButton displayNone" onclick="addAnswerBox('+(index-1)+')">'+'질문'+index+'의 보기추가'+'<i class="fa fa-plus-circle"></i>'+
    '</div>'+'</div>'+'<div class="answerBoxSpot"></div>'+'</div>');

    return html;
}

function addAnswerButton(index, value){
	if(value == 'is'){
		$('.addQueButton').eq(index).addClass('displayNone'); //이해가 갈랑말랑 하는데, index를 꼭 0부터 시작해야하는 이유가 있을까? 그냥 Qcode()추가할때 그 속에 index와 동일하면 더 편하지 않을까?
	}else{
		$('.addQueButton').eq(index).removeClass('displayNone');
	}

}

function addAnswerBox(index){ //eq(index)가 index와 동일한 곳에 인가 if처럼 사용되는것인가?
	$('.addQueButton').eq(index).parent().siblings('.answerBoxSpot').append(answerCode($('.QBox').eq(index).find('.answerBoxSpot'))); //여기도 잘 이해가 안감.answerCode()안에 매개변수를 꼭 저렇게 설정해줘야하는가? 앞에서 경로를 다 설정했음에도?
}

function answerCode(obj) { //질문에 대한 보기박스
	var index = obj.find('.answerBox').length+1;
	var html = ('<div class="answerBox">'+'<div class="answer">'+
    '<label class="redLabel">'+(index)+'</label>'+'<input class="Qtext" style="margin: 0px 0px 5px 55px;" placeholder="질문1에 대한 보기 내용을 적어주세여(100자이내)">'+
    '<a class="QdeleteButton">'+'삭제'+'<i class="fa fa-times-circle"></i>'+'</a>'+'</div>'+'</div>')
    return html;
}




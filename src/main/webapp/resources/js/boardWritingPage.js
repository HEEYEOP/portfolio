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
	$('#file').change(function(){	
		var fileName = $(this).val();
		$('.fileInput').val(fileName);
	});
	
	//파일첨부 확인을 누르면 첨부파일 리스트란에 파일명을 띄움.
	$('.button_Complete').click(function(){
		var newObj = $('#file').clone();
		newObj.attr('id','');
		
		if(newObj.val() !=''){
			$('.fileList').attr('style','padding: 15px 5px 0px 10px');
			$('.fileList').append('<div>'+newObj.val()+'<i class="fa fa-times-circle" style="color:red;font-size:12px;margin-left:10px; cursor: pointer;"></i>'+'</div>');
			newObj.addClass('displayNone');
			newObj.attr('name','fileTitle');
			$('.fileList').append(newObj);
			unwrap();
		}
		$('.closeBtn').click();
	});
	

	
	//파일첨부 취소 버튼을 누르면 파일명 없애기
	$('.button_Cancel').click(function(){
		$('.fileInput').val('');
		$('#file').val('');
	});
	
	//동일파일 이어서 등록안됌. 어떠한 알람창도 띄우지 않았음. 이거해결할 것
	//근데 동일 파일 이어서 등록되던데, 다시 한번 체크해보기
	
	
		
	
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
	

	//------------------------------설문 추가 기능들-----------------------------
    
    /*질문추가버튼 클랙했을 때, 질문 추가하기*/
    $('.addButton').click(function(){
    	$('.Qs').append(Qcode());
    	deleteQBox();
    	
    });
    

    //질문 삭제버튼 처리 이벤트 등록 함수 추가
    deleteQBox();
    
   	

    	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*참여기간 버튼을 통해서 값 입력받기 */
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
	
	//달력 플러그인
	$('#testDatepicker').datepicker({
		minDate: 0
	});
	//boardDeadline을 단위버튼 클릭으로 변경하기
    function getDateStr(myDate){
    	var month = myDate.getMonth() + 1;
    	var day = myDate.getDate();
    	
    	if(month < 10){
    		month = '0'+month;
    	}
    	if(day < 10){
    		day = '0'+day;
    	}
    	
    	return (myDate.getFullYear() + '-' + month + '-' + day)
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
    $('input[name=boardDeadlineString]').val(nextWeek());
    
    $('input[name=periodValue]').change(function(){
    	if($(this).val() == 'twoWeek'){
    		$('input[name=boardDeadlineString]').val(nextTwoWeek());
    	}else if($(this).val() == 'aMonth'){
    		$('input[name=boardDeadlineString]').val(nextMonth());
    	}else{
    		$('input[name=boardDeadlineString]').val(nextWeek());
    	}
    	
    });
    
    //게시물 관련 분야 설정
    $('.lowInfo select').change(function(){
    	var changeVal = $(this).val();
    	$('input[name=boardFieldNum]').attr('value',changeVal);
    });
    
    
    
    
    
	
}); //document.ready()--------------------------------------




//질문형태가 변경되면 필수여부를 기본값으로 하기위해서 Qcode 삽입할때 html안에다가 onchange로 넣어주자!!



//--------------------------------------------함수---------------------------------------------//
function Qcode(){ //큰 질문박스
	var index =$('.Qs .QBox').length+1;
    var html = ('<div class="QBox">'+'<div class="que">'+'<label class="redLabel">질문'+index+'</label>'+'<input type="text" class="Qtext QtextDeco ">'+
    '<a class="QdeleteButton">'+'삭제'+'<i class="fa fa-times-circle"></i>'+'</a>'+'</div>'+'<div class="queTypeBox">'+
    '<select class="queType" onchange="nextSelectChange('+(index-1)+')" >'+'<option>질문형태</option>'+'<option>객관식(단일선택)</option>'+'<option>객관식(복수선택)</option>'+
    '<option>분기형(하위질문)</option>'+'<option>척도형</option>'+'</select>'+'<select class="queType isRequired" onchange="addAnswerButton('+(index-1)+',this.value)">'+
    '<option value="is">필수여부</option>'+'<option value="required">필수</option>'+'<option value="NotRequired">필수아님</option>'+
    '</select>'+'<div class="addQueButton displayNone" onclick="addAnswerBox('+(index-1)+')">'+'질문'+index+'의 보기추가'+'<i class="fa fa-plus-circle"></i>'+
    '</div>'+'</div>'+'<div class="answerBoxSpot"></div>'+'</div>');

    return html;
}

function nextSelectChange(index){
	console.log(index);
	$('.queType').eq(index).next('select').val('is');
	$('.queType').eq(index).next('select').next('.addQueButton').addClass('displayNone');
	
}



function addAnswerButton(index, value){
	if(value == 'is'){
		$('.addQueButton').eq(index).addClass('displayNone');
	}else{
		$('.addQueButton').eq(index).removeClass('displayNone');
	}

}

function addAnswerBox(index){ 
	$('.addQueButton').eq(index).parent().siblings('.answerBoxSpot').append(answerCode($('.QBox').eq(index).find('.answerBoxSpot'))); //여기도 잘 이해가 안감.answerCode()안에 매개변수를 꼭 저렇게 설정해줘야하는가? 앞에서 경로를 다 설정했음에도?
	deleteAnswerBox();
}

function answerCode(obj) { //질문에 대한 보기박스
	var index = obj.find('.answerBox').length+1;
	var html = ('<div class="answerBox">'+'<div class="answer">'+
    '<label class="redLabel">'+(index)+'</label>'+'<input class="Qtext" style="margin: 0px 0px 5px 55px;" placeholder="질문1에 대한 보기 내용을 적어주세여(100자이내)">'+
    '<a class="QdeleteButton">'+'삭제'+'<i class="fa fa-times-circle"></i>'+'</a>'+'</div>'+'</div>')
    return html;
}

function unwrap(){
	$('.fa.fa-times-circle').click(function(){
		$(this).parent().next('input[name=fileTitle]').remove();
		$(this).parent('div').remove();	
	});
}

function deleteQBox(){
	$('.Qs>.QBox').last().find('.que .QdeleteButton').click(function(){
		if($('.que .QdeleteButton').length > 1){
			$(this).parents('.QBox').remove();
			updateQuestionNumber();
		}else{
			alert('질문은 1개이상 존재하여야 합니다.'); //오류!! alert창이 여러번 뜸
		}
	});
}

function deleteAnswerBox(){
	$('.answer .QdeleteButton').click(function(){
		$(this).parents('.answerBox').remove();
		updateAnswerNumber();
	});
	
}

//질문1,질문2,질문3 ... 으로 맞추는 함수
function updateQuestionNumber(){
	var cnt = 1;
	$('.que>label').each(function(){
		$(this).html('질문'+ cnt++);
	});
}

//보기란을 1,2,3 ... 번으로 맞추는 함수
function updateAnswerNumber(){
	var cnt = 1;
	$('.answer>label').each(function(){
		$(this).html(cnt++);
	});
}

//설문종류 변경되면 필수여부를 변경하는 함수
function change(){
	 
}


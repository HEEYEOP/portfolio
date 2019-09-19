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
	
	//처음에 만들어져있는 질문을 위한 이벤트 등록//
    deleteQ();
    queTypeChange();
    isRequiredChange();
    TypeScaleValChange();
    addAnswer();

    $('.addButton').click(function(){
    	$('.Qs').append(Qcode());
    	
    	//추가되는 마지막애한테 이벤트 등록해주기
    	deleteQ();
    	queTypeChange();
    	isRequiredChange();
    	TypeScaleValChange();
    	addAnswer();
    	
    });
    
    
    
    //위로 문제 없음-------------------------------------------------
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //배열생성 확인해보기
    /*
    $('button[name=aaabbb]').click(function(){
    	var Qcnt = $('.Qs .QBox').length;
    	//console.log(Qcnt);
    	var QcntArray = new Array(Qcnt);
    	//console.log(QcntArray);
    	for(var i=0; i<Qcnt; i++){
    		var Acnt = $('.QBox .answerBoxSpot').eq(i).find('.answerBox').length;
    		//console.log("질문갯수"+i+"번째"+Acnt);
    		QcntArray[i] = Acnt;
    	}
    	console.log(QcntArray);
    	//잘넘어오는거 확인했고, 제출 버튼 누를 때 같이 넘겨보내줘야겠어!!
    	$.ajax({
    	        async:false,
    	        type:'POST',
    	        traditional : true, 
    	        data:{'QcntArray':QcntArray},
    	        url:"/portfolio/board/writing",
    	        dataType:"json",
    	        success : function(data){
    	            console.log(data);
    	        }
    	 });
    });
    */
    
    
    //게시물 제출버튼 누르면 제출하기전 유효성 검사 및 질문갯수 배열 생성하고 넘기기
    $('#submitBtn').click(function(){
    	
    	if($('input[name=boardTitle]').val() == ''){
    		alert('제목을 입력해주세요');
    		return;
    	}
    	if($('textarea[name=boardContents]').val() == ''){
    		alert('게시물_내용을 입력해주세요');
    		return;
    	}
    	
    	if($('input[name=boardFieldNum]').val() =='' ){
    		alert('관련분야를 선택해주세요');
    		return;
    	}
    	
    	
    	
    	
    	
    	//서브타입에 따른 내용 유효성체크
    	if($('input[name=boardType]').val() == 'surveyType'){
    		
    		if($('#vs').next().find('i').hasClass('displayNone') == true && $('#survey').next().find('i').hasClass('displayNone')== true ){
        		alert('서브타입을 선택해주세요(!서브타입이 필요하지 않을 경우, 게시물 타입 선택에서 대화형_을 선택해주세요. )');
        		return;
        	}
	    	
    		//서브타입이 설문형일 때
    		if($('input[name=boardSubtype]').val() == 'SURVEY'){
    			
		    	if( $('#survey i').hasClass('displayNone') != true){
		    		if($('input[name=surveyContents]').val() ==''){
		    			alert('설문_내용을 작성해주세요.');
		    			return;
		    		}
		    		if($('input[name=questionType]').val() ==''){
		    			alert('질문형태를 선택해주세요');
		    			return;
		    		}
		    		if($('input[name=isEssential]').val() =='is'){
		    			alert('필수여부를 선택해주세요');
		    			return;
		    		}
		    		
		    		//질문 갯수에 따른 배열 생성
		        	var Qcnt = $('.Qs .QBox').length;
		        	var QcntArray = new Array(Qcnt);
		        	for(var i=0; i<Qcnt; i++){
		        		var Acnt = $('.QBox .answerBoxSpot').eq(i).find('.answerBox').length;
		        		QcntArray[i] = Acnt;
		        	}
		        	console.log(QcntArray); //잘넘어오는거 확인했고, 제출 버튼 누를 때 같이 넘겨보내줘야겠어!!
		        	$('input[name=QcntArray]').val(QcntArray);
		        
		    	}
    		}
    	
    	}
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	//마지막에 검사를 모두 통과했을 경우, form 제출
    	//$('form[name=boardForm]').submit();
    	
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*아래로 문제 없음--------------------------------------------*/
    
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


/*----------------------------함수들----------------------------*/
function Qcode(){
	var index = $('.Qs .QBox').length + 1;
	var html ='';
	
	html += '<div class="QBox">';
	html += '	<input type="text"  name="inputNum" value="'+index+'">';
	html += '	<div class="que">';
	html += '		<label class="redLabel">질문'+index+'</label>';
	html += '		<input name="surveyContents" type="text" class="Qtext QtextDeco" placeholder="질문을 입력해주세요.(300자이내)">';
	html += '		<a class="QdeleteButton">';
	html += '			삭제';
	html += '			<i class="fa fa-times-circle"></i>';
	html += '		</a>';
	html += '	</div>';
	
	html += '	<div class="queTypeBox">';
	html += '		<input name="questionType">'
	html += '		<select name="queType" class="queType">';
	html += '			<option>질문형태</option>';
	html += '			<option value="TypeChoiceOne">객관식(단일선택)</option>';
	html += '			<option value="TypeChoiceTwo">객관식(복수선택)</option>';
	html += '			<option value="TypeBranch">분기형(하위질문)</option>';
	html += '			<option value="TypeScale">척도형</option>';
	html += '		</select>';
	
	html += '		<input name="isEssential">';
	html += '		<select name="isRequired" class="queType isRequired">';
	html += '			<option value="is">필수여부</option>';
	html += '			<option value="required">필수</option>';
	html += '			<option value="NotRequired">필수아님</option>';
	html += '		</select>';
	
	html += '		<input name="maxSelectNum" class="queType displayNone" type="number" min="1" max="5" placeholder="복수선택갯수">';
	
	html += '		<select name="TypeScaleVal" class="queType displayNone">';
	html += '			<option value="-1">항목수선택</option>';
	html += '			<option value="3">3</option>';
	html += '			<option value="4">4</option>';
	html += '			<option value="5">5</option>';
	html += '		</select>';
	
	html += '		<div class="addQueButton displayNone">';
	html += '			질문'+index+'의 보기추가';
	html += '			<i class="fa fa-plus-circle"></i>';
	html += '		</div>';
	html += '	</div>';
	
	html += '	<div class="answerBoxSpot">';
	html += '	</div>';
	html += '</div>';
	
	return html;
}



//질문삭제 함수 (질문클릭버튼을 누를 때 질문박스(마지막 질문박스에)에 이벤트를 등록함)
function deleteQ(){
	
	$('.Qs').find('.QBox').last().find('.QdeleteButton').click(function(){
    	var index = $(this).parents('.QBox').find('input[name=inputNum]').val();
    	//console.log(index);
    	if($('.Qs .QBox').length > 1){
    		$('.QBox').eq(index-1).remove();
    	}else{
    		alert('질문은 1개이상 존재하여야 합니다.');
    	}
    	updateQuestionNumber();
    	updateInputNum();
    	updateAddQueBtnNum();
    });
}
//질문1,질문2,질문3 ... 으로 정렬하는 함수
function updateQuestionNumber(){
	var cnt = 1;
	$('.que>label').each(function(){
		$(this).html('질문'+ cnt++);
	});
	
}
//inputNum을 1,2,3 ... 으로 정렬하는 함수
function updateInputNum(){
	var cnt =1;
	$('.QBox input[name=inputNum]').each(function(){
		$(this).val(cnt++);
	});
}
//'질문1의보기추가' 버튼에 index를 바꿔주는 작업
function updateAddQueBtnNum(){
	var cnt = 1;
	$('.QBox .addQueButton').each(function(){
		$(this).html('질문'+(cnt++)+'의 보기추가 <i class="fa fa-plus-circle"></i>');
	});
}
//보기란을 1,2,3 ... 번으로 맞추는 함수
function updateAnswerNum(obj){
	var cnt = 1;
	obj.parents('.QBox').find('.answer>label').each(function(){
		$(this).parents('.answerBox').find('input[name=AnsNum]').val(cnt);
		$(this).html(cnt);
		cnt++;
	});
}

//질문타입이 변경되었을때, 필수여부를 기본값으로 변경하는 기능
function queTypeChange(){
	$('.Qs').find('.QBox').last().find('select[name=queType]').change(function(){
		var index = $(this).parents('.QBox').find('input[name=inputNum]').val();
		//console.log(index);
		$('.QBox').eq(index-1).find('select[name=isRequired]').val('is');
		$('.QBox').eq(index-1).find('select[name=isRequired]').change();
		var val = $(this).val();
		$('.QBox').eq(index-1).find('input[name=questionType]').val(val);
	});
	
}

//필수여부가 변경되었을때, 그에 따른 박스 띄어주는 기능
function isRequiredChange(){
	$('.Qs').find('.QBox').last().find('select[name=isRequired]').change(function(){
		
		var index = $(this).parents('.QBox').find('input[name=inputNum]').val();
    	//console.log(index);
		
		var thisVal =$(this).val();
		$('.QBox').eq(index-1).find('input[name=isEssential]').val(thisVal);
		
		
		$('.QBox').eq(index-1).find('.answerBoxSpot').html('');
		
		var val = $('.QBox').eq(index-1).find('select[name=isRequired]').val();
		if(val == 'is'){
			$('.QBox').eq(index-1).find('input[type=number]').addClass('displayNone');
			$('.QBox').eq(index-1).find('select[name=TypeScaleVal]').addClass('displayNone');
			$('.QBox').eq(index-1).find('.addQueButton').addClass('displayNone');
		}else{
			var type = $('.QBox').eq(index-1).find('select[name=queType]').val();
			if(type == 'TypeChoiceOne'){
				$('.QBox').eq(index-1).find('.addQueButton').removeClass('displayNone');
			}else if(type =='TypeChoiceTwo'){
				$('.QBox').eq(index-1).find('input[type=number]').removeClass('displayNone');
				$('.QBox').eq(index-1).find('.addQueButton').removeClass('displayNone');
			}else if(type =='TypeBranch'){
				$('.QBox').eq(index-1).find('.addQueButton').removeClass('displayNone');
			}else if(type =='TypeScale'){
				$('.QBox').eq(index-1).find('select[name=TypeScaleVal]').removeClass('displayNone');
			}	
		}
	});
}

//척도형_항목갯수를 클릭하면 보기란 추가하는 기능
function TypeScaleValChange(){
	$('.Qs').find('.QBox').last().find('select[name=TypeScaleVal]').click(function(){
		
		var index = $(this).parents('.QBox').find('input[name=inputNum]').val();
		
		var cnt = $(this).val();
		var textArr = new Array(); 
		
		if(cnt == '3'){
			textArr =['나쁨','보통','좋음'];
		}else if(cnt == '4'){
			textArr =['매우나쁨','나쁨','좋음','매우좋음'];
		}else if(cnt == '5'){
			textArr =['매우나쁨','나쁨','보통','좋음','매우좋음'];
		}
		
		var html ='';
		for(var i=0; i<cnt; i++){
			html += '<div class="answerBox">';
			html += '<div class="answer">';
			html += '<label class="redLabel">'+(i+1)+'</label>';
			html += '<input name="surveyContents" class="Qtext" style="margin: 0px 0px 5px 55px;" placeholder="'+textArr[i]+'">';
			html += '</div>';
			html += '</div>';
		}
		$('.QBox').eq(index-1).find('.answerBoxSpot').html(html); 
		
	});	
}

function addAnswer(){
	$('.Qs').find('.QBox').last().find('.addQueButton').click(function(){
		var index = $(this).parents('.QBox').find('input[name=inputNum]').val();
		
		var html = '';
		
		html += '<div class="answerBox">';
		html += '	<input type="text"  name="AnsNum" value="1">';
		html += '	<div class="answer">';
		html += '		<label class="redLabel">'+1+'</label>';
		html += '		<input name="surveyContents" class="Qtext" style="margin: 0px 0px 5px 55px;" placeholder="질문'+index+'에 대한 보기내용을 적어주세요.(300자이내)">';
		html += '		<a class="AnsDeleteButton">';
		html += '			삭제';
		html += '			<i class="fa fa-times-circle"></i>';
		html += '		</a>';
		html += '	</div>';
		html += '</div>';
		
		$('.QBox').eq(index-1).find('.answerBoxSpot').append(html);
		updateAnswerNum($(this));
		
	
	});
}


//지금 얘가 제대로 동작하고 있지 않음
function deleteAns(){
	$('.Qs').find('.QBox').last().find('.AnsDeleteButton').click(function(){
		
		var parentIndex = $(this).parents('.QBox').find('input[name=inputNum]').val();
		var index = $(this).parents('.answerBox').find('input[name=AnsNum]').val();
		console.log(parentIndex);
		console.log(index);
		//$('.QBox').eq(parentIndex-1).find('.answerBox').eq(index-1).remove();
	});
	
}

/*
 * 이건삭제할꺼야
 * 
 * function deleteQ(){
	
	$('.Qs').find('.QBox').last().find('.QdeleteButton').click(function(){
    	var index = $(this).parents('.QBox').find('input[name=inputNum]').val();
    	//console.log(index);
    	if($('.Qs .QBox').length > 1){
    		$('.QBox').eq(index-1).remove();
    	}else{
    		alert('질문은 1개이상 존재하여야 합니다.');
    	}
    	updateQuestionNumber();
    	updateInputNum();
    	updateAddQueBtnNum();
    });
}

*/




















//--------------------------------------------함수(밑에꺼 이전에 작업한것으로 다 지울것임)---------------------------------------------//

































































































/*function Qcode(){ //큰 질문박스
	var index =$('.Qs .QBox').length+1;
	 
    var html = ('<div class="QBox">'+'<input type="text" name="inputNum" value="">'+'<div class="que">'+'<label class="redLabel">질문'+index+'</label>'+'<input type="text" class="Qtext QtextDeco ">'+
    '<a class="QdeleteButton">'+'삭제'+'<i class="fa fa-times-circle"></i>'+'</a>'+'</div>'+'<div class="queTypeBox">'+
    '<select class="queType" onchange="nextSelectChange('+(index-1)+')" >'+'<option>질문형태</option>'+'<option>객관식(단일선택)</option>'+'<option>객관식(복수선택)</option>'+
    '<option>분기형(하위질문)</option>'+'<option>척도형</option>'+'</select>'+'<select class="queType isRequired" onchange="addAnswerButton('+(index-1)+',this.value)">'+
    '<option value="is">필수여부</option>'+'<option value="required">필수</option>'+'<option value="NotRequired">필수아님</option>'+
    '</select>'+'<div class="addQueButton displayNone" onclick="addAnswerBox('+(index-1)+')">'+'질문'+index+'의 보기추가'+'<i class="fa fa-plus-circle"></i>'+
    '</div>'+'</div>'+'<div class="answerBoxSpot"></div>'+'</div>');
   
    return html;
}
function answerCode(obj) { //질문에 대한 보기박스
	var index = obj.find('.answerBox').length+1;
	var html = ('<div class="answerBox">'+'<div class="answer">'+
    '<label class="redLabel">'+(index)+'</label>'+'<input class="Qtext" style="margin: 0px 0px 5px 55px;" placeholder="질문1에 대한 보기 내용을 적어주세여(100자이내)">'+
    '<a class="QdeleteButton">'+'삭제'+'<i class="fa fa-times-circle"></i>'+'</a>'+'</div>'+'</div>')
    return html;
}


function TypeScale(cnt){
	var html = ('<div class="answerBox">'+
					'<div class="answer">'+
						'<label class="redLabel">'+(index)+'</label>'+
						'<input class="Qtext" style="margin: 0px 0px 5px 55px;">'+
						'<a class="QdeleteButton">'+'삭제'+'<i class="fa fa-times-circle"></i>'+'</a>'+
					'</div>'+
				'</div>');
	if(cnt == 5){
		for(var i=1; i<=5; i++){
			html += html
		}
		
		
	}else if(cnt ==4){
		
	}else{
		
	}
}








function nextSelectChange(index){
	$('.isRequired').eq(index).val('is');
	$('.isRequired').eq(index).next('.addQueButton').addClass('displayNone');
	//전혀 상관없는 테스트용
	//console.log($('.isRequired').eq(index).parents('.QBox').find('input[name=inputNum]').val())
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
			alert('질문은 1개이상 존재하여야 합니다.'); 
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
		updateInputNum();
	});
	
}

//보기란을 1,2,3 ... 번으로 맞추는 함수
function updateAnswerNumber(){
	var cnt = 1;
	$('.answer>label').each(function(){
		$(this).html(cnt++);
		updateInputNum();
	});
	
}


function updateInputNum(){
	var cnt =1;
	$('.QBox input[name=inputNum]').each(function(){
		$(this).val(cnt++);
	});
}







//설문종류 변경되면 필수여부를 변경하는 함수
function change(){
	 
}
*/

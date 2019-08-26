
/**
 * 
 */
var isCheck = false;
var sendingNum = "";
var userEmail ="";
var timer = null;
var time = 180;

$.validator.addMethod(
	    "regex",
	    function(value, element, regexp) {
	        var re = new RegExp(regexp);
	        return this.optional(element) || re.test(value);
	    },
	    "Please check your input."
	);











$(document).ready(function(){
		
	//user_type 버튼 동작 시작----------------------------------
	
	$('button[name=typeButton]').click(function(){
        $('button[name=typeButton]').removeClass('active');
        $(this).addClass('active');
        $('#typeValue').val($(this).attr('value'));
        
        //userType이 값이 GroupUser일때, 파일첨부란 보여주기
        if($('#typeValue').val() == 'GroupUser'){
            $('#confirmFileBox').removeAttr('style');
        }else{
        	$('#confirmFileBox').attr('style','display:none')
        }
        
    });
	
	

    //생년월일 셀렉트박스 옵션 추가기능 시작-----------------------------------
    var today = new Date();
    var year = today.getFullYear();
    var str='';
    for(var i = year-100; i<=year-5; i++){
        str += '<option value="'+ i +'">'+ i +'년도</option>'
    }
    var oldStr = $('#year').html();
   $('#year').html(oldStr+str);
   


    var day = [31,28,31,30,31,30,31,31,30,31,30,31];
    
    $('#month').change(function(){
        var month = $(this).val();
        addDay(month);
    });

    function addDay(month){
        var str = '';               //str은 뒤에서 문자열이 이어서 추가되기때문에 ''로 초기화한다
        for(var i=1; i<=day[month-1]; i++){
        	if(i < 10){
        		str += '<option value="0'+ i +'">'+ '0'+ i +'일</option>'

        	}else{
                str += '<option value="'+ i +'">'+ i +'일</option>'
        	}
        }
        $('#date').html(str);
    };
    
    
    //생년월일 데이터타입 변환하기 위한 작업시작----------------
    
    $('select[name=birth]').change(function(){
        var year = $('#year').val();
        var month = $('#month').val();
        var date = $('#date').val();
        
        $('input[name=userBirth2]').val(''+year+'-'+month+'-'+date);
    });
    
    //email인증버튼-> 전송받을 이메일 창 띄우기
    $('button[name=confirmButton]').click(function(){
    	 $('#emailConfirmBox').removeClass('displayNone');
    	 $('.emailDupCheck').removeClass('displayNone');
    }); //------------------여기 추가작업해야함, 인증버튼 뿐 아니라 인풋창 클릭했을때도 동작하도록
    
    
	
	
    
  //email 중복 검사 시작----------------------------------
    
    $('#dup').click(function(){ //인증번호받기 버튼 클릭시
    	
		userEmail = $('input[name=sendingUserEmail]').val();
		if(userEmail == ""){
			alert('사용하실 Email을 입력해주세요')
			
		}else{	
			var url = "/portfolio/dup";
			$.ajax({
		        async:false,
		        type:'POST',
		        data:userEmail,
		        url:url,
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		        	console.log(data.sending);
		            if(data.sending.length != 0){
		            	console.log(data);
		            	alert('회원 가입이 가능한 아이디로 인증번호를 발송했습니다.');
		            	sendingNum = data.sending;
		            	time = 180;
		            	timer = setInterval(() => { 
							time -= 1;
							console.log(time);
							$('#timerBox').html("남은시간 : " + time + "초");
							if(time <= 0)
								$('#timerBox').html("시간이 초과되었습니다.");
						}, 1000);
		            }else{
		            	alert('해당 아이디는 이미 존재합니다. 인증번호를 받을 수 없습니다.');
		            	sendingNum=""
		            }
		        }

		    });   
		}
	});
    
    $('#matchSendingNum').click(function(){ //확인버튼 클릭 시
    	
    	if(time <= 0){
    		clearInterval(timer);
    		time = 180;
    		isCheck = false;
    		
    	}else if(time > 0){
    		var inputSendingNum = $('input[name=sendingNum]').val();
    		
	    	if(sendingNum.length != 0 && inputSendingNum == sendingNum){
	    		$('input[name=userEmail]').val(userEmail);
	    		$('#emailConfirmBox').addClass('displayNone');
	       	 	$('.emailDupCheck').addClass('displayNone');
	       	 	clearInterval(timer);
	       	 	time = 180;
	       	 	alert('Email이 확인되었습니다.');
	       	 	isCheck = true;
	       	 	
	        }else{
	            alert('인증번호가 틀립니다.');
	            isCheck = false;
	        }
    	}
    });
    
	
	
	
	//이메일 중복및 인증에 대한 검사와 사용자타입값이 들어왔는지 검사 시작------------------------------------------
	$('input[name=userEmail]').change(function(){
		isCheck = false;
	});
	$('#form').submit(function(){
    	if($('#typeValue').val() == ''){
    		alert('사용자타입을 선택해주세요')
    		return false;
    	}
		if(!isCheck){ 
			alert('E-mail 중복 체크를 해주세요')
			return false;
		}
		
		
	});	
	
	//기관사용자 일때, 첨부파일 추가되었는지 이전에 추가적으로 유효성검사해줘야함
	
	//form이 제출되었을때 각 인풋창에 따른 유효성 검사를 함
	$("form").validate({
        rules: {
            userEmail: {
                required : true,
                minlength : 8,
                maxlength : 45
            },
            userPw: {
                required : true,
                minlength : 4,
                maxlength : 20,
                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/
            },
            pwCheck: {
                required : true,
                equalTo : userPw
            },
            userName: {
                required : true,
                minlength : 2,
                maxlength : 20
            },
            userPhone: {
                required : true,
                minlength : 11,
                maxlength : 11
            },
            
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
            userEmail: {
                required : "필수로입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다",
                maxlength : "최대 {0}글자이하이어야 합니다"
            },
            userPw: {
                required : "필수로입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다",
                maxlength : "최대 {0}글자이하이어야 합니다",
                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
            },
            pwCheck: {
                required : "필수로입력하세요",
                equalTo : "비밀번호가 일치하지 않습니다."
            },
            userName: {
                required : "필수로 입력하세요",
                minlength : "최소 {0}글자이상이어야 합니다",
                maxlength : "최대 {0}글자이하이어야 합니다", 
                
            },
            userPhone: {
                required : "필수로 입력하세요",
                minlength : "핸드폰번호를 확인하세요",
                maxlength : "핸드폰번호를 확인하세요", 
                
            }
        }
    }); //$(document)꺼----------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
});
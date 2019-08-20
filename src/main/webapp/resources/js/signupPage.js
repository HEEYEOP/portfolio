
/**
 * 
 */
var isCheck = false;
$(document).ready(function(){

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
    
    //user_type 버튼 동작 시작----------------------------------
	
	$('button[name=typeButton]').click(function(){
        $('button[name=typeButton]').removeClass('active');
        $(this).addClass('active');
        $('#typeValue').val($(this).attr('value'));
        
        
    });
	
	
	
    //아이디 중복 검사 시작----------------------------------
            
    $('#form').submit(function(){
    	if($('#typeValue').val() == ''){
    		alert('사용자타입을 선택해주세요')
    		return false;
    	}
		if(!isCheck){ 
			alert('아이디 중복 체크를 해주세요')
			return false;
		}
		
		
	});	
	
	$('#dup').click(function(){
		var userEmail = $('input[name=userEmail]').val();
		if(userEmail == ""){
			alert('사용하실 Email을 입력해주세요')
			
		}else{	
			var url = "/portfolio/dup";
			$.ajax({
		        async:true,
		        type:'POST',
		        data:userEmail,
		        url:url,
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		            if(!data){
		            	alert('회원 가입이 가능한 아이디입니다');
		            	isCheck = true;     	
		            }else{
		            	alert('해당 아이디는 이미 존재합니다');
		            	isCheck = false;
		            }
		        }
	
		    })
		}
	});
	$('input[name=userEmail]').change(function(){
		isCheck = false;
	});
	
	//유효성 검사 시작------------------------------------------
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
            }
            
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
                
            }
        }
    }); //$(document)꺼----------------------------
	
	$.validator.addMethod(
	    "regex",
	    function(value, element, regexp) {
	        var re = new RegExp(regexp);
	        return this.optional(element) || re.test(value);
	    },
	    "Please check your input."
		);
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
});
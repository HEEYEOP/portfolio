
/**
 * 
 */
var isCheck = false;
$(document).ready(function(){

    //생년월일 셀렉트박스 옵션 추가기능 끝-----------------------------------
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
    
    //생년월일 셀렉트박스 옵션 추가기능 끝-----------------------------------
    
    //생년월일 데이터타입 변환하기 위한 작업시작----------------
    
    $('select[name=birth]').change(function(){
        var year = $('#year').val();
        var month = $('#month').val();
        var date = $('#date').val();
        
        $('input[name=user_birth2]').val(''+year+'-'+month+'-'+date);
    });
    //생년월일 데이터타입 변환하기 위한 작업시작----------------
    
    //아이디 중복 검사 시작----------------------------------
            
    $('#form').submit(function(){
		if(!isCheck){ 
			alert('아이디 중복 체크를 해주세요')
			return false;
		}
	});	
	
	$('#dup').click(function(){
		var user_email = $('input[name=user_email]').val();
		if(user_email == ""){
			alert('사용하실 e-mail을 입력해주세요')
			
		}else{	
			var url = "/portfolio/dup";
			$.ajax({
		        async:true,
		        type:'POST',
		        data:user_email,
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
	$('input[name=user_email]').change(function(){
		isCheck = false;
	});
	
    
});
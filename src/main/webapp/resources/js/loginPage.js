/**
 * 
 */
$(document).ready(function(){
	//비밀번호찾기->임시 이메일 발송 박스
	
	$('span[name=searchPw]').click(function(){
        $('#sendingBox').removeClass('displayNone');
        $('#sendingEmailBox').removeClass('displayNone');
        
    });
	
	//임시 이메일발송 박스, 닫기버튼 누른 동작
	$('#sendingEmailBox h6').click(function(){
		$('#sendingBox').addClass('displayNone');
        $('#sendingEmailBox').addClass('displayNone');	
	});
	
	
	//아이디찾기->아이디 찾기 박스
	$('span[name=searchId]').click(function(){
        $('#sendingBox').removeClass('displayNone');
        $('#sendingIdSearch').removeClass('displayNone');
        
    });
	
	//아이디 찾기 박스, 닫기버튼 누른 동작
	$('#sendingIdSearch h6').click(function(){
		$('#sendingBox').addClass('displayNone');
        $('#sendingIdSearch').addClass('displayNone');	
	});
	
	//아이디 찾기 기능, Ajax를 통해 아이디 띄우기
	$('#sendingIdSearch button').click(function(){
	    userPhone = $('#sendingIdSearch input[name=userPhone]').val();
	    userName =$('#sendingIdSearch input[name=userName]').val();
		
	    if(userPhone =="" || userName ==""){
			alert("정보를 입력해주세요")
		}else{
			$.ajax({
		        async:false,
		        type:'POST',
		        data:{"userPhone":userPhone, "userName":userName},
		        url:"/portfolio/idSearch",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		        	console.log(data.userEmail)
		            if(data.userEmail == null){
		            	$('#idSearchRes').html("해당 정보에 대한 아이디를 찾을 수 없습니다");
		            }else{
		            	$('#idSearchRes').html("해당 E-mail은 '  "+data.userEmail +"  ' 입니다.");
		            }
		        }
		    });
		}
	});
	
	
	
	
	
	
	
});
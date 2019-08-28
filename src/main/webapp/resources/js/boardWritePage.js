/**
 * 
 */


$(document).ready(function(){
	
	/*선택한 boardType을 URI경로로 보내기*/
	$('.label').click(function(){
	    $('.label i').attr('style','display:none');
	    $(this).find('i').attr('style','display:inline-block')
	    var val = $(this).prev().val();
	    
	    $('.btn.next').attr('href','/portfolio/board/writing?boardType='+val)
	});

	
});
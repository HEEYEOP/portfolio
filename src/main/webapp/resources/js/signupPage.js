/**
 * 
 */
 $(document).ready(function(){

            //생년월일 셀렉트박스 시작-----------------------------------
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
            }
            
            //생년월일 셀렉트박스 끝-----------------------------------
            
            //----------------
            
            $('select[name=birth]').change(function(){
                var year = $('#year').val();
                var month = $('#month').val();
                var date = $('#date').val();
                
                $('input[name=user_birth2]').val(year+'-'+month+'-'+date);
            })
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        });
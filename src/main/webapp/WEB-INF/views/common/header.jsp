<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<style>
	*{
         margin: 0;
         padding: 0;
         box-sizing: border-box;
     }
	  
	  /* header 스타일 시작 */
   #header{
       border: 1px solid red;
   }
   #headerContents{
      border: 1px solid blue;
      height: 72px;
      margin: 0 auto;
      position: relative;
      max-width: 1050px;
   }
   #logoBox{
       float: left;
       margin-top: 20px;
   }
   #logoBox a{
       text-decoration: none;
   }
   #logoBox a div{
       width: 142px;
       height: 32px;
       border: 1px solid gray;
   }
   #textMenu{
       border: 1px solid green;
       width: 484px;
       position: absolute;
       left: 170px;
       top: 27px;
   }
   #textMenu ul,li{
       list-style: none;   
   }
   #textMenu ul li{
       float: left;
       text-align: center;
       margin-left: 20px;
       text-decoration: none;     /* 이거했는데 왜 밑줄 안없어지는규..? */
   }
   #imgMenu{
      border: 1px solid green;
       position: absolute;
       right: 20px;
       top: 27px;
   }
   #imgMenu ul li{
       float: left;
       text-align: center;
       margin-right: 10px;
       text-decoration: none;   /* 이거했는데 왜 밑줄 안없어짐? */
   }

</style>
    
</head>
<div id=header>
    <div id=headerContents>
        <h1 id="logoBox">
            <a href="#"><div>logoBox</div></a>
        </h1>
        <div id="textMenu">
            <ul>
                <li><a href="#">주제별생각</a></li>
                <li><a href="#">주제별생각</a></li>
                <li><a href="#">주제별생각</a></li>
                <li><a href="#">주제별생각</a></li>
            </ul>
        </div>
        <div id="imgMenu">
            <ul>
                <li><a href="">검색</a></li>
                <li><a href="">생각쓰기</a></li>
                <li><a href="">로그인</a></li>
            </ul>
        </div>
    </div>
</div>
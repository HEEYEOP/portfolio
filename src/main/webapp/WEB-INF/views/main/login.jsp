<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
<style>
	*{
	      margin: 0;
	      padding: 0;
	      box-sizing: border-box;
  	}
	#body{
        border: 1px solid black;
        min-height: 800px;
        max-width: 1050px;
        margin: 0 auto;
        
    }
    #loginImg{
        border: 1px solid darkgreen;
        height: 200px;
    }
    #loginBox{
        border: 1px solid navy;
        max-width: 930px;
        margin: 0 auto;
        width: 500px;
        /* height: 300px; */
        margin-top: 50px;
        margin-bottom: 50px;
        padding: 10px;
    }
    #searchInfoBox{
        border: 1px solid #ced4da;
        border-left: none;
        border-right: none;
        margin-top: 30px;
    }
    #searchInfoBox li{
        margin-bottom: 10px;
        color: darkgreen;
    }
    #searchInfoBox span{
        width: 50%;
        margin: 0;
    }
</style>
</head>

<div id="body">
        <div id="loginImg">이미지</div>
        <div id="loginBox">
            <h1>로그인</h1>
            <form>
                <div class="input-group mb-3 input-group-lg">
                    <div class="input-group-prepend">
                    <span class="input-group-text" style="width: 113.98px;">E-mail</span>
                    </div>
                    <input type="text" class="form-control">
                </div>
                <div class="input-group mb-3 input-group-lg">
                    <div class="input-group-prepend">
                    <span class="input-group-text">비밀번호</span>
                    </div>
                    <input type="text" class="form-control">
                </div>
                <button type="button" class="btn btn-success" style="width:478px;">로그인</button>
            </form>
            <ul id="searchInfoBox">
                <li>
                    <span>홈페이지가 처음이신가요?</span><a href="<%=request.getContextPath()%>/main/signup" style="float: right;">회원가입하기</a>
                </li>
                <li>
                    <span>E-amil을 잊으셨나요?</span><a href="" style="float: right;">가입E-mail찾기</a>
                </li>
                <li>
                    <span>비밀번호를 잊으셨나요?</span><a href="" style="float: right;">비밀번호찾기</a>
                </li>
            </ul>
        </div>
    </div>



</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#body{
        border: 1px solid black;
        min-height: 900px;
        max-width: 1050px;
        margin: 0 auto;
        padding: 50px;
    }
    .tab{
        background-color: #2f2f2f;
        color: white;
        display: block;
        font-size: 13px;
        text-align: center;
        line-height: 50px;
        margin: 5px;
        position: relative;
        border-radius: 10px;
    }
    #signupForm{
        border: 1px solid deeppink;
        height: 800px;
    }
    .form{
        border: 1px solid darkgreen;
        width: 600px;
        margin: 0 auto;
    }
    .boxDeco{
        border: 1px solid red;
        margin: 5px;
        margin-bottom: 30px;
        border-radius: 5px;
        text-align: left;
        padding: 5px 20px 5px 0px;
        height: 50px;
        position: relative;
    }
    .insertIcon{
        border: 1px solid navy;
        width: 50px;
        height: 35px;
        display: inline-block;
        margin-left: 2px;
    }
    .inputDeco{
        border: none;
        width: calc(100% - 100px);
        height: 35px;
        float: right;
    }
    .insertA{
        width: 75px;
        height: 48px;
        display: inline-block;
        text-align: center;
        line-height: 48px;
        background-color: #2f2f2f;
        color: white;
        position: absolute;
        top: 0;
        right: 0;
        border-radius: 5px;
    }
</style>
</head>
<div id="body">
        <div id="signupForm">
            <form action="" class="form">
                <h1>회원가입</h1>
                <li class="tab">E-mail로 회원가입</li>
                사용자구분
                <div class="boxDeco">
                    <input type="checkbox">개인
                    <input type="checkbox">기관
                </div>
                <div class="boxDeco">
                    <div class="insertIcon"></div>
                    <input type="email" class="inputDeco" placeholder="E-mail을 입력하세요">
                    <a href="#" class="insertA">인증하기</a>
                </div>
                <div class="boxDeco">
                    <div class="insertIcon"></div>
                    <input type="text" class="inputDeco" placeholder="비밀번호를 입력하세요">
                </div>
                <div class="boxDeco">
                    <div class="insertIcon"></div>
                    <input type="text" class="inputDeco" placeholder="동일한 비밀번호를 입력하세요">
                </div>
                <div class="boxDeco">
                    <div class="insertIcon"></div>
                    <input type="text" class="inputDeco" placeholder="이름을 입력하세요">
                </div>
                <div class="boxDeco">
                    <div class="insertIcon"></div>
                    <select id="year">
                        <option value="0" selected>선택</option>
                    </select>
                    <select id="month">
                        <option value="0" selected>선택</option>
                        <option value="1">1월</option>
                        <option value="2">2월</option>
                        <option value="3">3월</option>
                        <option value="4">4월</option>
                        <option value="5">5월</option>
                        <option value="6">6월</option>
                        <option value="7">7월</option>
                        <option value="8">8월</option>
                        <option value="9">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                
                    <select id="date">
                        <option value="0" selected>선택</option>
                    </select>
                </div>
                <div class="boxDeco">
                    <input type="checkbox">남성
                    <input type="checkbox">여성   
                </div>
                <button type="submit" class="btn btn-success">회원가입</button>

            </form>
        </div>
        
    </div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<link href="<%=request.getContextPath()%>/resources/css/mainPage.css" rel="stylesheet">
</head>

<!-- header시작 -->
<div id=header>
    <div id=headerContents>
        <h1 id="logoBox">
            <a href="<%=request.getContextPath()%>/main/home"><div>logoBox</div></a>
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
                <li id="imgMenuSearch"><a href="#" >검색</a></li>
                <li><a href="">생각쓰기</a></li>
                <li><a href="<%=request.getContextPath()%>/main/login">로그인</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- header끝 --> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/header.js"></script>
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
<div id="searchWrap" ></div>
<div id="searchBox">검색어를 입력하세요<img src="" alt=""></div>
<!-- header끝 --> 
<div id="fieldBox">
    <ul>
        <li class="field">필드1</li>
        <li class="field">필드2</li>
        <li class="field">필드3</li>
        <li class="field">필드4</li>
        <li class="field">필드5</li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
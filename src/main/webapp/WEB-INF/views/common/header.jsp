<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <a href="<%=request.getContextPath()%>/main/home"><div><i class="fas fa-paper-plane"></i>logo</div></a>
        </h1>
        <div id="textMenu">
            <ul>
                <li><a href="<%=request.getContextPath()%>/main/pageIntro"><i class="fas fa-paper-plane"></i>페이지소개</a></li>
                <li><a href="#"><i class="fas fa-paper-plane"></i>공지사항</a></li>
                <li><a href="#"><i class="fas fa-paper-plane"></i>FAQ 및 문의하기</a></li>
            </ul>
        </div>
        <div id="imgMenu">
            <ul>
                <li><div><i class="fas fa-search"></i></div><div style="font-size: 15px;">검색하기</div></li>
                <c:if test="${user != null}">
                	<li><a href="<%=request.getContextPath()%>/board/write"><div><i class="fas fa-pen"></i></div><div style="font-size: 15px;">설문쓰기</div></a></li>
                	<li><a href="<%=request.getContextPath()%>/main/userPage"><div><i class="fas fa-user"></i></div><div style="font-size: 15px;">마이페이지</div></a></li>
                </c:if>
                <c:if test="${user == null}">
                	<li><a href="<%=request.getContextPath()%>/main/login"><div><i class="fas fa-pen"></i></div><div style="font-size: 15px;">설문쓰기</div></a></li>
                	<li><a href="<%=request.getContextPath()%>/main/login"><div><i class="fas fa-user"></i></div><div style="font-size: 15px;">로그인</div></a></li>
                </c:if>
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
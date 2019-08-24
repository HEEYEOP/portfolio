<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<title>메인화면</title>
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/mainPage.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/mainPage.js"></script>

</head>

<!-- body시작---------------------------------------------------------------------------------------- -->

<div id="body" style="min-height: 800px">
    <div id="mainImg">
        <div id="mainImgContents">
            <div id="mainImgServeyList"></div>
            <img src="<%=request.getContextPath()%>/resources/image/20160503_064803-706x354.jpg" alt="">
        </div>
    </div>

    <div id="mainContents">
        <div id="noticeBox">
        	<div>공지</div>
        	<div></div>
        	<div class="noticeButtonBox">
        		<span class="noticeButtons">
        			<i class="fas fa-angle-left"></i>
        			<i class="fas fa-angle-right"></i>
        		</span>
        	</div>
        </div>
        <div class="totalContentsBox">
        	<ul class="contents borderBottom">
        		<li class="fieldName"><a>분야1</a></li>
        		<li class="fieldName"><a>분야2</a></li>
        		<li class="fieldName"><a>분야3</a></li>
        		<li class="fieldName"><a>분야4</a></li>
        		<li class="fieldName"><a>분야5</a></li>
        		<li class="fieldName"><a>분야6</a></li>
        		<li class="fieldName"><a>분야7</a></li>
        	</ul>
        	<ul class="contents">
        		<li class="fieldName"><a>분야8</a></li>
        		<li class="fieldName"><a>분야9</a></li>
        		<li class="fieldName"><a>분야10</a></li>
        		<li class="fieldName"><a>분야11</a></li>
        		<li class="fieldName"><a>분야12</a></li>
        		<li class="fieldName"><a>분야13</a></li>
        		<li class="fieldName"><a>분야14</a></li>
        	</ul>
        	<div class="totalCount"></div>
        	     	
        </div>
        <div id="menuBox">
            <div class="menuBoxs"></div>
            <div class="menuBoxs"></div>
            <div class="menuBoxs"></div>
            <div class="menuBoxs"></div>
        </div>
        <div id="rankBox">
            <div id="hotRank">
                <h1>HotRank3</h1>
                <div class="Ranks">TOP1</div>
                <div class="Ranks">TOP2</div>
                <div class="Ranks">TOP3</div>
            </div>
            <div id="newRank">
                <h1>NewRank3</h1>
                <div class="Ranks">TOP1</div>
                <div class="Ranks">TOP2</div>
                <div class="Ranks">TOP3</div>
            </div>
        </div>
    </div>
</div>
<!-- body끝 -->


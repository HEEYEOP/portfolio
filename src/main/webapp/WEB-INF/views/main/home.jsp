<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<title>메인화면</title>
<link href="<%=request.getContextPath()%>/resources/css/mainPage.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/mainPage.js"></script>

</head>

<!-- body시작---------------------------------------------------------------------------------------- -->
<div id="body" style="min-height: 800px">
    <div id="mainImg">
        <div id="mainImgContents">
            <div id="mainImgServeyList"></div>
            <ul id="slider" style="margin:0; width: 375px; height:300px; display: inline-block; overflow: hidden; position: relative; ">
            	<c:forEach var="survey" items="${surveyList}">
	            	<li class="mainImgServeyListBox">
	            		<h2>${survey.boardUserEmail}</h2>
	            		<h5 style="float:right">~${survey.boardDeadline2}</h5>
	            		<div class="title">${survey.boardTitle}</div>
	            		
	            	</li>
            	</c:forEach>
            	<div style="font-size:30px; position: absolute; bottom: 0; left: 45%;">
	        			<i class="fas fa-angle-left"></i>
	        			<div class="divBar" style="height: 20px;"></div>
	        			<i class="fas fa-angle-right"></i>
           		</div>
            	<!-- 여기에 위에있는 <li class="mainImgServeyListBox">를 여러개 찍어줘야해 -->
            </ul>
            <%-- <img src="<%=request.getContextPath()%>/resources/image/20160503_064803-706x354.jpg" alt=""> --%>
        </div>
    </div>

    <div id="mainContents">
        <div id="noticeBox">
        	<div class="noticeText"><i class="far fa-flag fa-2x"></i>공지${user.userEmail}</div>
        	<div></div>
        	<div class="noticeButtonBox">
        		<span class="noticeButtons">
        			<i class="fas fa-angle-left"></i>
        			<div class="divBar"></div>
        			<i class="fas fa-angle-right"></i>
        		</span>
        	</div>
        </div>
        <div class="totalContentsBox">
        	<ul class="contents borderBottom">
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">반부패/청렴</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">농림/해양</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">일반행정</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">문화/여가</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">취업/직장</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">통신/과학</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">국방보훈</a></li>
        	</ul>
        	<ul class="contents">
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">교통</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">교육</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">환경</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">건강/복지</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">경제/산업</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">연예</a></li>
        		<li class="fieldName"><a href="<%=request.getContextPath()%>">기타</a></li>
        	</ul>
        	<div class="totalCount"><a href="<%=request.getContextPath()%>/board/totalBoard">총 게시물수</a></div>
        	     	
        </div>
        <div id="menuBox">
            <div class="menuBoxs"><a href="<%=request.getContextPath()%>/board/fieldBoard"><i class="fas fa-list fa-6x"></i><br><span>주제별설문보기</span></a></div>
            <div class="menuBoxs"><a href="#"><i class="fas fa-battery-quarter fa-6x"></i><br><span>진행중설문보기</span></a></div>
            <div class="menuBoxs"><a href="#"><i class="fas fa-battery-full fa-6x"></i><br><span>완료된설문보기</span></a></div>
            <div class="menuBoxs"><a href="#"><i class="far fa-comment-dots fa-6x"></i><br><span>대화설문보기</span></a></div>
        </div>
        <div id="rankBox">
            <div id="hotRank">
                <h1>HotRank3</h1>
                <div class="ranks">
                	<div class="rankImg"></div>
                	<div class="rankText">
                		<h2 style="font-size: 12px; background-color: darkorange">설문타입</h2>
                	</div>
                </div>
                <div class="ranks">
                	<div class="rankImg"></div>
                	<div class="rankText">
                		<h2 style="font-size: 12px; background-color: darkorange">설문타입</h2>
                	</div>
                </div>
                <div class="ranks">
                	<div class="rankImg"></div>
                	<div class="rankText">
                		<h2 style="font-size: 12px; background-color: darkorange">설문타입</h2>
                	</div>
                </div>
            </div>
            <div id="newRank">
                <h1>NewRank3</h1>
                <div class="ranks">
                	<div class="rankImg"></div>
                	<div class="rankText">
                		<h2 style="font-size: 12px; background-color: darkorange">설문타입</h2>
                	</div>
                </div>
                <div class="ranks">
                	<div class="rankImg"></div>
                	<div class="rankText">
                		<h2 style="font-size: 12px; background-color: darkorange">설문타입</h2>
                	</div>
                </div>
                <div class="ranks">
                	<div class="rankImg"></div>
                	<div class="rankText">
                		<h2 style="font-size: 12px; background-color: darkorange">설문타입</h2>
                	</div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- body끝 -->


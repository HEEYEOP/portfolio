<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>설문 상세 보기 페이지</title>
<link href="<%=request.getContextPath()%>/resources/css/view.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/view.js"></script>

</head>

<div class="body">
	<div class="bodyContetns">
	
		<div class="boardHeader">
			<c:if test="${board.boardSubtype eq 'VS'}">
				<h3 class="type">찬/반형</h3>
			</c:if>
			<c:if test="${board.boardSubtype eq 'SURVEY'}">
				<h3 class="type">설문형</h3>
			</c:if>
			<h3 class="date">[yyyy-mm-dd ~ yyyy-mm-dd]</h3>
			<h1 class="title">${board.boardTitle}</h1>
			<div class="userInfo">
				<p style="margin: 0;">[ ${board.boardUserEmail} ]님의 생각</p>
				<p style="margin: 0;">게시물 등록일 : ${board.registrationDate}</p>
				<p>작성게시물 수 [4 개] / 작성댓글 수 [15 개]</p>
			</div>
		</div>
		
		
		<div class="boardMiddle">
			<div class="text">
				${board.boardContents}
			</div>
			<div style="marin-top:20px; margin-bottom:20px;">
				<span>관련분야 :</span>
				<span class="type">${board.fieldTitle}</span>
			</div>
			<div>
				<div class="likeBtn">
					<i class="far fa-heart"></i>
					<i class="fas fa-heart" style="color:red;"></i>
					<span>공감해요</span>
					<span>${board.likesCount}</span>
				</div>
			</div>
			
			<c:if test="${board.boardSubtype eq 'VS'}">
			
				<!-- VS타입인경우 -->
				<div class="viewVS">
					<div class="viewVsTitle">
						<i></i>
						투표에 참여해주세요
					</div>
					<div class="viewVsDeadline">
						<i class="fa fa-clock-o">${board.boardDeadline}</i>까지
					</div>
					
					<div class="viewVsSelectBox">
						<div class="vsSelect vsYes">
							${yes.vsContents}
							<a></a>
							<div class="vsMark">
								<span>VS</span>
							</div>
						</div>
						<div class="vsSelect vsNo">
							${yes.vsContents}
							<a></a>
						</div>
					</div>
				
					<div class="submitBtnBox">
						<a>
							제출하기
							<i class="fa fa-check"></i>
						</a>
					</div>
				</div>
			
			</c:if>
			
			<c:if test="${board.boardSubtype eq 'SURVEY'}">
				<!-- SURVEY타입인경우 -->
				<div class="viewSurvey">
					<div class="viewSurveyTitle" >
						<i style="background-position: 0 -170px;"></i>
						설문에 참여해주세요
					</div>
					<div class="totalNum">
						총 참여인원<strong>@@</strong>명
					</div>
					<div class="viewSurveyDeadline" style="top:150px;">
						<i class="fa fa-clock-o"></i>까지
					</div>
					<div style="margin-top:40px;"></div>
					<div class="surveyList">
						<div class="sur">
							<div class="surQ">
								<span>1</span>
								귀하의 개인정보가 안전하게 보호되고 있다고 생각하십니까?
								<div class="needBox" style="width: 50px; float: right;">
									<p>필수</p>
								</div>
							</div>
							<div class="surA" style="padding-left: 40px;">
								<ul>
									<li>
										<div class="selBtn"><label></label></div>
										매우그렇다
									</li>
								
								</ul>
							</div>
							
						</div>
					</div>
				</div>
			</c:if>
		
		
		</div>
		
		
		
		<div class="boardBottom">
		
			<!-- 댓글작성란 -->
			<div class="commentWrite">
				<textarea rows="" cols=""></textarea>
				<div style="margin-top: 10px;">
					<form action="">
					
						<div style="height: 20px;"><button class="commentEnrollBtn">등록</button></div>
					</form>
				</div>
			</div>
			
			<!-- 댓글들란 -->
			<div class="commentsBox">
				<div class="commentsHeader">
					<span>총 X건의 댓글</span>
				</div>
				<ul style="list-style: none;">
					<li>
						<div class="comment">
							<div class="commentText">여기에 댓글이 조로록조로록조로록 쓰여있을꺼야여기에 댓글이 조로록조로록조로록 쓰여있을꺼야</div>
							<div>
								<div class="writerInfo">
									<span>작성일 : </span>
									<span>yyyy-mm-dd</span><br>
									<span>작성자 :</span><span class="type writerName">가나다</span>
								</div>
								<div class="commentVsBox">
									<div class="commentVs" style="margin-left: 10px; margin-right: 30px;">
										<i class="fa fa-thumbs-down"> 0 </i>
									</div>
									<div class="commentVs">
										<i class="fa fa-thumbs-up"> 2 </i>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			
		</div>
		
		
		
		
		
		
		
		
	</div>

</div>



























</html>
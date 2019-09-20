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
				<h3 class="type">설문_찬/반형</h3>
			</c:if>
			<c:if test="${board.boardSubtype eq 'SURVEY'}">
				<h3 class="type">설문_설문형</h3>
			</c:if>
			<c:if test="${board.boardSubtype ne 'SURVEY' && board.boardSubtype ne 'VS'}">
				<h3 class="type">대화형	</h3>
			</c:if>
			
			<h3 class="date">[ ${board.registrationDate2} ~ ${board.boardDeadline2} ]</h3>
			<h1 class="title">${board.boardTitle}</h1>
			<div class="userInfo">
				<p style="margin: 0;">[ ${board.boardUserEmail} ]님의 생각</p>
				<p style="margin: 0;">게시물 등록일 : ${board.registrationDate2}</p>
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
					<input type="hidden" name="likeUserEmail" value="${user.userEmail}">
					<input type="hidden" name="likeBoardNum" value="${board.boardNum}">
					<i class="far fa-heart"></i>
					<span>공감해요</span>
					<span id="likeCount" style="color: #ff5f4d; font-size: x-large;">${board.likesCount}</span>
				</div>
				<input type="hidden" name="oldLike" value="${isLike.isLike}">
			</div>
			
			
			
			<!-- VS타입인경우 -->
			<c:if test="${board.boardSubtype eq 'VS'}">
				<c:if test="${isParticipation ne null || isParticipation.size() ne 0}">
					<div class="viewVS_res">
						<div class="viewVS_res_title">
							<h3>현재까지 투표 결과</h3>
							<p>투표에 참여해주신 여러분께 감사합니다.</p>
						</div>
						
						<div class="viewVS_res_contents">
							<div class="viewVS_res_contents_Header">
								<div class="viewVS_res_totalNum">
									총 참여인원
									<strong>${yes.totalNum + no.totalNum}</strong>
									<input type="hidden" name="calc_Total" value="${yes.totalNum + no.totalNum}">
									<strong>명</strong> 
								</div>
								<div class="viewVS_res_date">
									<i class="fa fa-clock-o"></i>
									${board.boardDeadline2}까지
								</div>
							</div>
							
							<div class="viewVS_res_contents_graph">
								<div class="viewVS_res_graphTitle">
									<div class="viewVS_res_graphYes">
										찬성
									</div>
									<span class="vs">VS</span>
									<div class="viewVS_res_graphNO">
										반대
									</div>
								</div>
								
								<c:forEach var="isParticipation" items="isParticipation">
									<input name="myChoice" type="hidden" value="${isParticipation.participationVsTypeNum}">
								</c:forEach>
								<div class="viewVS_res_graphBox1" style="right:10px;">
									<div class="viewVS_res_graphBox2" style="width:50%;"></div>
									<div class="viewVS_res_myChoice">
										<i class="fa fa-check"></i>
									</div>
								</div>
								
								<div class="viewVS_res_graphBoxPartiNum">
									<div class="partiNum_Yes">${yes.totalNum}명(50.0%)</div>
									<input type="hidden" name="yesNum" value="${yes.totalNum}">
									<div class="partiNum_No">${no.totalNum}명(50.0%)</div>
									<input type="hidden" name="noNum" value="${no.totalNum}">
								</div>
						
							</div>
							
						</div>
						
					</div>
				</c:if>
				
				
				<c:if test="${isParticipation eq null || isParticipation.size() eq 0}">
					<form class="" name="vsForm" action="<%=request.getContextPath()%>/board/view?participationBoardNum=${board.boardNum}&boardSubtype=${board.boardSubtype}" method="post">
						
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
									<a style="background-position: 0 -60px;"></a>
									<input type="hidden" value="${yes.vsTypeNum}">
									<div class="vsMark">
										<span>VS</span>
									</div>
								</div>
								<div class="vsSelect vsNo">
									${no.vsContents}
									<a style="background-position: 0 -60px;"></a>
									<input type="hidden" value="${no.vsTypeNum}">
								</div>
							</div>
							
							<input type="text" value="" name="participationVsTypeNum">
							<input value="${user.userEmail}" name="participationUserEmail">
							<div class="submitBtnBox">
								<a id="vsSubmitBtn">
									제출하기
									<i class="fa fa-check"></i>
								</a>
							</div>
						</div>
					</form>
				</c:if>
			</c:if>
			<!-- ---------------------------------------------------------------------------- -->
			<!-- SURVEY타입인경우 -->
			<c:if test="${board.boardSubtype eq 'SURVEY'}">
				<c:if test="${isParticipation eq null || isParticipation.size() eq 0 }">
					<form action="<%=request.getContextPath()%>/board/view?participationBoardNum=${board.boardNum}&boardSubtype=${board.boardSubtype}" method="post" name="surveyForm">
						<input value="${user.userEmail}" name="participationUserEmail">
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
							
								<!-- 여기에 FOREACH써서 돌리면 됨 -->
								<c:forEach varStatus="index" var="Psurvey" items="${Psurvey}">
									<div class="sur">
										<div class="surQ">
											<span>${index.count}</span>
											${Psurvey.surveyContents}
											<div class="needBox" style="width: 50px; float: right;">
												<c:if test="${Psurvey.isEssential eq 'required'}">
													<p>필수</p>
												</c:if>
											</div>
											<div class="typeInfo">
												<c:if test="${Psurvey.questionType eq 'TypeChoiceOne' || Psurvey.questionType eq 'TypeScale'}">
													[객관식 설문 - 단일선택만 가능]
												</c:if>
												<c:if test="${Psurvey.questionType eq 'TypeChoiceTwo' }">
													[객관식 설문 - 복수선택 ${Psurvey.maxSelectNum}개 까지 가능]
												</c:if>
												<c:if test="${Psurvey.questionType eq 'TypeBranch'}">
													[객관식 설문 - 단일선택만 가능]
												</c:if>
												
											</div>
										</div>
										
										<div class="surA" style="padding-left: 40px;">
											<ul>
												<c:forEach var="Asurvey" items="${Asurvey}">
													<c:if test="${Psurvey.surveyTypeNum == Asurvey.parentsQ}">
														<li>
															<div class="selBtn">
																<label>
																	<i class="fa fa-check displayNone" style="font-size: 13px;color: white;line-height: 20px;"></i>
																</label>
															</div>
															${Asurvey.surveyContents}
															<div class="selectValChecked">
																<input name="participationSurveyTypeNum" type="checkbox"  value="${Asurvey.surveyTypeNum}">
															</div>
														</li>
													</c:if>
												</c:forEach>
												
											</ul>
										</div>
									</div>
								</c:forEach>
								
							</div>
							<div class="submitBtnBox">
								<a id="surveySubmitBtn">
									제출하기
									<i class="fa fa-check"></i>
								</a>
							</div>
						</div>
					</form>
					
					
					
					
				</c:if>	
			</c:if>
		
		
		</div>
		
		
		
		<div class="boardBottom">
		
			<!-- 댓글작성란 -->
			<div class="commentWrite">
				<form name="commentForm" action="<%=request.getContextPath()%>/board/comment" method="post">
					<input type="hidden" name="commentBoardNum" value="${board.boardNum}">
					<input type="hidden" name="commentUserEmail" value="${user.userEmail}">
					<textarea name="commentContents"></textarea>
					<div style="margin-top: 10px;">
							<div style="height: 20px;"><button id="commentSubmitBtn" type="button" class="commentEnrollBtn">등록</button></div>		
					</div>
				</form>	
			</div>
			
			
				<!-- 댓글들란 -->
				<div class="commentsBox"> 
					<div class="commentsHeader">
						<span style="color: #ff5f4d; font-weight:800">총 ${commentListSize}건의 댓글</span>
					</div>
					<ul style="list-style: none;">
						<li>
							<c:forEach var="comment" items="${commentList}">
								<div class="comment">
									<div class="commentText">${comment.commentContents}</div>
									<div>
										<div class="writerInfo">
											<span>작성일 : </span>
											<span>${comment.registrationDate2}</span><br>
											<span>작성자 :</span><span class="type writerName">${comment.commentUserEmail}</span>
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
							</c:forEach>
						</li>
					</ul>
				</div>
			
			
		</div>
		
		
		
		
		
		
		
		
	</div>

</div>



























</html>
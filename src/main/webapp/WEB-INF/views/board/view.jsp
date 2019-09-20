<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �� ���� ������</title>
<link href="<%=request.getContextPath()%>/resources/css/view.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/view.js"></script>

</head>

<div class="body">
	<div class="bodyContetns">
	
		<div class="boardHeader">
			<c:if test="${board.boardSubtype eq 'VS'}">
				<h3 class="type">����_��/����</h3>
			</c:if>
			<c:if test="${board.boardSubtype eq 'SURVEY'}">
				<h3 class="type">����_������</h3>
			</c:if>
			<c:if test="${board.boardSubtype ne 'SURVEY' && board.boardSubtype ne 'VS'}">
				<h3 class="type">��ȭ��	</h3>
			</c:if>
			
			<h3 class="date">[ ${board.registrationDate2} ~ ${board.boardDeadline2} ]</h3>
			<h1 class="title">${board.boardTitle}</h1>
			<div class="userInfo">
				<p style="margin: 0;">[ ${board.boardUserEmail} ]���� ����</p>
				<p style="margin: 0;">�Խù� ����� : ${board.registrationDate2}</p>
				<p>�ۼ��Խù� �� [4 ��] / �ۼ���� �� [15 ��]</p>
			</div>
		</div>
		
		<div class="boardMiddle">
			<div class="text">
				${board.boardContents}
			</div>
			<div style="marin-top:20px; margin-bottom:20px;">
				<span>���úо� :</span>
				<span class="type">${board.fieldTitle}</span>
			</div>
			<div>
				<div class="likeBtn">
					<input type="hidden" name="likeUserEmail" value="${user.userEmail}">
					<input type="hidden" name="likeBoardNum" value="${board.boardNum}">
					<i class="far fa-heart"></i>
					<span>�����ؿ�</span>
					<span id="likeCount" style="color: #ff5f4d; font-size: x-large;">${board.likesCount}</span>
				</div>
				<input type="hidden" name="oldLike" value="${isLike.isLike}">
			</div>
			
			
			
			<!-- VSŸ���ΰ�� -->
			<c:if test="${board.boardSubtype eq 'VS'}">
				<c:if test="${isParticipation ne null || isParticipation.size() ne 0}">
					<div class="viewVS_res">
						<div class="viewVS_res_title">
							<h3>������� ��ǥ ���</h3>
							<p>��ǥ�� �������ֽ� �����в� �����մϴ�.</p>
						</div>
						
						<div class="viewVS_res_contents">
							<div class="viewVS_res_contents_Header">
								<div class="viewVS_res_totalNum">
									�� �����ο�
									<strong>${yes.totalNum + no.totalNum}</strong>
									<input type="hidden" name="calc_Total" value="${yes.totalNum + no.totalNum}">
									<strong>��</strong> 
								</div>
								<div class="viewVS_res_date">
									<i class="fa fa-clock-o"></i>
									${board.boardDeadline2}����
								</div>
							</div>
							
							<div class="viewVS_res_contents_graph">
								<div class="viewVS_res_graphTitle">
									<div class="viewVS_res_graphYes">
										����
									</div>
									<span class="vs">VS</span>
									<div class="viewVS_res_graphNO">
										�ݴ�
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
									<div class="partiNum_Yes">${yes.totalNum}��(50.0%)</div>
									<input type="hidden" name="yesNum" value="${yes.totalNum}">
									<div class="partiNum_No">${no.totalNum}��(50.0%)</div>
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
								��ǥ�� �������ּ���
							</div>
							<div class="viewVsDeadline">
								<i class="fa fa-clock-o">${board.boardDeadline}</i>����
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
									�����ϱ�
									<i class="fa fa-check"></i>
								</a>
							</div>
						</div>
					</form>
				</c:if>
			</c:if>
			<!-- ---------------------------------------------------------------------------- -->
			<!-- SURVEYŸ���ΰ�� -->
			<c:if test="${board.boardSubtype eq 'SURVEY'}">
				<c:if test="${isParticipation eq null || isParticipation.size() eq 0 }">
					<form action="<%=request.getContextPath()%>/board/view?participationBoardNum=${board.boardNum}&boardSubtype=${board.boardSubtype}" method="post" name="surveyForm">
						<input value="${user.userEmail}" name="participationUserEmail">
						<div class="viewSurvey">
							<div class="viewSurveyTitle" >
								<i style="background-position: 0 -170px;"></i>
								������ �������ּ���
							</div>
							<div class="totalNum">
								�� �����ο�<strong>@@</strong>��
							</div>
							<div class="viewSurveyDeadline" style="top:150px;">
								<i class="fa fa-clock-o"></i>����
							</div>
							<div style="margin-top:40px;"></div>
							<div class="surveyList">
							
								<!-- ���⿡ FOREACH�Ἥ ������ �� -->
								<c:forEach varStatus="index" var="Psurvey" items="${Psurvey}">
									<div class="sur">
										<div class="surQ">
											<span>${index.count}</span>
											${Psurvey.surveyContents}
											<div class="needBox" style="width: 50px; float: right;">
												<c:if test="${Psurvey.isEssential eq 'required'}">
													<p>�ʼ�</p>
												</c:if>
											</div>
											<div class="typeInfo">
												<c:if test="${Psurvey.questionType eq 'TypeChoiceOne' || Psurvey.questionType eq 'TypeScale'}">
													[������ ���� - ���ϼ��ø� ����]
												</c:if>
												<c:if test="${Psurvey.questionType eq 'TypeChoiceTwo' }">
													[������ ���� - �������� ${Psurvey.maxSelectNum}�� ���� ����]
												</c:if>
												<c:if test="${Psurvey.questionType eq 'TypeBranch'}">
													[������ ���� - ���ϼ��ø� ����]
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
									�����ϱ�
									<i class="fa fa-check"></i>
								</a>
							</div>
						</div>
					</form>
					
					
					
					
				</c:if>	
			</c:if>
		
		
		</div>
		
		
		
		<div class="boardBottom">
		
			<!-- ����ۼ��� -->
			<div class="commentWrite">
				<form name="commentForm" action="<%=request.getContextPath()%>/board/comment" method="post">
					<input type="hidden" name="commentBoardNum" value="${board.boardNum}">
					<input type="hidden" name="commentUserEmail" value="${user.userEmail}">
					<textarea name="commentContents"></textarea>
					<div style="margin-top: 10px;">
							<div style="height: 20px;"><button id="commentSubmitBtn" type="button" class="commentEnrollBtn">���</button></div>		
					</div>
				</form>	
			</div>
			
			
				<!-- ��۵�� -->
				<div class="commentsBox"> 
					<div class="commentsHeader">
						<span style="color: #ff5f4d; font-weight:800">�� ${commentListSize}���� ���</span>
					</div>
					<ul style="list-style: none;">
						<li>
							<c:forEach var="comment" items="${commentList}">
								<div class="comment">
									<div class="commentText">${comment.commentContents}</div>
									<div>
										<div class="writerInfo">
											<span>�ۼ��� : </span>
											<span>${comment.registrationDate2}</span><br>
											<span>�ۼ��� :</span><span class="type writerName">${comment.commentUserEmail}</span>
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
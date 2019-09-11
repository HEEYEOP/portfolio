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
				<h3 class="type">��/����</h3>
			</c:if>
			<c:if test="${board.boardSubtype eq 'SURVEY'}">
				<h3 class="type">������</h3>
			</c:if>
			<h3 class="date">[yyyy-mm-dd ~ yyyy-mm-dd]</h3>
			<h1 class="title">${board.boardTitle}</h1>
			<div class="userInfo">
				<p style="margin: 0;">[ ${board.boardUserEmail} ]���� ����</p>
				<p style="margin: 0;">�Խù� ����� : ${board.registrationDate}</p>
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
					<i class="far fa-heart"></i>
					<i class="fas fa-heart" style="color:red;"></i>
					<span>�����ؿ�</span>
					<span>${board.likesCount}</span>
				</div>
			</div>
			
			<c:if test="${board.boardSubtype eq 'VS'}">
			
				<!-- VSŸ���ΰ�� -->
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
							�����ϱ�
							<i class="fa fa-check"></i>
						</a>
					</div>
				</div>
			
			</c:if>
			
			<c:if test="${board.boardSubtype eq 'SURVEY'}">
				<!-- SURVEYŸ���ΰ�� -->
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
						<div class="sur">
							<div class="surQ">
								<span>1</span>
								������ ���������� �����ϰ� ��ȣ�ǰ� �ִٰ� �����Ͻʴϱ�?
								<div class="needBox" style="width: 50px; float: right;">
									<p>�ʼ�</p>
								</div>
							</div>
							<div class="surA" style="padding-left: 40px;">
								<ul>
									<li>
										<div class="selBtn"><label></label></div>
										�ſ�׷���
									</li>
								
								</ul>
							</div>
							
						</div>
					</div>
				</div>
			</c:if>
		
		
		</div>
		
		
		
		<div class="boardBottom">
		
			<!-- ����ۼ��� -->
			<div class="commentWrite">
				<textarea rows="" cols=""></textarea>
				<div style="margin-top: 10px;">
					<form action="">
					
						<div style="height: 20px;"><button class="commentEnrollBtn">���</button></div>
					</form>
				</div>
			</div>
			
			<!-- ��۵�� -->
			<div class="commentsBox">
				<div class="commentsHeader">
					<span>�� X���� ���</span>
				</div>
				<ul style="list-style: none;">
					<li>
						<div class="comment">
							<div class="commentText">���⿡ ����� ���η����η����η� �����������߿��⿡ ����� ���η����η����η� ������������</div>
							<div>
								<div class="writerInfo">
									<span>�ۼ��� : </span>
									<span>yyyy-mm-dd</span><br>
									<span>�ۼ��� :</span><span class="type writerName">������</span>
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
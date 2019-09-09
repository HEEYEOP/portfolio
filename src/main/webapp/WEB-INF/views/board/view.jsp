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
			<h3 class="type">������</h3>
			<h3 class="type">���úо�����</h3>
			<h3 class="date">[yyyy-mm-dd ~ yyyy-mm-dd]</h3>
			<h1 class="title">���⿡�� �������� ������ �������� ������� ����ϴ°� �������? �̷��� </h1>
			<div class="userInfo">
				<p style="margin: 0;">[ @#%$^@%# ]���� ����</p>
				<p style="margin: 0;">�Խù� ����� : yyyy-mm-dd</p>
				<p>�ۼ��Խù� �� [4 ��] / �ۼ���� �� [15 ��]</p>
			</div>
		</div>
		
		<div class="boardMiddle">
			<div class="text">
				���⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷������⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷������⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷���
				���⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷������⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷������⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷���
				���⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷������⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷������⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷���
				���⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷������⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷������⿡ ������ ������ ���°ǰ� ȭ�鿡 ��� ���̷���
				������ �Ҽ��� ������ �Ҽ��� ������ �Ҽ��� ������ �Ҽ��� ������ �Ҽ��� ������ �Ҽ���
			</div>
			<div style="marin-top:20px; margin-bottom:20px;">
				<span>���úо� :</span>
				<span class="type">abc/def</span>
			</div>
			<div>
				<div class="likeBtn">
					<i class="far fa-heart"></i>
					<i class="fas fa-heart" style="color:red;"></i>
					<span>�����ؿ�</span>
					<span>3</span>
				</div>
			</div>
			
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
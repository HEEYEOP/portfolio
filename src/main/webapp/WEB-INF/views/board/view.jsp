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
			<h3 class="type">설문형</h3>
			<h3 class="type">관련분야주제</h3>
			<h3 class="date">[yyyy-mm-dd ~ yyyy-mm-dd]</h3>
			<h1 class="title">여기에는 설문조사 제목이 들어갈꺼에요 예를들면 어떻게하는게 좋을까요? 이렇게 </h1>
			<div class="userInfo">
				<p style="margin: 0;">[ @#%$^@%# ]님의 생각</p>
				<p style="margin: 0;">게시물 등록일 : yyyy-mm-dd</p>
				<p>작성게시물 수 [4 개] / 작성댓글 수 [15 개]</p>
			</div>
		</div>
		
		<div class="boardMiddle">
			<div class="text">
				여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나
				여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나
				여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나
				여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나여기에 줄줄이 내용이 들어가는건가 화면에 어떻게 보이려나
				줄줄이 소세지 줄줄이 소세지 줄줄이 소세지 줄줄이 소세지 줄줄이 소세지 줄줄이 소세지
			</div>
			<div style="marin-top:20px; margin-bottom:20px;">
				<span>관련분야 :</span>
				<span class="type">abc/def</span>
			</div>
			<div>
				<div class="likeBtn">
					<i class="far fa-heart"></i>
					<i class="fas fa-heart" style="color:red;"></i>
					<span>공감해요</span>
					<span>3</span>
				</div>
			</div>
			
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
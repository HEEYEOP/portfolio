<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성페이지</title>
<link href="<%=request.getContextPath()%>/resources/css/boardWritePage.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/boardWritingPage.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/boardWritingPage.js"></script>
</head>

<div id="writingBody">
	<div class="innerBody">
		<div class="bigBox">
			<div class="boxHD">
				<h3>새로운 생각을 등록해주세요</h3>
				<p>다양한 사람들의 의견을 들어보고싶은 주제를 작성해주세요</p>
			</div>
			<div class="boxMD">
				<input name="boardTitle" class="title" type="text" placeholder="제목을 적어주세요(100자 미만)">
				<p class="font">글과 사진으로 상세내용을 작성해주세요.</p>
				<P class="font">플랫폼 취지와 맞지않는 게시물을 삭제될 수 있습니다.</P>
				<textarea id="summernote"></textarea>
				<div class="fileList">여기에 첨부된 파일들이 들어가는구얌</div>
				<div class="fileBox">
					<label class="addFile">파일첨부</label>
				</div>
				<div class="subType">
					<ul style="list-style : none;">
						<li>
							<div class="typeImg img1"></div>
							<div class="ttl">VS형</div>
							<p>두 가지 중 하나를 고르는 투표</p>
						</li>
						<li>
							<div class="typeImg img2"></div>
							<div class="ttl">설문형</div>
							<p>여러 항목으로 물어보는 설문조사</p>
						</li>
					</ul>
				</div>
				<!-- 서브타입 VS형 -->
				<div class="type1">
				</div>
				
				
				<!-- 서브타입 설문형 -->
			</div>
		</div>
	</div>

</div>





</html>
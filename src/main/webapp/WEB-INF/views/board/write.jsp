<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성 페이지</title>
<link href="<%=request.getContextPath()%>/resources/css/boardWritePage.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/boardWritePage.js"></script>
</head>

<div id="writeBody">
	<div class="innerBody">
		<div class="bigBox">
			<div class="boxHD">
				<h3>새로운 생각을 등록해주세요</h3>
				<p>다양한 사람들의 의견을 들어보고싶은 주제를 작성해주세요</p>
			</div>
			<div class="boxMD">
				<ul style="list-style:none;">
					<li class="typeSelect">
						<div class="typeImg img1"></div>
						<div style="padding: 40px 60px 0 175px;">
							<h2>대화</h2>
							<p>제안, 토론 등을 하고 싶을 때 </p>
						</div>
						<div class="selectButton">
							<input id="sel1" checked="checked" type="radio" style="display:none;">
							<label class="label" for="sel1">
								<i class="fa fa-check"></i>
							</label>
						</div>
					</li>
					<li class="typeSelect">
						<div class="typeImg img2"></div>
						<div style="padding: 40px 60px 0 175px;">
							<h2>투표 * 설문</h2>
							<p>찬반, 선호도 등을 알고 싶을 때 </p>
						</div>
						<div class="selectButton">
							<input id="sel2" checked="checked" type="radio" style="display:none;">
							<label class="label" for="sel2">
								<i class="fa fa-check"></i>
							</label>
						</div>
					</li>
				</ul>
				<input type="hidden" name="boardType">
				<div class="buttonsBox">
					<a class="btn cancel">취소하기</a>
					<a class="btn next">다음단계로
						<i class="fa fa-chevron-right"></i>
					</a>
				</div>
			</div>
		
		</div>
	
	</div>

</div>



















</html>
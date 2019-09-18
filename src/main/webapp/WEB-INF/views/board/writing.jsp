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

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/boardWritingPage2.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/datepicker-ko.js"></script>


</head>

<div id="writingBody">
	<div class="innerBody">
		<div class="bigBox">
			<form action="<%=request.getContextPath()%>/board/writing" method="post" enctype="multipart/form-data" name="boardForm">
				<div class="boxHD">
					<h3>새로운 생각을 등록해주세요</h3>
					<p>다양한 사람들의 의견을 들어보고싶은 주제를 작성해주세요</p>
				</div>
				<input name="boardType" type="hidden" value="${boardType}">
				<input name="boardUserEmail" type="hidden" value="${user.userEmail}">
				<div class="boxMD">
					<input name="boardTitle" class="title" type="text" placeholder="제목을 적어주세요(100자 미만)">
					<p class="font">글과 사진으로 상세내용을 작성해주세요.</p>
					<P class="font">플랫폼 취지와 맞지않는 게시물을 삭제될 수 있습니다.</P>
					<textarea id="summernote" name="boardContents"></textarea>
					<div class="fileList"></div>
					<div class="fileBox">
						<label class="addFile">파일첨부</label>
					</div>
					
					<div class="subType">
						<ul style="list-style : none;">
							<li>
								<div class="subTypeImg img1"></div>
								<div class="ttl">
									<div class="checkIcon">
										<input id="vs" type="radio" class="displayNone" value="VS" >
										<label for="vs" class="forTypeCheck">
											<i class="fa fa-check displayNone"></i>
										</label>
									</div>
									VS형
								</div>
								<p>두 가지 중 하나를 고르는 투표</p>
							</li>
							<li>
								<div class="subTypeImg img2"></div>
								<div class="ttl">
									<div class="checkIcon">
										<input id="survey" type="radio" class="displayNone" value="SURVEY">
										<label for="survey" class="forTypeCheck">
											<i class="fa fa-check displayNone"></i>
										</label>
									</div>
									설문형
								</div>
								<p>여러 항목으로 물어보는 설문조사</p>
							</li>
						</ul>
					</div>
					
					
					<input type="hidden" name="boardSubtype">
					<!-- 서브타입 VS형 -->
					<div class="typeVS displayNone" >
						<p>찬성/반대 의견을 제시해주세요</p>
						<div class="typeVS_text">
							<ul style="list-style:none;">
								<li style="padding-bottom:20px; border-bottom :1px dashed #d1d1d1;">
									<div>
										<input name="vsContents" type="text" placeholder="'찬성'의견을 제시해주세요." class="text">
									</div>
									<p>내용을 적지 않으면 '찬성'단어가 자동으로 입력됩니다.</p>
								</li>
								<li style="padding-top : 36px;">
									<div>
										<input name="vsContents" type="text" placeholder="'반대'의견을 제시해주세요." class="text">
									</div>
									<p>내용을 적지 않으면 '반대'단어가 자동으로 입력됩니다.</p>
								</li>
								<span class="iconVS">VS</span>
							</ul>
						</div>
					</div>
					
					<!-- --------------------------------------------------------------------------위로문제없음 -->
					
					
					
					<!-- 서브타입 설문형 -->
					<div class="typeSurvey displayNone">
						<div class="surInfo">
							<em class="emBold">분기형: </em>
							<em class="emText">
								참여자의 답변 항목에 따라 다음 질문 문항이 달라지는 형태<br>
								ex. 1번) 우리 홈페이지를 이용해 보신 적이 있나요?(예->2번질문)<br>
							</em>
							<br>
							<em class="emBold">척도형: </em>
							<em class="emText">
								답변에서 참여자의 호감*성향 등의 정도를 구분해서 묻는 형태<br>
								ex. Q) 우리 서비스에 만족하시나요?<br>
								A)매우만족-만족-보통-나쁨-매우나쁨<br>
							</em>
							<br>
							<em class="emBold">객관식: </em>
							<em class="emText">
								질문에 여러가지 보기를 제공하여 답변을 받을 수 있음(단일선택 또는 중복선택을 할 수 있음)<br>
							</em>
						</div>
						
						<div class="QplusAddButton">
								<div class="Qs">
								
			<!-- 여기 -->				
								
								
									<!-- --------------------------질문1 ------------------------->
									<div class="QBox">
										<input type="text"  name="inputNum" value="1">
										<div class="que">
											<label class="redLabel">질문1</label> 
			<!-- 여기 -->						<input name="surveyContents" type="text" class="Qtext QtextDeco" placeholder="질문을 입력해주세요.(300자이내)">
											<a class="QdeleteButton">
												삭제
												<i class="fa fa-times-circle"></i>
											</a>
										</div>
										
										<div class="queTypeBox">
			<!-- 여기 -->						<input name="questionType">
											<select name="queType" class="queType">
												<option>질문형태</option>
												<option value="TypeChoiceOne">객관식(단일선택)</option>
												<option value="TypeChoiceTwo">객관식(복수선택)</option>
												<option value="TypeBranch">분기형(하위질문)</option>
												<option value="TypeScale">척도형</option>
											</select>
											
											
			<!-- 여기 -->						<input name="isEssential">
											<select name="isRequired" class="queType isRequired">
												<option value="is">필수여부</option>
												<option value="required">필수</option>
												<option value="NotRequired">필수아님</option>
											</select>
											
											
											<input name="maxSelectNum" class="queType displayNone" type="number" min="1" max="5" placeholder="복수선택갯수">
										
											<select name="TypeScaleVal" class="queType displayNone">
												<option value="-1">항목수선택</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
											
											
											
											
											<div class="addQueButton displayNone">
												질문1의 보기추가
												<i class="fa fa-plus-circle"></i>
											</div>
										</div>
										
										<div class="answerBoxSpot">
											<!-- 여기에 추가한다고 생각하고 -->
											
										</div>
										
						
									</div>
									<!-- ------------------------질문 1끝---------------------- -->
								</div>
								
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							 
							
							
							<!-- 아래로문제없음----------------------------------------------------- -->
							
							<!-- 큰질문박스 추가버튼 -->
							<div class="addButton">
								<a style="text-decoration:none; color:black;">
									질문추가
									<i class="fa fa-plus-circle"></i>
								</a>
							</div>
							
						</div>
						
					</div>
					
					
					<!-- 하위박스정보들------ -->
					<div>
					
						<!-- 게시물 설문에 참여할 수 있는 기간을 설정 -->
						<div class="lowInfo joinPeriod">
							<P>참여기간</P>
							<div style="display:inline-block; margin-right:20px;">
								<input class="periodSelect" name="startDate" readonly>
								-
								<input class="periodSelect" id="testDatepicker" name="boardDeadlineString" onclick="$('#testDatepicker').datepicker('show');">
								
							</div>
							<div style="display:inline-block;">
								<div class="sel1">
									<div class="checkIcon">
										<input id="aWeek" type="radio" class="displayNone" value="aWeek">
										<label for="aWeek" class="forTypeCheck" style="background-color: #ff5f4d;">
											<i class="fa fa-check"></i>
										</label>
									</div>
									1주일
								</div>
								<div class="sel1">
									<div class="checkIcon">
										<input id="twoWeek" type="radio" class="displayNone" value="twoWeek">
										<label for="aWeek" class="forTypeCheck">
											<i class="fa fa-check displayNone"></i>
										</label>
									</div>
									2주일
								</div>
								<div class="sel1">
									<div class="checkIcon">
										<input id="aMonth" type="radio" class="displayNone" value="aMonth">
										<label for="aWeek" class="forTypeCheck">
											<i class="fa fa-check displayNone"></i>
										</label>
									</div>
									1개월
								</div>
							</div>
						</div>
						<input type="hidden" name="periodValue" value="aWeek">
						
						<!-- 게시물 관련 분야 설정 -->
						<div class="lowInfo">
							<P>관련주제</P>
							<div>
								<select>
									<option value="0">선택</option>
									<c:forEach var="field" items="${field}">
										<option value="${field.fieldNum}">${field.fieldTitle}</option>
									</c:forEach>
								</select>
								<input type="hidden" name="boardFieldNum" >
							</div>
						</div>
						
						<!-- 게시물 작성자란 -->
						<div class="lowInfo">
							<P style="line-height: 60px;">작성자</P>
							<div style="font-weight: 600;">${user.userName}</div>
						</div>
						
						<!-- 게시물 메인이미지 첨부파일란 -->
						<div class="lowInfo">
							<P>메인이미지</P>
							<div>
								<input type="file" name="mainFile" style="border: 1px solid gainsboro; "><br>
								<span style="color:gray;">*해당 첨부파일은 게시물 메인이미지로 사용됩니다</span>
							</div>
						</div>
						
						<!-- 이전단계/작성하기 버튼란 -->
						<div class="buttonsBox" style="border-top :none; margin-top : 30px;">
							<a class="btn cancel" href="<%=request.getContextPath()%>/board/write">이전단계로</a>
							<button type="button" id="submitBtn" style="border:none; background:none;">
								<a class="btn next" style="color: white;">다음단계로
									<i class="fa fa-chevron-right"></i>
								</a>
							</button>
						</div>	
	
					</div>
				</div>
			</form>
		</div>
	</div>

</div>

<!-- 여기다가 파일첨부를 구현해보겠따! -->
<section class="baseScreen displayNone"></section>
<section class="addFileWindow displayNone">
	<div class="windowContents">
		<h2>
			<i class="fa fa-file fcolor"></i>
			파일첨부
		</h2>
		<div style="min-height:200px;">
			<div class="contentsArea">
				<div class="file_w">
					<form action="" enctype="multipart/form-data">
						<input placeholder="첨부할 파일을 선택해주세요" class="fileInput" readonly>
						<label for="file" class="button_Search">찾기</label>
						<input type="file" id="file">
					</form>
				</div>
				<div style="margin-top :5px;">* 첨부파일 용량은 10MB로 제한합니다</div>
				<div class="row1">
					<button type="button" class="button_Cancel">취소</button>
					<button type="button" class="button_Complete">확인</button>
				</div>
			</div>
		</div>
	</div>
	<a class="closeBtn">
		창닫기
		<i class="fa fa-times"></i>
	</a>
</section>





</html>
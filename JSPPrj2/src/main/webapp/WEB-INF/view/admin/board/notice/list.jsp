<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <!-- JSTL위한 라이브러리 불러오기 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>

<html>

<head>
	<title>코딩 전문가를 만들기 위한 온라인 강의 시스템</title>
	<meta charset="UTF-8">
	<title>공지사항목록</title>

	<link href="/css/customer/layout.css" type="text/css" rel="stylesheet" />
	<style>
		#visual .content-container {
			height: inherit;
			display: flex;
			align-items: center;

			background: url("/images/mypage/visual.png") no-repeat center;
		}
	</style>
</head>

<body>

	
	<!-- header 부분 -->

	<header id="header">

		<div class="content-container">
			<!-- ---------------------------<header>--------------------------------------- -->

			<h1 id="logo">
				<a href="/index.html">
					<img src="/images/logo.png" alt="뉴렉처 온라인" />

				</a>
			</h1>

			<section>
				<h1 class="hidden">헤더</h1>

				<nav id="main-menu">
					<h1>메인메뉴</h1>
					<ul>
						<li><a href="/guide">학습가이드</a></li>

						<li><a href="/course">강좌선택</a></li>
						<li><a href="/answeris/index">AnswerIs</a></li>
					</ul>
				</nav>

				<div class="sub-menu">

					<section id="search-form">
						<h1>강좌검색 폼</h1>
						<form action="/course">
							<fieldset>
								<legend>과정검색필드</legend>
								<label>과정검색</label>
								<input type="text" name="q" value="" />
								<input type="submit" value="검색" />
							</fieldset>
						</form>
					</section>

					<nav id="acount-menu">
						<h1 class="hidden">회원메뉴</h1>
						<ul>
							<li><a href="/index.html">HOME</a></li>
							<li><a href="/member/login.html">로그인</a></li>
							<li><a href="/member/agree.html">회원가입</a></li>
						</ul>
					</nav>

					<nav id="member-menu" class="linear-layout">
						<h1 class="hidden">고객메뉴</h1>
						<ul class="linear-layout">
							<li><a href="/member/home"><img src="/images/txt-mypage.png" alt="마이페이지" /></a></li>
							<li><a href="/notice/list.html"><img src="/images/txt-customer.png" alt="고객센터" /></a></li>
						</ul>
					</nav>

				</div>
			</section>

		</div>

	</header>

	<!-- --------------------------- <visual> --------------------------------------- -->
	<!-- visual 부분 -->

	<div id="visual">
		<div class="content-container"></div>
	</div>
	<!-- --------------------------- <body> --------------------------------------- -->
	<div id="body">
		<div class="content-container clearfix">

			<!-- --------------------------- aside --------------------------------------- -->
			<!-- aside 부분 -->


			<aside class="aside">
				<h1>ADMIN PAGE</h1>

				<nav class="menu text-menu first margin-top">
					<h1>마이페이지</h1>
					<ul>
						<li><a href="/admin/index.html">관리자홈</a></li>
						<li><a href="/teacher/index.html">선생님페이지</a></li>
						<li><a href="/student/index.html">수강생페이지</a></li>
					</ul>
				</nav>

				<nav class="menu text-menu">
					<h1>알림관리</h1>
					<ul>
						<li><a href="/admin/board/notice/list.html">공지사항</a></li>
					</ul>
				</nav>

			</aside>
			<!-- --------------------------- main --------------------------------------- -->



			<main class="main">
				<h2 class="main title">공지사항</h2>

				<div class="breadcrumb">
					<h3 class="hidden">경로</h3>
					<ul>
						<li>home</li>
						<li>고객센터</li>
						<li>공지사항</li>
					</ul>
				</div>

				<div class="search-form margin-top first align-right">
					<h3 class="hidden">공지사항 검색폼</h3>
					<form class="table-form">
						<fieldset>
							<legend class="hidden">공지사항 검색 필드</legend>
							<label class="hidden">검색분류</label>
							<select name="f">
								<option value="title">제목</option>
								<option value="writerId">작성자</option>
							</select>
							<label class="hidden">검색어</label>
							<input type="text" name="q" value="" />
							<input class="btn btn-search" type="submit" value="검색" />
						</fieldset>
					</form>
				</div>
				
				
				<form action="list" method="post">
					<div class="notice margin-top">
						<h3 class="hidden">공지사항 목록</h3>
						<table class="table">
							<thead>
								<tr>
									<th class="w60">번호</th>
									<th class="expand">제목</th>
									<th class="w100">작성자</th>
									<th class="w100">작성일</th>
									<th class="w60">조회수</th>
									<th class="w40">공개</th>
									<th class="w40">삭제</th>
								</tr>
							</thead>
							<tbody>
	
	
							<c:forEach var="notice" items="${list}" begin="0" end="9">
								<!-- 반복문을 돌면서 pub이 true인경우 checked 옵션을 넣어 보이게함 -->
								<c:set var="open" value=""/>
								<c:if test="${notice.pub == true}">
									<c:set var="open" value="checked"/>
								</c:if>
							<tr>
								<td>${notice.id}</td>
								<td class="title indent text-align-left"><a href="detail?id=${notice.id}">${notice.title}</a><span style="color:red;">[${notice.cmtCount}]</span></td>
								<td>${notice.memberId}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.regdate}" /></td>
								<td><fmt:formatNumber type="number" pattern=",###" value="${notice.hit}"/></td>
								<!-- 체크 박스에 공개하고자 하는 게시물의 값들을 전달 value="" -->
								<!-- summit button을 눌러야지 전달됨 (따라서 포함되는 태그 전부에 form태그로 묶어야함) -->
								
								<td><input type="checkbox" name="open-id" ${open } value="${notice.id }"></td>
								<td><input type="checkbox" name="del-id" value="${notice.id }"></td>
							</tr>
							</c:forEach>
	
							</tbody>
						</table>
					</div>
	
					<!-- 페이지번호 하이라이트시 요긴하게 쓰임 -->
		<c:set var="page" value="${(empty param.p) ? 1: param.p}"/>
		<c:set var="startNum" value ="${page - (page - 1) % 5 }"/>
		<!-- 마지막 번호는 데이터베이스에서 실제 레코드 수를 얻어와야 한다 -->
		<!-- count/10의 결과를 올림하고 올림한 값에서 .아래의 값은 버리고 정수를 만든다. -->
		<c:set var="lastNum" value ="${fn:substringBefore(Math.ceil(count/10), '.')}"/>
	
	
					<div class="indexer margin-top align-right">
						<h3 class="hidden">현재 페이지</h3>
																<!-- p값으로 표현 p 공백, 널이면 1페이지 표기 -->
						<div><span class="text-orange text-strong">${(empty param.p)? 1 : param.p}</span> / ${lastNum} pages</div>
					</div>
	
					<div class="text-align-right margin-top">
					<!-- 반복하게 될 놈으로 임시변수 하나 씀 -->
					<c:set var="ids" value=""/>
					<!-- ID 나열위해 반복문 이용 -->
					<c:forEach var="notice" items="${list}">
						<c:set var="ids" value="${ids} ${notice.id}"/>
					</c:forEach>
					<!-- 같이 전달 될 수 있는 ID 숨겨놓음 -->
						<input type="hidden" name="ids" value="${ids}"/>
						<input type="submit" class="btn-text btn-default" name="cmd" value="일괄공개">
						<input type="submit" class="btn-text btn-default" name="cmd" value="일괄삭제">
						<a class="btn-text btn-default" href="reg">글쓰기</a>				
					</div>
				</form>

				<div class="margin-top align-center pager">	
				
					<div>
					<c:if test="${startNum > 1}">
						<a class="btn btn-prev" href="?p=${startNum - 1}&f=${param.f }&q=${param.q}">이전</a>
					</c:if>
					
					<c:if test="${startNum <= 1}">
						<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
					</c:if>
						
					</div>
					
					<ul class="-list- center">
					<c:forEach var="i" begin="0" end="4">
					<c:if test="${startNum+i <= lastNum }">
											<!-- 현재 페이지와 동일한 페이지 목록의 번호는 주황색 처리 -->
						<li><a class="-text- ${(page == (i+startNum))? 'orange' : ''} bold" href="?p=${i+startNum}&f=${param.f }&q=${param.q}" > ${i+startNum} </a></li>
					</c:if>
					</c:forEach>
					</ul>
				
					<div>
					<!-- 위의 i의 가장 큰 값보다 하나 더 큰값을 주어야 다음페이지로 넘어가짐 -->
					<c:if test="${5+startNum <= lastNum}">
						<a class="btn btn-next" href="?p=${5+startNum}&f=&q=">다음</a>
					</c:if>
					<c:if test="${5+startNum > lastNum}">
						<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다.');">다음</span>
					</c:if>
						
					</div>
		
				</div>
			</main>


		</div>
	</div>

	<!-- ------------------- <footer> --------------------------------------- -->



	<footer id="footer">
		<div class="content-container">
			<h2 id="footer-logo"><img src="/images/logo-footer.png" alt="회사정보"></h2>

			<div id="company-info">
				<dl>
					<dt>주소:</dt>
					<dd>서울특별시 </dd>
					<dt>관리자메일:</dt>
					<dd>admin@newlecture.com</dd>
				</dl>
				<dl>
					<dt>사업자 등록번호:</dt>
					<dd>111-11-11111</dd>
					<dt>통신 판매업:</dt>
					<dd>신고제 1111 호</dd>
				</dl>
				<dl>
					<dt>상호:</dt>
					<dd>뉴렉처</dd>
					<dt>대표:</dt>
					<dd>홍길동</dd>
					<dt>전화번호:</dt>
					<dd>111-1111-1111</dd>
				</dl>
				<div id="copyright" class="margin-top">Copyright ⓒ newlecture.com 2012-2014 All Right Reserved.
					Contact admin@newlecture.com for more information</div>
			</div>
		</div>
	</footer>
</body>

</html>
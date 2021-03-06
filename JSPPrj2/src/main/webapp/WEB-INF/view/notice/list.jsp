<%@page import="java.util.List"%>
<%@page import="com.hoseok.web.entity.Notice"%>
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
    
        #visual .content-container{	
            height:inherit;
            display:flex; 
            align-items: center;
            
            background: url("../../images/customer/visual.png") no-repeat center;
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
				<h1>고객센터</h1>

				<nav class="menu text-menu first margin-top">
					<h1>고객센터메뉴</h1>
					<ul>
						<li><a class="current"  href="/customer/notice">공지사항</a></li>
						<li><a class=""  href="/customer/faq">자주하는 질문</a></li>
						<li><a class="" href="/customer/question">수강문의</a></li>
						<li><a class="" href="/customer/event">이벤트</a></li>
						
					</ul>
				</nav>


	<nav class="menu">
		<h1>협력업체</h1>
		<ul>
			<li><a target="_blank" href="http://www.notepubs.com"><img src="/images/notepubs.png" alt="노트펍스" /></a></li>
			<li><a target="_blank" href="http://www.namoolab.com"><img src="/images/namoolab.png" alt="나무랩연구소" /></a></li>
						
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
				<!-- action은 default가 submit한 페이지, method는 default가 get방식 -->
				<form class="table-form" action="list" method="get">
					<fieldset>
						<legend class="hidden">공지사항 검색 필드</legend>
						<label class="hidden">검색분류</label>
						<select name="f">
							<option ${(param.f == "title")? "selected": "" } value="title">제목</option>
							<option ${(param.f == "memberId")? "selected": "" } value="memberId">작성자</option>
						</select> 
						<label class="hidden">검색어</label>
						<input type="text" name="q" value="${param.q}"/>
						<!-- 버튼을 누르면 list?f=field&q=INPUT -->
						<input class="btn btn-search" type="submit" value="검색" />
					</fieldset>
				</form>
			</div>
			
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
						</tr>
					</thead>
					<tbody>
					
						<!-- 자바 코드블록을 없애고 대신할 수 있는 무엇인가 대체 필요 -->
						
						<!-- List를 지역변수로 둬야 for each문을 돌릴 수 있다. -->
						<!-- 지역변수로 두었기 때문에 EL 키워드는 사용할 수 없다 왜? 저장소가 아니므로 -->
						<!-- EL을 쓰기위해 이 페이지내에서 쓰이는 pageContext에 담음 -->
						<%-- <% 
						List<Notice> list = (List<Notice>)request.getAttribute("list");
						for (Notice notice : list) {
							pageContext.setAttribute("notice", notice);
						%> --%>
						
						<!-- 위 주석처리 코드의 역할을 아래 태그에서 해준다 -->
						<c:forEach var="notice" items="${list}" begin="0" end="9">
						<tr>
							<td>${notice.id}</td>
							<td class="title indent text-align-left"><a href="detail?id=${notice.id}">${notice.title}</a><span style="color:red;">[${notice.cmtCount}]</span></td>
							<td>${notice.memberId}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.regdate}" /></td>
							<td><fmt:formatNumber type="number" pattern=",###" value="${notice.hit}"/></td>
						</tr>
						</c:forEach>
						<%-- <%
						}
						%> --%>				
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
    
    

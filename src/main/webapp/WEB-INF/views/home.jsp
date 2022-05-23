<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>mountshop12</title>
	
	<style>
	
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		a { color:#05f; text-decoration:none; }
		a:hover { text-decoration:underline; }
		
		h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		ul, lo, li { margin:0; padding:0; list-style:none; }
	
		/* ---------- */
		
		div#root { width:900px; margin:0 auto; }
		header#header {}
		nav#nav {}
		section#container { }
			section#content { float:right; width:700px; }
			aside#aside { float:left; width:180px; }
			section#container::after { content:""; display:block; clear:both; }	
		footer#footer { background:#eee; padding:20px; }
		
		/* ---------- */
		
		header#header div#header_box { text-align:center; padding:30px 0; }
		header#header div#header_box h1 { font-size:50px; }
		header#header div#header_box h1 a { color:#000; }
		
		nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
		nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
		nav#nav div#nav_box li a { color:#333; }
		
		section#container { }
		
		aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
		aside#aside li { font-size:16px; text-align:center; }
		aside#aside li a { color:#000; display:block; padding:10px 0; }
		aside#aside li a:hover { text-decoration:none; background:#eee; }
		
		aside#aside li { position:relative; }
		aside#aside li:hover { background:#eee; } 		
		aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
		aside#aside li:hover > ul.low { display:block; }
		aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
		aside#aside li:hover > ul.low li a:hover { background:#fff;}
		aside#aside li > ul.low li { width:180px; }
		
		footer#footer { margin-top:100px; border-radius:50px 50px 0 0; }
		footer#footer div#footer_box { padding:0 20px; }
		
	</style>
	
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<h1 class="title">
				<a href="./">MOUNTSHOP</a>
			</h1>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<ul>
			<c:if test="${member == null}">
				<li>
					<a href="member/signin">로그인</a>
				</li>
				<li>
					<a href="member/signup">회원가입</a>
				</li>
			</c:if>
			<c:if test="${member != null}">

			<c:if test="${member.verify == 9}">
			<li>
				<a href="admin/index">관리자 화면</a>	
			</li>	
			</c:if>
				<li>
					${member.userName}님 환영합니다.
				</li>
				<li>
					<a href="chatView">채팅방</a>
				</li>
				<li>
					<a href="shop/cartList">카트 리스트</a>
				</li>
				<li>
					<a href="shop/orderList">주문 리스트</a>
				</li>
				<li>
					<a href="member/signout">로그아웃</a>
				</li>
			</c:if>
			</ul>
		</div>
	</nav>
	
	<section id="container">
		<div id="container_box">
		
			<section id="content">
				본문 영역
			</section>

				<aside id="aside">
					<h3>카테고리</h3>

					<ul>
						<li><a href="shop/list?c=100&l=1">등산</a>

							<ul class="low">
								<li><a href="shop/list?c=101&l=2">등산화</a></li>
								<li><a href="shop/list?c=102&l=2">등산복 상의</a></li>
								<li><a href="shop/list?c=103&l=2">등산복 하의</a></li>
								<li><a href="shop/list?c=104&l=2">등산스틱</a></li>
								<li><a href="shop/list?c=105&l=2">등산용품</a></li>
								<li><a href="shop/list?c=106&l=2">등산배낭</a></li>
								<li><a href="shop/list?c=107&l=2">기타</a></li>
							</ul>
							
						</li>
						
						<li><a href="shop/list?c=200&l=1">캠핑</a>

							<ul class="low">
								<li><a href="shop/list?c=201&l=2">텐트</a></li>
								<li><a href="shop/list?c=202&l=2">침낭</a></li>
								<li><a href="shop/list?c=203&l=2">랜턴</a></li>
								<li><a href="shop/list?c=204&l=2">캠핑기구</a></li>
								<li><a href="shop/list?c=205&l=2">기타</a></li>
							</ul>
							
						</li>
						
						<li><a href="shop/list?c=300&l=1">낚시</a>

							<ul class="low">
								<li><a href="shop/list?c=301&l=2">낚시대</a></li>
								<li><a href="shop/list?c=302&l=2">낚시장비</a></li>
								<li><a href="shop/list?c=303&l=2">낚시줄</a></li>
								<li><a href="shop/list?c=304&l=2">미끼</a></li>
								<li><a href="shop/list?c=305&l=2">그물</a></li>								
								<li><a href="shop/list?c=306&l=2">기타</a></li>
							</ul>
							
						</li>
						
						<li><a href="shop/list?c=400&l=1">기타용품</a>

							<ul class="low">
								<li><a href="shop/list?c=401&l=2">구급상자</a></li>
								<li><a href="shop/list?c=402&l=2">일회용품</a></li>
								<li><a href="shop/list?c=403&l=2">놀이용품</a></li>
								<li><a href="shop/list?c=404&l=2">기타</a></li>		
							</ul>
							
						</li>		
																						
					</ul>
				</aside>
			</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<ul>
				<li>사이트 소개</li>
				<li>이용약관</li>
				<li>mountshop</li>
			</ul>
		</div>		
	</footer>

</div>
</body>
</html>
</html>

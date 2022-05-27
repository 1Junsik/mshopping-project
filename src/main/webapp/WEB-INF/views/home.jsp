<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>Moschino | Minimalist Free HTML Portfolio by WowThemes.net</title>
<link rel='stylesheet' href='./resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='./resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<h1 class="site-title"><a href="./" rel="home">Mountshop</a></h1>
			<h2 class="site-description">오늘도 즐거운 하루 되세요 :)</h2>
		</div>
		<nav id="site-navigation" class="main-navigation">
		<button class="menu-toggle">Menu</button>
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
		<div class="menu-menu-1-container">
			<ul id="menu-menu-1" class="menu">
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
	
<!-- 				<li><a href="#">카테고리</a>
				<ul class="sub-menu">
					<li><a href="portfolio-item.html">Portfolio Item</a></li>
					<li><a href="blog-single.html">Blog Article</a></li>
					<li><a href="shop-single.html">Shop Item</a></li>
					<li><a href="portfolio-category.html">Portfolio Category</a></li>
				</ul>
				</li>
				<li><a href="contact.html">Contact</a></li> -->
			</ul> 
		</div>
		</nav>
		</header>
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main">
				<div class="grid portfoliogrid">
				
					<article class="hentry">
					<header class="entry-header">
					<div class="entry-thumbnail">
						<a href="shop/list?c=100&l=1"><img src="https://allways.smotor.com/wp-content/uploads/2020/04/0429_%EB%93%B1%EC%82%B0_%EC%8D%B8%EB%84%A4%EC%9D%BC.jpg" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="p1"/></a>
					</div>
					<h2 class="entry-title"><a href="shop/list?c=100&l=1" rel="bookmark">Hiking</a></h2>
					<a class='portfoliotype' href='shop/list?c=101&l=2'>등산화</a>
					<a class='portfoliotype' href='shop/list?c=102&l=2'>등산복 상의</a>
					<a class='portfoliotype' href='shop/list?c=103&l=2'>등산복 하의</a>
					<a class='portfoliotype' href='shop/list?c=104&l=2'>등산스틱</a>
					<a class='portfoliotype' href='shop/list?c=105&l=2'>등산용품</a>
					<a class='portfoliotype' href='shop/list?c=106&l=2'>등산배낭</a>
					<a class='portfoliotype' href='shop/list?c=107&l=2'>기타</a>
					</header>
					</article>
					
					<article class="hentry">
					<header class="entry-header">
					<div class="entry-thumbnail">
						<a href="shop/list?c=200&l=1"><img src="https://hng.yna.co.kr/media/content/7528/1627820427914607.jpg" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="p1"/></a>
					</div>
					<h2 class="entry-title"><a href="shop/list?c=200&l=1" rel="bookmark">Camping</a></h2>
					<a class='portfoliotype' href='shop/list?c=201&l=2'>텐트</a>
					<a class='portfoliotype' href='shop/list?c=202&l=2'>침낭</a>
					<a class='portfoliotype' href='shop/list?c=203&l=2'>랜턴</a>
					<a class='portfoliotype' href='shop/list?c=204&l=2'>캠핑기구</a>
					<a class='portfoliotype' href='shop/list?c=205&l=2'>기타</a>
					</header>
					</article>
				
					
					<article class="hentry">
					<header class="entry-header">
					<div class="entry-thumbnail">
						<a href="shop/list?c=300&l=1"><img src="https://www.collinsdictionary.com/images/full/fishing_459296251_1000.jpg" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="p1"/></a>
					</div>
					<h2 class="entry-title"><a href="shop/list?c=300&l=1" rel="bookmark">Fishing</a></h2>
					<a class='portfoliotype' href='shop/list?c=301&l=2'>낚시대</a>
					<a class='portfoliotype' href='shop/list?c=302&l=2'>낚시장비</a>
					<a class='portfoliotype' href='shop/list?c=303&l=2'>낚시줄</a>
					<a class='portfoliotype' href='shop/list?c=304&l=2'>미끼</a>
					<a class='portfoliotype' href='shop/list?c=305&l=2'>그물</a>
					<a class='portfoliotype' href='shop/list?c=306&l=2'>기타</a>
					</header>
					</article>
					
					<article class="hentry">
					<header class="entry-header">
					<div class="entry-thumbnail">
						<a href="shop/list?c=400&l=1"><img src="https://t1.daumcdn.net/cfile/blog/173BE93E4F22814B0F" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="p1"/></a>
					</div>
					<h2 class="entry-title"><a href="shop/list?c=400&l=1" rel="bookmark">ETC</a></h2>
					<a class='portfoliotype' href='shop/list?c=401&l=2'>구급상자</a>
					<a class='portfoliotype' href='shop/list?c=402&l=2'>일회용품</a>
					<a class='portfoliotype' href='shop/list?c=403&l=2'>놀이용품</a>
					<a class='portfoliotype' href='shop/list?c=404&l=2'>기타</a>
					</header>
					</article>
			
				</div>
				
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
	</div>
	<!-- .container -->
	<footer id="colophon" class="site-footer">
	<div class="container">
		<div class="site-info">
			<h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Mountshop</h1>
			<i class="fa fa-love"></i><a href="intro">사이트 소개</a><br><a href="https://bootstrapthemes.co">이용약관</a>

		</div>
	</div>	
	</footer>
	<a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a>
</div>
<!-- #page -->
<script src='./resources/js/jquery.js'></script>
<script src='./resources/js/plugins.js'></script>
<script src='./resources/js/scripts.js'></script>
<script src='./resources/js/masonry.pkgd.min.js'></script>
</body>
</html>
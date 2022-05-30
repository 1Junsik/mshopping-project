<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>Moschino | Minimalist Free HTML Portfolio by WowThemes.net</title>
<link rel='stylesheet' href='../resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='../resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<style>
				
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		
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
	
	
<style>
/*
	section#content ul li { display:inline-block; margin:10px; }
	section#content div.goodsThumb img { width:200px; height:200px; }
	section#content div.goodsName { padding:10px 0; text-align:center; }
	section#content div.goodsName a { color:#000; }
*/
	section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
	section#content .orderList span { font-size:20px; color:black; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
	.orderList div div { text-align:right; padding:10px; }
	.orderList div div button { border:2px solid #999; background:#fff; }
</style>

</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<h1 class="site-title"><a href="../" rel="home">Mountshop</a></h1>
			<h2 class="site-description">오늘도 즐거운 하루 되세요 :)</h2>
		</div>
		<nav id="site-navigation" class="main-navigation">
		<button class="menu-toggle">Menu</button>
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
		<div class="menu-menu-1-container">
			<ul id="menu-menu-1" class="menu">
				<c:if test="${member == null}">
					<li>
						<a href="../member/signin">로그인</a>
					</li>
					<li>
						<a href="../member/signup">회원가입</a>
					</li>
				</c:if>
							<c:if test="${member != null}">

				<c:if test="${member.verify == 9}">
				<li>
					<a href="../admin/index">관리자 화면</a>	
				</li>	
				</c:if>
					<li>
						${member.userName}님 환영합니다.
					</li>
					<li>
						<a href="../chatView">채팅방</a>
					</li>
					<li>
						<a href="../shop/cartList">카트 리스트</a>
					</li>
					<li>
						<a href="../shop/orderList">주문 리스트</a>
					</li>
					<li>
						<a href="../member/signout">로그아웃</a>
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
			<div id="primary" class="content-area column full" style="display:flex; justify-content: center;">
				<main id="main" class="site-main">
				<div class="grid portfoliogrid">
				
			<section id="content">
				
				<ul class="orderList">
					<c:forEach items="${orderList}" var="orderList">
					<li>
					<div>
						<p><span>주문번호</span><a href="orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
						<p><span>수령인</span>${orderList.orderRec}</p>
						<p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
						<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
						<p><span>상태</span>${orderList.delivery}</p>
						<c:if test="${orderList.delivery == '배송 완료'}">
							<div>
								<form action="orderList" method="post">
									<input type="hidden" name="orderId" value="${orderList.orderId}" />
									<button type="submit" class="delete_${orderList.orderId}_btn">삭제</button>
								</form>
							</div>
						</c:if>
					</div>
					</li>
					</c:forEach>
				</ul>
			
			</section>
			
				</div>
				
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
	</div>
	
	<!-- 페이지 이동 부분 -->
	<div style="font-size: 20px; display:flex; justify-content:center;">                      
		<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
			<c:if test="${counter == navi.currentPage}"><b></c:if>
				<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
			<c:if test="${counter == navi.currentPage}"></b></c:if>
		</c:forEach>
		&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
		<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>

	<!-- /페이지 이동 끝 -->                      
	</div>
		<br><br>
		
	<form id="pagingForm" method="get" action="orderList">
		<input type="hidden" name="pages" id="pages"/>
	</form>
	<!-- .container -->
	<footer id="colophon" class="site-footer">
	<div class="container">
		<div class="site-info">
			<h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Mountshop</h1>
			<i class="fa fa-love"></i><a href="https://bootstrapthemes.co">사이트 소개</a><br><a href="https://bootstrapthemes.co">이용약관</a>

		</div>
	</div>	
	</footer>
	<a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a>
</div>
<!-- #page -->
<script src='../resources/js/jquery.js'></script>
<script src='../resources/js/plugins.js'></script>
<script src='../resources/js/scripts.js'></script>
<script src='../resources/js/masonry.pkgd.min.js'></script>

<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('pages');
	page.value = currentPage;
	form.submit();
}
</script>

</body>
</html>

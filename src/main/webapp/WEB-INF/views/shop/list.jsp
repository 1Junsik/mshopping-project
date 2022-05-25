<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Moschino | Minimalist Free HTML Portfolio by WowThemes.net</title>
<link rel='stylesheet' href='../resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='../resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

</head>
<body
	class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
	<script src="../resources/jquery/jquery-3.3.1.min.js"></script>
	<div id="page">
		<div class="container">
			<header id="masthead" class="site-header">
				<div class="site-branding">
					<h1 class="site-title">
						<a href="../" rel="home">Mountshop</a>
					</h1>
					<h2 class="site-description">Minimalist Portfolio HTML
						Template</h2>
				</div>
				<nav id="site-navigation" class="main-navigation">
					<button class="menu-toggle">Menu</button>
					<a class="skip-link screen-reader-text" href="#content">Skip to
						content</a>
					<div class="menu-menu-1-container">
						<ul id="menu-menu-1" class="menu">
							<c:if test="${member == null}">
								<li><a href="../member/signin">로그인</a></li>
								<li><a href="../member/signup">회원가입</a></li>
							</c:if>
							<c:if test="${member != null}">

								<c:if test="${member.verify == 9}">
									<li><a href="../admin/index">관리자 화면</a></li>
								</c:if>
								<li>${member.userName}님 환영합니다.</li>
								<li><a href="../chatView">채팅방</a></li>
								<li><a href="../shop/cartList">카트 리스트</a></li>
								<li><a href="../shop/orderList">주문 리스트</a></li>
								<li><a href="../member/signout">로그아웃</a></li>
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
					<main id="main" class="site-main" role="main">
						<p class="woocommerce-result-count">Showing 1–8 of 12 results
						</p>
						<form class="woocommerce-ordering" method="get">
							<select name="orderby" class="orderby">
								<option value="menu_order" selected="selected">기본 정렬</option>
								<option value="popularity">Sort by popularity</option>
								<option value="rating">Sort by average rating</option>
								<option value="date">Sort by newness</option>
								<option value="price">Sort by price: low to high</option>
								<option value="price-desc">Sort by price: high to low</option>
							</select>
						</form>
						<ul class="products">
							<c:forEach items="${list}" var="list" varStatus="status">
								<c:if test="${status.index % 4 == 0}">
									<li class="first product">
								</c:if>
								<c:if test="${status.index % 4 == 1}">
									<li class="product">
								</c:if>
								<c:if test="${status.index % 4 == 2}">
									<li class="product">
								</c:if>
								<c:if test="${status.index % 4 == 3}">
									<li class="last product">
								</c:if>
								

								<a href="view?n=${list.gdsNum}"> <img src="${pageContext.request.contextPath}${list.gdsThumbImg}">
									<h3>${list.gdsName}</h3> <span class="price"><span class="amount"><fmt:formatNumber pattern="###,###,###">${list.gdsPrice}</fmt:formatNumber>￦</span></span>
								</a>
								
								</li>
							</c:forEach>
						</ul>
						<nav class="woocommerce-pagination">
							<ul class="page-numbers">
								<li><span class="page-numbers current">1</span></li>
								<li><a class="page-numbers" href="#">2</a></li>
								<li><a class="next page-numbers" href="#">→</a></li>
							</ul>
						</nav>
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
					<h1
						style="font-family: 'Herr Von Muellerhoff'; color: #ccc; font-weight: 300; text-align: center; margin-bottom: 0; margin-top: 0; line-height: 1.4; font-size: 46px;">Moschino</h1>
					Shared by <i class="fa fa-love"></i><a
						href="https://bootstrapthemes.co">BootstrapThemes</a>

				</div>
			</div>
		</footer>
		<a href="#top" class="smoothup" title="Back to top"><span
			class="genericon genericon-collapse"></span></a>
	</div>
	<!-- #page -->
	<script src='../resources/js/jquery.js'></script>
	<script src='../resources/js/plugins.js'></script>
	<script src='../resources/js/scripts.js'></script>
	<script src='../resources/js/masonry.pkgd.min.js'></script>
	
</body>
</html>
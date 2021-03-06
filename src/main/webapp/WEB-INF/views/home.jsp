<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>Sankai</title>
<link rel='stylesheet' href='./resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='./resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>


<style>
/* body {
  background-color: #eaeaea;
} */


.input-area {
	display: flex;
	justify-content: center;
	margin-top: 1.5em;
}

.input-box {
  width: 50em;
  height: 46px;
  border-radius: 24px;
  border: 1px solid #dfe1e5;
  padding-left: 40px;
   padding-right: 40px;
}

input[type="submit"] {
  background: black;
  width: 10%;
}


a.portfoliotype {
font-family: 'Dongle', sans-serif;
font-style: normal;
font-size: 25px;
}
</style>

<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap');
</style>

</head>

<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
<div id="page">

	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<h1 class="site-title"><a href="./" rel="home">Sankai</a></h1>
			<c:if test="${member == null}"><h2 class="site-description">????????? ????????? ?????? ????????? :)</h2></c:if>
			<c:if test="${member != null}"><h2 class="site-description">${member.userName}??? ???????????????.</h2></c:if>
			
		</div>

		<nav id="site-navigation" class="main-navigation">
		<button class="menu-toggle">Menu</button>
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
		<div class="menu-menu-1-container">
			<ul id="menu-menu-1" class="menu">
				<c:if test="${member == null}">
					<li>
						<a href="member/signin">?????????</a>
					</li>
					<li>
						<a href="member/signup">????????????</a>
					</li>
				</c:if>
				<c:if test="${member != null}">
					<c:if test="${member.verify == 9}">
					<li>
						<a href="admin/index">????????? ??????</a>	
					</li>	
					</c:if>
					<li>
						<a href="chatView">?????????</a>
					</li>
					<li>
						<a href="shop/cartList">????????????</a>
					</li>
					<li>
						<a href="shop/orderList">????????????</a>
					</li>
					<li>
						<a href="member/signout">????????????</a>
					</li>
				</c:if>
	
<!-- 				<li><a href="#">????????????</a>
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
		
   		
   			<form action="shop/allList" method="get">
   				<div class="input-area">
        			<input type="text" name="t" class="input-box" placeholder="???????????? ??????????????????."/>
        			<input type="submit" value="??????" class="button-box"></input>  
        		</div>			
   			</form>
   		
	
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
					<a class='portfoliotype' href='shop/list?c=101&l=2'>?????????</a>
					<a class='portfoliotype' href='shop/list?c=102&l=2'>????????? ??????</a>
					<a class='portfoliotype' href='shop/list?c=103&l=2'>????????? ??????</a>
					<a class='portfoliotype' href='shop/list?c=104&l=2'>????????????</a>
					<a class='portfoliotype' href='shop/list?c=105&l=2'>????????????</a>
					<a class='portfoliotype' href='shop/list?c=106&l=2'>????????????</a>
					<a class='portfoliotype' href='shop/list?c=107&l=2'>??????</a>
					</header>
					</article>
					
					<article class="hentry">
					<header class="entry-header">
					<div class="entry-thumbnail">
						<a href="shop/list?c=200&l=1"><img src="https://hng.yna.co.kr/media/content/7528/1627820427914607.jpg" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="p1"/></a>
					</div>
					<h2 class="entry-title"><a href="shop/list?c=200&l=1" rel="bookmark">Camping</a></h2>
					<a class='portfoliotype' href='shop/list?c=201&l=2'>??????</a>
					<a class='portfoliotype' href='shop/list?c=202&l=2'>??????</a>
					<a class='portfoliotype' href='shop/list?c=203&l=2'>??????</a>
					<a class='portfoliotype' href='shop/list?c=204&l=2'>????????????</a>
					<a class='portfoliotype' href='shop/list?c=205&l=2'>??????</a>
					</header>
					</article>
				
					
					<article class="hentry">
					<header class="entry-header">
					<div class="entry-thumbnail">
						<a href="shop/list?c=300&l=1"><img src="https://www.collinsdictionary.com/images/full/fishing_459296251_1000.jpg" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="p1"/></a>
					</div>
					<h2 class="entry-title"><a href="shop/list?c=300&l=1" rel="bookmark">Fishing</a></h2>
					<a class='portfoliotype' href='shop/list?c=301&l=2'>?????????</a>
					<a class='portfoliotype' href='shop/list?c=302&l=2'>????????????</a>
					<a class='portfoliotype' href='shop/list?c=303&l=2'>?????????</a>
					<a class='portfoliotype' href='shop/list?c=304&l=2'>??????</a>
					<a class='portfoliotype' href='shop/list?c=305&l=2'>??????</a>
					<a class='portfoliotype' href='shop/list?c=306&l=2'>??????</a>
					</header>
					</article>
					
					<article class="hentry">
					<header class="entry-header">
					<div class="entry-thumbnail">
						<a href="shop/list?c=400&l=1"><img src="https://t1.daumcdn.net/cfile/blog/173BE93E4F22814B0F" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="p1"/></a>
					</div>
					<h2 class="entry-title"><a href="shop/list?c=400&l=1" rel="bookmark">ETC</a></h2>
					<a class='portfoliotype' href='shop/list?c=401&l=2'>????????????</a>
					<a class='portfoliotype' href='shop/list?c=402&l=2'>????????????</a>
					<a class='portfoliotype' href='shop/list?c=403&l=2'>????????????</a>
					<a class='portfoliotype' href='shop/list?c=404&l=2'>??????</a>
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
			<h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Sankai</h1>
			<i class="fa fa-love"></i><a href="intro">????????? ??????</a><br><a href="https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EA%B0%9C%EC%9D%B8%EC%A0%95%EB%B3%B4%EB%B3%B4%ED%98%B8%EB%B2%95">????????????</a>

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
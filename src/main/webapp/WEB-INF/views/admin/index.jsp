<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>MOUNTSHOP Admin</title> 
	
	<script src="../resources/jquery/jquery-3.3.1.min.js"></script>

	<link rel="stylesheet" href="../resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="../resources/bootstrap/bootstrap-theme.min.css">
	<link rel='stylesheet' href='../resources/css/woocommerce-layout.css' type='text/css' media='all'/>
	<link rel='stylesheet' href='../resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
	<link rel='stylesheet' href='../resources/css/woocommerce.css' type='text/css' media='all'/>
	<link rel='stylesheet' href='../resources/css/font-awesome.min.css' type='text/css' media='all'/>
	<link rel='stylesheet' href='../resources/style.css' type='text/css' media='all'/>
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
	<link rel='stylesheet' href='../resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
	<script src="../resources/bootstrap/bootstrap.min.js"></script>

<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 	section#container { padding:100px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<h1 class="title">
				<a href="index">MOUNTSHOP Admin</a>
			</h1>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<ul>
			<c:if test="${member != null}">
				<li>
					<a href="../">일반 화면</a>	
				</li>
				<li>
					<a href="../member/signout">로그아웃</a>
				</li>
			</c:if>
			</ul>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<ul>
				<li><a href="goods/register">상품 등록</a></li>
				<li><a href="goods/list">상품 목록</a></li>
				<li><a href="shop/orderList">주문 목록</a></li>
	
				<li><a href="shop/allReply">상품 소감</a></li>
	
				<li><a href="">유저 목록</a></li>
			</ul>
		</aside>
		<div id="container_box" style="font-size:30px;">
			관리자님 ! 오늘도 좋은 하루 되세요 :)
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

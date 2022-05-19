<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>kubg Admin</title>
	
<script src="../../resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="../../resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/bootstrap/bootstrap-theme.min.css">
<script src="../../resources/bootstrap/bootstrap.min.js"></script>
	
<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 		section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style>


<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }

.oriImg { width:500px; height:auto; }
.thumbImg {}

.gdsDes img { max-width:600px; height:auto; }

</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<h1 class="title">
				<a href="../index">MOUNTSHOP Admin</a>
			</h1>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<ul>
			<c:if test="${member != null}">
				<li>
					<a href="../../">일반 화면</a>	
				</li>
				<li>
					<a href="../../member/signout">로그아웃</a>
				</li>
			</c:if>
			</ul>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<ul>
				<li><a href="register">상품 등록</a></li>
				<li><a href="list">상품 목록</a></li>
				<li><a href="/admin/shop/orderList">주문 목록</a></li>
	
				<li><a href="/admin/shop/allReply">상품 소감</a></li>
	
				<li><a href="">유저 목록</a></li>
			</ul>
		</aside>
		<div id="container_box">
			<h2>상품 조회</h2>
			
			<form role="form" method="post" autocomplete="off">
			
			<input type="hidden" name="n" value="${goods.gdsNum}"/>
			
			<div class="inputArea">	
				<label>1차 분류</label>
				<span class="category1"></span>								
				<label>2차 분류</label>
				<span class="category2">${goods.cateCode}</span>
			</div>
			
			<div class="inputArea">
				<label for="gdsName">상품명</label>
				<span>${goods.gdsName}</span>
			</div>
			
			<div class="inputArea">
				<label for="gdsPrice">상품가격</label>
				<span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
			</div>
			
			<div class="inputArea">
				<label for="gdsStock">상품수량</label>
				<span>${goods.gdsStock}</span>
			</div>
			
			<div class="inputArea">
				<label for="gdsDes">상품소개</label>
				
				<!--  <span>${goods.gdsDes}</span>  -->
				
				<div class="gdsDes">${goods.gdsDes}</div>
				
			</div>
			
			<div class="inputArea">
				<label for="gdsImg">이미지</label>
				<p>원본 이미지</p>
				<img src="${pageContext.request.contextPath}${goods.gdsImg}" class="oriImg"/>
				
				<p>썸네일</p>
			 	<img src=" ${pageContext.request.contextPath}${goods.gdsThumbImg}" class="thumbImg"/>  
			</div>
			
			<div class="inputArea">
				<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
				<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
				
				<script>
					var formObj = $("form[role='form']");
					
					$("#modify_Btn").click(function(){
						formObj.attr("action", "modify");
						formObj.attr("method", "get")
						formObj.submit();
					});
					
					$("#delete_Btn").click(function(){
						
						var con = confirm("정말로 삭제하시겠습니까?");
						
						if(con) {						
							formObj.attr("action", "delete");
							formObj.submit();
						}
					});
				</script>
			</div>
			
			</form>
			
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
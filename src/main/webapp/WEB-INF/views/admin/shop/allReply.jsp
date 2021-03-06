<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>Sankai Admin</title>
	
<script src="../../resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="../../resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/bootstrap/bootstrap-theme.min.css">
<link rel='stylesheet' href='../../resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../../resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='../../resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../../resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../../resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='../../resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

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
</style>


<style>
/*
#container_box table { width:900px; } 
#container_box table th { font-size:20px; font-weight:bold;
							text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background:#eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
*/

#container_box ul li { margin-bottom:20px; border:10px solid #eee; }
.replyInfo { background:#eee; padding:10px; font-size:18px; }
.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
.replyContent { padding:10px; }

.replyControll {text-align:right; padding:10px; }
.replyControll button { border:2px solid #999; background:#fff; }
</style>


</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<h1 class="title">
				<a href="../index">Sankai Admin</a>
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
					<a href="../member/signout">로그아웃</a>
				</li>
			</c:if>
			</ul>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<ul>
				<li><a href="../goods/register">상품 등록</a></li>
				<li><a href="../goods/list">상품 목록</a></li>
				<li><a href="orderList">주문 목록</a></li>
	
				<li><a href="allReply">상품 소감</a></li>
			</ul>
		</aside>
		
		<form id="pagingForm" action="allReply" method="get">
   			<div class="input-area">
   				<input type="text" name="t" class="input-box" value="${searchText}" placeholder="작성자 검색"/>
        		<input type="hidden" name="pages" id="pages"/>
				<input type="button" onclick="pagingFormSubmit(1)" value="검색">
        	</div>			
   		</form>
   		
   		<br>
   		
		<div id="container_box">
		
		<ul>
			<c:forEach items="${reply}" var="reply">
			<li>
				<div class="replyInfo">
					<p>
						<span>작성자</span>${reply.userName} (${reply.userId})
					</p>
					
					<p>
						<span>작성된 상품</span> <a href="../../shop/view?n=${reply.gdsNum}">바로가기</a>
					</p>
				</div>
				
				<div class="replyContent">
					${reply.repCon}
				</div>
				
				<div class="replyControll">
				
					<form action="allReply" method="post">
					
						<input type="hidden" name="repNum" value="${reply.repNum}" />
						<button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
						   
					</form>
				
				</div>
			
			</li>					
			</c:forEach>
		</ul>
		</div>
	</section>
	
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

	<footer id="footer">
		<div id="footer_box">
			<ul>
				<li><a href="../../intro">사이트 소개</a></li>
				<li><a href="https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EA%B0%9C%EC%9D%B8%EC%A0%95%EB%B3%B4%EB%B3%B4%ED%98%B8%EB%B2%95">이용약관</a></li>
				<li><a href="../../">Sankai</a></li>
			</ul>
		</div>		
	</footer>
	
<script>
function pagingFormSubmit(currentPage) {
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('pages');
	page.value = currentPage;
	form.submit();
}
</script>

</div>
</body>
</html>
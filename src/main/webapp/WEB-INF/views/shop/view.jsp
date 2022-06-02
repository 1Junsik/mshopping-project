<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>Sankai</title>
	
	<script src="../resources/jquery/jquery-3.3.1.min.js"></script>
	<link rel='stylesheet' href='../resources/css/woocommerce-layout.css' type='text/css' media='all'/>
	<link rel='stylesheet' href='../resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
	<link rel='stylesheet' href='../resources/css/woocommerce.css' type='text/css' media='all'/>
	<link rel='stylesheet' href='../resources/css/font-awesome.min.css' type='text/css' media='all'/>
	<link rel='stylesheet' href='../resources/style.css' type='text/css' media='all'/>
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
	<link rel='stylesheet' href='../resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
	<!-- <link rel="stylesheet" href="../resources/css/user/shop/default.css" /> -->
	
 	<style>
		div.goods div.goodsImg { float:left; width:350px; }
		div.goods div.goodsImg img { width:350px; height:auto; }
		
		div.goods div.goodsInfo { float:right; width:330px; font-size:22px; }
		div.goods div.goodsInfo p { margin:0 0 20px 0; }
		div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-right:15px; } 
		
		cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
		cartStock button { font-size:26px; border:none; background:none; } 
		div.goods div.goodsInfo p.addToCart { text-align:right; }
		div.goods div.goodsInfo p.addToCart button { font-size:22px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		div.goods div.gdsDes { font-size:18px; clear:both; padding-top:30px; }
	</style>
	

	<style>
		section.replyForm { padding:30px 0; }
		section.replyForm div.input_area { margin:10px 0; }
		section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
		section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
		
		section.replyList { padding:30px 0; }
		section.replyList ol { padding:0; margin:0; }
		section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
		section.replyList div.userInfo { }
		section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
		section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
		section.replyList div.replyContent { padding:10px; margin:20px 0; }
		section.replyList div.replyFooter { margin-bottom:10px; }
		
		section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }
		
	</style>
	
	<style>
		div.replyModal { position:relative; z-index:1; display:none; }
		div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
		div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
		div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
		div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
		div.modalContent button.modal_cancel { margin-left:20px; }
	</style> 
	
		
<script>
function replyList() {
	
	var gdsNum = ${view.gdsNum};
	
	// 비동기식 데이터 요청
	$.getJSON("replyList" + "?n=" + gdsNum, function(data){
		var str = "";
		    
		$(data).each(function(){
			
			console.log(data);
			
			// 날짜 데이터를 보기 쉽게 변환
			var repDate = new Date(this.repDate);
			repDate = repDate.toLocaleDateString("ko-US")
							
			// HTML코드 조립
			str += "<li style='padding:10px 0; border-bottom:2px solid #eee; list-style:none;' data-repNum='" + this.repNum + "'>" //"<li data-gdsNum='" + this.gdsNum + "'>"
				 + "<div class='userInfo' style='font-size:24px; font-weight:bold;'>"
				 + "<span class='userName' style='color:black;'>" + this.userName + "</span>"
				 + "<span class='date' style='color:#999; display:inline-block; margin-left:10px;'>" + repDate + "</span>"
				 + "</div>"
				 + "<div class='replyContent' style='padding:10px; margin:20px 0;'>" + this.repCon + "</div>"
				 
				 + "<c:if test='${member != null}'>"
				 
				 + "<div class='replyFooter' style='margin-bottom:10px;'>"
				 + "<button type='button' style='font-size:14px; border: 1px solid #999; background:none; margin-right:10px;' class='modify' data-repNum='" + this.repNum + "'>M</button>"
				 + "<button type='button' style='font-size:14px; border: 1px solid #999; background:none; margin-right:10px;' class='delete' data-repNum='" + this.repNum + "'>D</button>"
				 + "</div>"
				 
				 + "</c:if>"
				 
				 + "</li>";											
		});
		
		// 조립한 HTML코드를 추가
		$("section.replyList ol").html(str);
	});
	
}
</script>
		
</head>
<body class="single single-product woocommerce woocommerce-page">
<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<h1 class="site-title"><a href="../" rel="home">Sankai</a></h1>
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
					<a href="../shop/cartList">장바구니</a>
				</li>
				<li>
					<a href="../shop/orderList">주문내역</a>
				</li>
				<li>
					<a href="../member/signout">로그아웃</a>
				</li>
			</c:if>
			</ul>
		</div>
		</nav>
		</header>
	
	<div id="content" class="site-content">
		<div id="primary" class="content-area column full">
			<main id="main" class="site-main" role="main">
			<div id="container">
				<div id="content" role="main">
				<nav class="woocommerce-breadcrumb" itemprop="breadcrumb"><a href="list?c=${view.cateCode}&l=2">${view.cateName}</a> / ${view.gdsName}</nav>
				<div itemscope itemtype="http://schema.org/Product" class="product">
				<form role="form" method="post">
					<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
				</form>
				
				<div class="images">
					<img src="${pageContext.request.contextPath}${view.gdsImg}">
				</div>
					
					<div class="summary entry-summary" style="border: 10px solid black; border-right: 50px dashed black; padding: 10px; margin-top:50px;">
						<h1 itemprop="name" class="product_title entry-title gdsName">${view.gdsName}</h1>
						<div class="woocommerce-product-rating" itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
							<p class="woocommerce-review-link">(<span itemprop="reviewCount" class="count">${count}</span>명의 리뷰)</p>
						</div>
						
						<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
							<p class="price">
								<span class="amount"><fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" /></span> ￦
							</p>
						</div>
						
						<div itemprop="description">
							<p>
								<span>재고 : </span><fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" /> EA
							</p>
						</div>
						
						<c:if test="${view.gdsStock != 0}">
						
						<p class="cartStock">
							<span>구입 수량</span>
							<button type="button" style="font-size:30px; border:none; background:none;" class="plus">+</button>
							<input type="number" style="font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee;" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
							<button type="button" style="font-size:40px; border:none; background:none;" class="minus">-</button>
							
							<input type="hidden" value="${view.gdsStock}" class="gdsStock_hidden" />
							
							<script src="../resources/js/user/shop/stockBtn.js"></script>
						</p>
					
						<p class="addToCart">
							<button type="button" class="single_add_to_cart_button button alt addCart_btn">카트에 담기</button>
							<script>
								$(".addCart_btn").click(function(){
									
									var gdsNum = $("#gdsNum").val();
									var cartStock = $(".numBox").val();
									
									var data = {
											gdsNum : gdsNum,
											cartStock : cartStock
											};
									
									$.ajax({
										url : "addCart",
										type : "post",
										data : data,
										success : function(result){
											
											if(result == 1) {
												alert("카트 담기 성공");
												$(".numBox").val("1");
											} else {
												alert("회원만 사용할 수 있습니다.")
												$(".numBox").val("1");
											}
										},
										error : function(){
											alert("카트 담기 실패");
										}
									});
								});
							</script>
						</p>
						
						</c:if>
						
						<c:if test="${view.gdsStock == 0}">
							<p>상품 수량이 부족합니다.</p>						
						</c:if>
						
						<div class="product_meta">
							<span class="posted_in">카테고리: 
								<a href="list?c=${view.cateCode}&l=2" rel="tag">${view.cateName}</a> 
							</span>
						</div>
					</div>
					
					<div class="woocommerce-tabs wc-tabs-wrapper">
						<div class="panel entry-content wc-tab" id="tab-description">
							<h1><b>상품 설명</b></h1>
							<p>
								${view.gdsDes}
							</p>
						</div>
					</div>
				
					<section class="replyList" style="padding:30px 0;">

						<ol style="padding:0; margin:0;">
						<%--
						<c:forEach items="${reply}" var="reply">
							<li>
					   			<div class="userInfo">
					    			<span class="userName">${reply.userName}</span>
					    			<span class="date"><fmt:formatDate value="${reply.repDate}" pattern="yyyy-MM-dd" /></span>
					   			</div>
					   			<div class="replyContent">${reply.repCon}</div>
					  		</li>
					  	</c:forEach>
					  	 --%>
					 	</ol>     
					 	
					 	<script>
							replyList();
						</script>
						
						<script>
						
							$(document).on("click", ".modify", function(){
								//$(".replyModal").attr("style", "display:block;");
								$(".replyModal").fadeIn(200);
								
								var repNum = $(this).attr("data-repNum");
								var repCon = $(this).parent().parent().children(".replyContent").text();
								
								$(".modal_repCon").val(repCon);
								$(".modal_modify_btn").attr("data-repNum", repNum);
								
							});
													
							// 스크립트로 인해 생성된 HTML의 이벤트는 .click() 메서드를 사용할 수 없음
							$(document).on("click", ".delete", function(){
								
								// 사용자에게 삭제 여부를 확인
								var deletConfirm = confirm("정말로 삭제하시겠습니까?"); 
								
								if(deletConfirm) {
								
									var data = {repNum : $(this).attr("data-repNum")};  // ReplyVO 형태로 데이터 생성
									
									$.ajax({
										url : "deleteReply",
										type : "post",
										data : data,
										success : function(result){
											
											// result의 값에 따라 동작
											if(result == 1) {
												replyList();  // 리스트 새로고침
											} else {
												alert("작성자 본인만 할 수 있습니다.")  // 본인이 아닌 경우										
											}
										},
										error : function(){
											// 로그인하지 않아서 에러가 발생한 경우
											alert("로그인하셔야합니다.")
										}
									});
								}
							});
						
						</script>
					</section>				
				
				<div id="reply">
				
					<c:if test="${member == null }">
						<p style="font-size:25px; margin-bottom:50px;">리뷰를 남기시려면 <a href="../member/signin">로그인</a>해주세요</p>
					</c:if>
					
					<c:if test="${member != null}">
					<section class="replyForm" style="padding:30px 0;">
						<form action="view" method="post" autocomplete="off">
						
							<input type="hidden" name="gdsNum" id="gdsNum" value="${view.gdsNum}">
						
							<div class="input_area" style="margin:10px 0;">
								<textarea style="font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:970px; height:150px; resize: none;" name="repCon" id="repCon"></textarea>
							</div>
							
							<div class="input_area">
								<button type="button" id="reply_btn" style="font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc;">리뷰 남기기</button>	
								
								<script>
									$("#reply_btn").click(function(){
										
										var formObj = $(".replyForm form[role='form']");
										var gdsNum = $("#gdsNum").val();
										var repCon = $("#repCon").val();
										
										// ReplyVO 형태로 데이터 생성
										var data = {
												gdsNum : gdsNum,
												repCon : repCon
												};
										
										$.ajax({
											url : "registReply",
											type : "post",
											data : data,
											success : function(){
												replyList();  // 리스트 새로고침
												$("#repCon").val("");  // 텍스트에어리어를 초기화
											}
										});
									});
								</script>
								
							</div>
							
						</form>
					</section>
					</c:if>
				</div>
				</div>
			</div>
			</div>
			
			</main>
		</div>
	</div>	
	</div>
</div>


<div class="replyModal" style="position:relative; z-index:1; display:none;">

	<div class="modalContent" style="position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666;">
		
		<div>
			<textarea class="modal_repCon" name="modal_repCon" style="font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:480px; height:225px;"></textarea>
		</div>
		
		<div>
			<button type="button" class="modal_modify_btn" style="font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc;">수정</button>
			<button type="button" class="modal_cancel" style="font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; margin-left:20px;">취소</button>
		</div>
		
	</div>

	<div class="modalBackground" style="position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1;"></div>
	
</div>

<script>
$(".modal_modify_btn").click(function(){
	var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	
	if(modifyConfirm) {
		var data = {
					repNum : $(this).attr("data-repNum"),
					repCon : $(".modal_repCon").val()
				};  // ReplyVO 형태로 데이터 생성
		
		$.ajax({
			url : "modifyReply",
			type : "post",
			data : data,
			success : function(result){
				
				if(result == 1) {
					replyList();
					$(".replyModal").fadeOut(200);
				} else {
					alert("작성자 본인만 할 수 있습니다.");							
				}
			},
			error : function(){
				alert("로그인하셔야합니다.")
			}
		});
	}
	
});

$(".modal_cancel").click(function(){
	//$(".replyModal").attr("style", "display:none;");
	$(".replyModal").fadeOut(200);
});
</script>

<footer id="colophon" class="site-footer">
	<div class="container">
		<div class="site-info">
			<h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Sankai</h1>
			<i class="fa fa-love"></i><a href="../intro">사이트소개</a>

		</div>
	</div>
</footer>
<a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a>

<!-- #page -->
<script src='../resources/js/jquery.js'></script>
<script src='../resources/js/plugins.js'></script>
<script src='../resources/js/scripts.js'></script>
<script src='../resources/js/masonry.pkgd.min.js'></script>

</body>
</html>

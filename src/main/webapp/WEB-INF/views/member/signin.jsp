<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>kubg</title>
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<h1 class="title">
				<a href="../">MOUNTSHOP</a>
			</h1>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<ul>
			<c:if test="${member == null}">
				<li>
					<a href="signin">로그인</a>
				</li>
				<li>
					<a href="signup">회원가입</a>
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
	<form action="signin" method="post" autocomplete="off">
		<div class="input_area">
			<label for="userId">아이디</label>
			<input type="email" id="userId" name="userId" required="required" value="admin@gmail.com" />						
		</div>
		
		<div class="input_area">
			<label for="userPass">패스워드</label>
			<input type="password" id="userPass" name="userPass" required="required" value="admin" />						
		</div>
							
		<button type="submit" id="signin_btn" name="signin_btn">로그인</button>
		
		<c:if test="${msg == false}">
			<p style="color:#f00;">로그인에 실패했습니다.</p>
		</c:if>
		
	</form>			
</section>
			
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

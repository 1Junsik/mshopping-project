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
	<form action="signup" method="post" autocomplete="off">
		<div class="input_area">
			<label for="userId">아이디</label>
			<input type="email" id="userId" name="userId" placeholder="example@email.com" required="required" />						
		</div>
		
		<div class="input_area">
			<label for="userPass">패스워드</label>
			<input type="password" id="userPass" name="userPass" required="required" />						
		</div>
		
		<div class="input_area">
			<label for="userName">닉네임</label>
			<input type="text" id="userName" name="userName" placeholder="닉네임을 입력해주세요" required="required" />						
		</div>
		
		<div class="input_area">
			<label for="userPhon">연락처</label>
			<input type="text" id="userPhon" name="userPhon" placeholder="연락처를 입력해주세요" required="required" />						
		</div>
		
		<button type="submit" id="signup_btn" name="signup_btn">회원가입</button>
		
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

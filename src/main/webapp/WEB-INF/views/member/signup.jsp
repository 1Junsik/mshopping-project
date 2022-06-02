<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>Sankai</title>
<link rel='stylesheet' href='../resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='../resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='../resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
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
            <li><a href="../shop/list?c=100&l=1">Hiking</a>
            <ul class="sub-menu">
               <li><a href='../shop/list?c=101&l=2'>등산화</a></li>
               <li><a href='../shop/list?c=102&l=2'>등산복 상의</a></li>
               <li><a href='../shop/list?c=103&l=2'>등산복 하의</a></li>
               <li><a href='../shop/list?c=104&l=2'>등산스틱</a></li>
               <li><a href='../shop/list?c=105&l=2'>등산용품</a></li>
               <li><a href='../shop/list?c=106&l=2'>등산배낭</a></li>
               <li><a href='../shop/list?c=107&l=2'>기타</a></li>
            </ul>
            <li><a href="../shop/list?c=200&l=1">Camping</a>
            <ul class="sub-menu">
               <li><a href='../shop/list?c=201&l=2'>텐트</a></li>
               <li><a href='../shop/list?c=202&l=2'>침낭</a></li>
               <li><a href='../shop/list?c=203&l=2'>랜턴</a></li>
               <li><a href='../shop/list?c=204&l=2'>캠핑기구</a></li>
               <li><a href='../shop/list?c=205&l=2'>기타</a></li>
            </ul>
            <li><a href="../shop/list?c=300&l=1">Fishing</a>
            <ul class="sub-menu">
               <li><a href='../shop/list?c=301&l=2'>낚시대</a></li>
               <li><a href='../shop/list?c=302&l=2'>낚시장비</a></li>
               <li><a href='../shop/list?c=303&l=2'>낚시줄</a></li>
               <li><a href='../shop/list?c=304&l=2'>미끼</a></li>
               <li><a href='../shop/list?c=305&l=2'>그물</a></li>
               <li><a href='../shop/list?c=306&l=2'>기타</a></li>
            </ul>
            <li><a href="../shop/list?c=400&l=1">ETC</a>
            <ul class="sub-menu">
               <li><a href='../shop/list?c=401&l=2'>구급상자</a></li>
               <li><a href='../shop/list?c=402&l=2'>일회용품</a></li>
               <li><a href='../shop/list?c=403&l=2'>놀이용품</a></li>
               <li><a href='../shop/list?c=404&l=2'>기타</a></li>
            </ul>
         </ul> 
      </div>
      </nav>
      </header>
      
      <!-- #masthead -->
      <div id="content" class="site-content">
         <div id="primary" class="content-area column two-thirds single-portfolio">
            <main id="main" class="site-main">
            
            <article class="hentry">
            <header class="entry-header">
            <div class="entry-thumbnail">
               <img width="800" height="500" src="https://www.rei.com/dam/rinckenberger_111815_1406_main_lg.jpg" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="p1"/>
            </div>
            </header>
            <div class="entry-content">
               <blockquote>
                  <p>
                     <h7> "왜 나는 산에 오르는가?" 이 물음에 대답할 말이 없다. 다만 있다면 '어떻게 해서든지 올라가야겠다.' 는 것 뿐이다. - Marcus Schmuck (1925-2005) </h7>
                  </p>
                  <p>
                     <h3> Sankai 와 함께 최고의 레저스포츠를 경험하세요. </h3>
                  </p>
               </blockquote>
            </div>
            </article>
                     
            </main>
            <!-- #main -->
         </div>
         <!-- #primary -->
         
         <div id="secondary" class="column third">
            <div class="widget-area">
               <aside class="widget">
                  <h4 class="widget-title">회원가입</h4>
                  <form class="wpcf7" method="post" action="signup" id="contactform">
                     <div class="form">
                        <p><input type="email" id="userId" name="userId" placeholder="이메일" required="required" /></p>
                        <p><input type="password" id="userPass" name="userPass" placeholder="비밀번호" required="required" /></p>
                        <p><input type="text" id="userName" name="userName" placeholder="닉네임" required="required" /></p>
                        <p><input type="text" id="userPhon" name="userPhon" placeholder="연락처" required="required" /></p>
                        
                        <input type="submit" id="signup_btn" name="signup_btn" class="clearfix btn" value="가입하기">
                     </div>
                  </form>
                  <div class="done">                        
                     회원가입이 완료되었습니다. 
                  </div>
               </aside>
            </div>
         </div>
      </div>
      <!-- #content -->
   </div>
   <!-- .container -->
   <footer id="colophon" class="site-footer">
   <div class="container">
      <div class="site-info">
         <h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Sankai</h1>
      <i class="fa fa-love"></i><a href="../intro">사이트소개</a>

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
<script src='../resources/js/validate.js'></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>Moschino | Minimalist Free HTML Portfolio by WowThemes.net</title>
<link rel='stylesheet' href='./resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='./resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='./resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<style>

/* footnote */
a.footnote {
    cursor: help;
    position: relative;
    text-decoration: none!important;
    color: #666;
    text-indent: 0
}

.footnote sup {
    color: crimson
}

.footnote span.note {
    margin-left: -999em;
    position: absolute;
    padding: 10px;
    background: #ffa;
    border: 1px solid #ffad33;
    text-align: left;
    line-height: 1.3em
}

.footnote:hover span.note {
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1);
    -webkit-box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1);
    -moz-box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1);
    position: absolute;
    right: -107px;
    bottom: 2.5em;
    z-index: 99;
    width: 200px
}

.note_ttl {
    display: block;
    width: 100%;
    margin: 0 auto 3px auto;
    padding-bottom: 2px;
    text-align: left;
    border-bottom: 1px solid #fea;
    color: crimson
}
div.footnote_desc {
    border-top: 1px solid #ccc
}
.footnote:hover span.note:before {
    content:"";
    position: absolute;
    bottom: -6px;
    left: 105px;
    border-width: 6px 6px 0;
    border-style: solid;
    border-color: #ffa transparent;
    display: block;
    width: 0;
    z-index: 100
}

.footnote:hover span.note:after {
    content:"";
    position: absolute;
    bottom: -7px;
    left: 104px;
    border-width: 7px 7px 0;
    border-style: solid;
    border-color: #ffad33 transparent;
    display: block;
    width: 0
}

</style>

</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
<div id="page">
   <div class="container">
      <header id="masthead" class="site-header">
      <div class="site-branding">
         <h1 class="site-title"><a href="./" rel="home">Mountshop</a></h1>
         <h2 class="site-description">오늘도 즐거운 하루 되세요 :)</h2>
      </div>
      <nav id="site-navigation" class="main-navigation">
      <button class="menu-toggle">Menu</button>
      <a class="skip-link screen-reader-text" href="#content">Skip to content</a>
      <div class="menu-menu-1-container">
         <ul id="menu-menu-1" class="menu">
            <li><a href="../shop/list?c=100&l=1">Hiking</a>
            <ul class="sub-menu">
               <li><a href='./shop/list?c=101&l=2'>등산화</a></li>
               <li><a href='./shop/list?c=102&l=2'>등산복 상의</a></li>
               <li><a href='./shop/list?c=103&l=2'>등산복 하의</a></li>
               <li><a href='./shop/list?c=104&l=2'>등산스틱</a></li>
               <li><a href='./shop/list?c=105&l=2'>등산용품</a></li>
               <li><a href='./shop/list?c=106&l=2'>등산배낭</a></li>
               <li><a href='./shop/list?c=107&l=2'>기타</a></li>
            </ul>
            <li><a href="./shop/list?c=200&l=1">Camping</a>
            <ul class="sub-menu">
               <li><a href='./shop/list?c=201&l=2'>텐트</a></li>
               <li><a href='./shop/list?c=202&l=2'>침낭</a></li>
               <li><a href='./shop/list?c=203&l=2'>랜턴</a></li>
               <li><a href='./shop/list?c=204&l=2'>캠핑기구</a></li>
               <li><a href='./shop/list?c=205&l=2'>기타</a></li>
            </ul>
            <li><a href="./shop/list?c=300&l=1">Fishing</a>
            <ul class="sub-menu">
               <li><a href='./shop/list?c=301&l=2'>낚시대</a></li>
               <li><a href='./shop/list?c=302&l=2'>낚시장비</a></li>
               <li><a href='./shop/list?c=303&l=2'>낚시줄</a></li>
               <li><a href='./shop/list?c=304&l=2'>미끼</a></li>
               <li><a href='./shop/list?c=305&l=2'>그물</a></li>
               <li><a href='./shop/list?c=306&l=2'>기타</a></li>
            </ul>
            <li><a href="./shop/list?c=400&l=1">ETC</a>
            <ul class="sub-menu">
               <li><a href='./shop/list?c=401&l=2'>구급상자</a></li>
               <li><a href='./shop/list?c=402&l=2'>일회용품</a></li>
               <li><a href='./shop/list?c=403&l=2'>놀이용품</a></li>
               <li><a href='./shop/list?c=404&l=2'>기타</a></li>
            </ul>
         </ul> 
      </div>
      </nav>
      </header>
      
      <!-- #masthead -->
      <div id="content" class="site-content">
         <div id="primary" class="content-area column full">
            <main id="main" class="site-main">

            <header class="entry-header">
            <h1 class="entry-title">Ⅰ. 사이트 소개</h1>   
            </header>            
            <div class="wpcmsdev-tabs">
               <div class="tab">
                  <div id="tab-what-is-lore-ipsum" class="tab-content">
                     <p>
                        등산 및 캠핑 관련 용품 등을 판매하는 쇼핑몰
                     </p>
                  </div>
               </div>
            </div>
            
            <br>   
            <header class="entry-header">
            <h1 class="entry-title">Ⅱ. 사이트 기획 배경</h1>   
            </header>   
            <div class="wpcmsdev-tabs">
               <div class="tab">
                  <div id="tab-what-is-lore-ipsum" class="tab-content">
                     <p><a style="font-weight:bold;font-size:larger;line-height:200%;">①</a>  코로나19 사태에 따른 사회적 거리두기 등 오랫동안 이어진 정부 규제로 인해 그동안 억눌렸던 소비심리 급증</p>
                     <p><a style="font-weight:bold;font-size:larger;line-height:200%;">②</a>  코로나19 사태 이후 등산 및 캠핑 등 산림자원 중심 여행 트렌드 급부상 및 관심 증가</p>
                     <p>
                        <a style="font-weight:bold;font-size:larger;line-height:200%;">③</a>  등산 및 캠핑 물품 경우, 실제 사용 후 구매를 원하는
                           <a class="footnote" id="footnote_글번호_1">
                              <sup>*</sup>
                                 <span class="note" style="font-size:x-small;">
                                    <strong class="note_ttl">트라이슈머</strong>직접 사용해보거나 다수의 타인의 리뷰를 참고하여 구매하는 소비자
                                 </span>
                           </a>
                        <a style="color:red;font-weight:bold;">트라이슈머(trysumer)</a>가 다수
                     </p>                     
                     <p><a style="font-weight:bold;font-size:larger;line-height:200%;">④</a>  상기 소비심리 급증, 산림자원 중심 여행 트렌드 급부상 및 주 고객이 트라이슈머인 점 등으로 인해 기획한 쇼핑몰</p>
                  </div>
               </div>
            </div>
            
            <br>
            <header class="entry-header">
            <h1 class="entry-title">Ⅲ. 주요 기능</h1>   
            </header>            
            <div class="wpcmsdev-tabs">
               <div class="tab">
                  <div id="tab-what-is-lore-ipsum" class="tab-content">
                     <p>
                        <a style="font-weight:bold;line-height:200%;">회원 관련</a> : 회원가입, 로그인, 로그아웃, 회원정보 수정 
                     </p>
                     <p>
                        <a style="font-weight:bold;line-height:200%;">상품 관련</a> : 카테고리 추가, 상품 등록, 상품 목록, 상품 조회, 상품 수정, 상품 삭제
                     </p>
                     <p>
                        <a style="font-weight:bold;line-height:200%;">기타</a> : 상품리뷰 추가, 상품리뷰 삭제, 상품리뷰 추천, 상담 채팅, 주문 삭제 
                     </p>
                  </div>
               </div>
            </div>

            <br>
            <header class="entry-header">
            <h1 class="entry-title">Ⅳ. 사용 기술 및 개발 환경</h1>   
            </header>            
            <div class="wpcmsdev-tabs">
               <div class="tab">
                  <div id="tab-what-is-lore-ipsum" class="tab-content">
                     <p>
                        <a style="font-weight:bold;line-height:200%;">기술</a> : Java SE, SQL, Mybatis, HTML5, CSS3, Javascript, Spring, jQuery, Ajax, Git
                     </p>
                     <p>
                        <a style="font-weight:bold;line-height:200%;">개발 환경</a> : Spring Tool Suite 3, Oracle SQL Developer, Sourcetree
                     </p>
                  </div>
               </div>
            </div>
            
            
            <article class="hentry">
               <div class="entry-content">   
                  <h2 style="font-family: 'Herr Von Muellerhoff';color:#ccc;font-weight:300;">Yours, Von Muellerhoff</h2>
               </div><!-- .entry-content -->
            </article>
            
   
            
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
         <h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Mountshop</h1>
         Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

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
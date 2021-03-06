-- 회원 테이블 (TBL_MEMBER)
create table tbl_member (
    userId      varchar2(50)    not null,           -- 아이디
    userPass    varchar2(100)   not null,           -- 비밀번호
    userName    varchar2(30)    not null,           -- 닉네임
    userPhon    varchar2(20)    not null,           -- 연락처
    userAddr1   varchar2(20)    null,               -- 주소(1)
    userAddr2   varchar2(50)    null,               -- 주소(2)
    userAddr3   varchar2(50)    null,               -- 주소(3)
    regiDate    date            default sysdate,    -- 가입날짜
    verify      number          default 0,          -- 인증 여부
    primary key(userId)
);




-- 상품 테이블 (TBL_GOODS)
create table tbl_goods (
    gdsNum       number          not null,          -- 상품 번호
    gdsName      varchar2(300)    not null,          -- 상품 이름 
    cateCode     varchar2(30)    not null,          -- 분류
    gdsPrice     number          not null,          -- 가격
    gdsStock     number          null,              -- 수량
    gdsDes       varchar(500)    null,              -- 설명
    gdsImg       varchar(200)    null,              -- 이미지
    gdsDate      date            default sysdate,   -- 등록 날짜
    primary key(gdsNum)  
);

--  썸네일을 사용해야하며, 이미지를 첨부하여 저장할 시 원본 이미지를 저장하고, 저장하는 원본 이미지를 썸네일화 시켜서 별도로 저장
alter table tbl_goods add (gdsThumbImg varchar(200));





-- 분류용 테이블 (GOODS_CATEGORY)
create table goods_category (
    cateName     varchar2(20)    not null,                          -- 카테고리 이름
    cateCode     varchar2(30)    not null,                          -- 카테고리 코드
    cateCodeRef  varchar2(30)    null,                              -- 카테고리 참조 코드
    primary key(cateCode),
    foreign key(cateCodeRef) references goods_category(cateCode) on delete cascade
);

-- 상품 테이블와 카테고리 테이블은 다른 테이블이기 때문에 별도의 쿼리 작성
alter table tbl_goods add
    constraint fk_goods_category
    foreign key (cateCode)
        references goods_category(cateCode) on delete cascade;

-- 상품 테이블의 상품 번호의 자동 입력을 위한 시퀸스 생성
create sequence tbl_goods_seq;




-- 상품 리뷰 테이블
create table tbl_reply (
    gdsNum      number          not null,		        -- 상품 번호
    userId      varchar2(50)    not null,				-- 아이디
    repNum      number          not null,				-- 리뷰 번호
    repCon      varchar2(2000)  not null,				-- 리뷰 내용
    repDate     date            default sysdate,		-- 리뷰 등록 날짜
    primary key(gdsNum, repNum) 
);

-- 상품 번호(repNum)을 자동으로 생성할 시퀀스 생성
create sequence tbl_reply_seq;

-- 소감 테이블의 상품 번호와 유저 아이디는 다른 테이블에서 참조
alter table tbl_reply
    add constraint tbl_reply_gdsNum foreign key(gdsNum)
    references tbl_goods(gdsNum) on delete cascade;
   
alter table tbl_reply
    add constraint tbl_reply_userId foreign key(userId)
    references tbl_member(userId) on delete cascade;







-- 카트 테이블
create table tbl_cart (
    cartNum     number          not null,				-- 카트 번호
    userId      varchar2(50)    not null,				-- 아이디		
    gdsNum      number          not null,				-- 상품 번호
    cartStock   number          not null,				-- 카트 수량
    addDate     date            default sysdate,		-- 카트 등록 날짜
    primary key(cartNum, userId) 
);

-- 카트 번호를 생성할 시퀸스
create sequence tbl_cart_seq;

-- 카트 테이블과 맴버 테이블, 상품 테이블을 참조
alter table tbl_cart
    add constraint tbl_cart_userId foreign key(userId)
    references tbl_member(userId) on delete cascade;

alter table tbl_cart
    add constraint tbl_cart_gdsNum foreign key(gdsNum)
    references tbl_goods(gdsNum) on delete cascade;







-- 주문 테이블
create table tbl_order (
    orderId     varchar2(50) not null,					-- 주문 고유 아이디
    userId      varchar2(50) not null,					-- 아이디
    orderRec    varchar2(50) not null,					-- 수신자
    userAddr1   varchar2(100) not null,					-- 주소 (우편번호)
    userAddr2   varchar2(100) not null,					-- 주소 (기본주소)
    userAddr3   varchar2(100) not null,					-- 주소 (상세주소)
    orderPhon   varchar2(30) not null,					-- 연락처
    amount      number       not null,					-- 총가격
    orderDate   Date         default sysdate,   		-- 주문 날짜
    primary key(orderId)
);

-- 주문 테이블과 멤버 테이블의 참조
alter table tbl_order
    add constraint tbl_order_userId foreign key(userId)
    references tbl_member(userId) on delete cascade;


-- tbl_order 에 새로운 컬럼을 추가, 이 컬럼은 배송 정보를 표시
alter table tbl_order
    add(
        delivery    varchar2(20)    default '배송준비'
    );
    
    
    
    
-- 주문 상세 테이블
create table tbl_order_details (
    orderDetailsNum number       not null,				-- 주문 상세 번호
    orderId         varchar2(50) not null,				-- 주문 고유 아이디
    gdsNum          number          not null,			-- 상품 번호
    cartStock       number          not null,			-- 카트 수량
    primary key(orderDetailsNum)
);

-- 주문 상세 번호(orderDetailsNum)로 이용될 시퀀스
create sequence tbl_order_details_seq;



-- 주문 상세 테이블과 주문 테이블의 참조 설정
alter table tbl_order_details
    add constraint tbl_order_details_orderId foreign key(orderId)
    references tbl_order(orderId) on delete cascade;



-- 카테고리 분류 관련 쿼리문
insert into goods_category (cateName, cateCode) values ('등산', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('등산화', '101', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('등산복 상의', '102', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('등산복 하의', '103', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('등산스틱', '104', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('등산용품', '105', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('등산배낭', '106', '100');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('기타', '107', '100');


insert into goods_category (cateName, cateCode) values ('캠핑', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('텐트', '201', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('침낭', '202', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('랜턴', '203', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('캠핑기구', '204', '200');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('기타', '205', '200');

insert into goods_category (cateName, cateCode) values ('낚시', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('낚시대', '301', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('낚시장비', '302', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('낚시줄', '303', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('미끼', '304', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('그물', '305', '300');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('기타', '306', '300');

insert into goods_category (cateName, cateCode) values ('기타용품', '400');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('구급상자', '401', '400');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('일회용품', '402', '400');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('놀이용품', '403', '400');
insert into goods_category (cateName, cateCode, cateCodeRef) values ('기타', '404', '400');



-- 채팅방 테이블
create table tbl_chatting (
    chatNum         number                  not null,		    -- 채팅방 번호
    userId          varchar2(50)            not null,			-- 아이디
    userName        varchar2(30)            not null,			-- 닉네임
    chCon           varchar2(2000)          not null,			-- 채팅방 내용
    primary key(chatNum)
);

-- 채팅창 번호(chatNum)로 이용될 시퀀스
create sequence tbl_chatting_seq;


-- 채팅창 테이블과 회원 테이블의 참조 설정
alter table tbl_chatting
    add constraint tbl_chatting_userId foreign key(userId)
    references tbl_member(userId) on delete cascade;






-- UGLYTASTY 파이널 프로젝트 계정_uglytasty
--CREATE USER uglytasty IDENTIFIED BY uglytasty;
--GRANT CONNECT, RESOURCE TO uglytasty;


--접속유저의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--접속유저의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/


---------------------------회원 MEMBER-----------------------------
CREATE TABLE MEMBER(
    USER_ID VARCHAR2(50) PRIMARY KEY,
    USER_PWD VARCHAR2(200) NOT NULL,
    USER_NAME VARCHAR2(50) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL,
    ADDRESS_BASE VARCHAR2(200) NOT NULL,
    ADDRESS_DETAIL VARCHAR2(200) NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' NOT NULL,
    SUBSCRIBE VARCHAR2(5) DEFAULT 'N' NOT NULL,
    PROVIDER VARCHAR2(500),
    ACCESS_TOKEN VARCHAR2(500),
    REFRESH_TOKEN VARCHAR2(500)
);

COMMENT ON COLUMN MEMBER.USER_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.USER_NAME IS '회원 이름';
COMMENT ON COLUMN MEMBER.PHONE IS '회원 전화번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원 이메일';
COMMENT ON COLUMN MEMBER.ADDRESS_BASE IS '회원 주소(기본)';
COMMENT ON COLUMN MEMBER.ADDRESS_DETAIL IS '회원 주소(상세)';
COMMENT ON COLUMN MEMBER.STATUS IS '회원 상태';
COMMENT ON COLUMN MEMBER.SUBSCRIBE IS '못난이 박스 구독 여부';
COMMENT ON COLUMN MEMBER.PROVIDER IS 'SNS 종류';
COMMENT ON COLUMN MEMBER.ACCESS_TOKEN IS '엑세스 토큰';
COMMENT ON COLUMN MEMBER.REFRESH_TOKEN IS '리프레쉬 토큰';


INSERT
  INTO MEMBER
       (
        USER_ID,
        USER_PWD,
        USER_NAME,
        PHONE,
        EMAIL,
        ADDRESS_BASE,
        ADDRESS_DETAIL,
        STATUS,
        SUBSCRIBE
      )
VALUES
      (
       'admin'
     , '$2a$10$Y/sqU6veRhDmcwPDFAjbEeyxuSdOEvtPc0xzHR4QVbuF8Orb.TZ7q'
     , '관리자'
     , '010-1111-1111'
     , 'admin@naver.com'
     , '서울시 강남구'
     , '논현동 13-7'
     , 'Y'
     , 'Y'
     );
     
INSERT
  INTO MEMBER
       (
        USER_ID,
        USER_PWD,
        USER_NAME,
        PHONE,
        EMAIL,
        ADDRESS_BASE,
        ADDRESS_DETAIL,
        STATUS,
        SUBSCRIBE
      )
VALUES
      (
       'user01'
     , '$2a$10$YMwGi8MNp74obor9sU5iBuJ4wo3NDN3dFpuz3ykeXeohNfIRX9S8G'
     , '나구독'
     , '010-1111-2222'
     , 'user01@naver.com'
     , '서울시 마포구'
     , '성미산로 21길'
     , default
     , 'Y'
     );

INSERT
  INTO MEMBER
       (
        USER_ID,
        USER_PWD,
        USER_NAME,
        PHONE,
        EMAIL,
        ADDRESS_BASE,
        ADDRESS_DETAIL,
        STATUS,
        SUBSCRIBE
      )
VALUES
      (
       'user02'
     , '$2a$10$JwzWlDFDAHktI0l3BgIxFuAs9gAV2fJMxVqAua6gvkiu3e9fSPcYi'
     , '나일반'
     , '010-1111-3333'
     , 'user02@naver.com'
     , '서울시 동작구'
     , '흑석동 15-9번지'
     , default
     , 'Y'
     );
     
INSERT
  INTO MEMBER
       (
        USER_ID,
        USER_PWD,
        USER_NAME,
        PHONE,
        EMAIL,
        ADDRESS_BASE,
        ADDRESS_DETAIL,
        STATUS,
        SUBSCRIBE
      )
VALUES
      (
       'user03'
     , '$2a$10$OdZTblRWO4JufCqz3zTlCO1niRjFIpFIN3rkrew3wvGWEh6mqWECG'
     , '이둥이'
     , '010-3333-3333'
     , 'user03@naver.com'
     , '서울시 동작구'
     , '노량진동 23-1번지'
     , default
     , 'Y'
     );
     
INSERT
  INTO MEMBER
       (
        USER_ID,
        USER_PWD,
        USER_NAME,
        PHONE,
        EMAIL,
        ADDRESS_BASE,
        ADDRESS_DETAIL,
        STATUS,
        SUBSCRIBE
      )
VALUES
      (
       'user04'
     , '$2a$10$hJ.xkNH/xoYiBb90fzlVleR58HyhAk07UJu7DYFuwY.JW6o4Moowe'
     , '차은우'
     , '010-4444-4444'
     , 'user04@naver.com'
     , '서울시 강동구'
     , '천호동 17-7번지'
     , default
     , 'Y'
     );
 

 
   
----------------------------레시피 RECIPE----------------------------

CREATE TABLE RECIPE(
    RECIPE_NO NUMBER PRIMARY KEY,
    RECIPE_WRITER VARCHAR2(50) DEFAULT 'admin' NOT NULL,
    RECIPE_TITLE VARCHAR2(100) NOT NULL,
    RECIPE_ORIGIN_NAME VARCHAR2(200),
    RECIPE_CHANGE_NAME VARCHAR2(200),
    RECIPE_EXP VARCHAR2(2000) NOT NULL,
    RECIPE_CONTENT VARCHAR2(4000) NOT NULL,
    COUNT NUMBER DEFAULT 0 NOT NULL,
    DIFFICULTY VARCHAR2(50) NOT NULL,
    TIME VARCHAR2(50) NOT NULL,
    RECIPE_DATE  DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN RECIPE.RECIPE_NO IS '글 번호';
COMMENT ON COLUMN RECIPE.RECIPE_WRITER IS '작성자';
COMMENT ON COLUMN RECIPE.RECIPE_TITLE IS '레시피 제목';
COMMENT ON COLUMN RECIPE.RECIPE_ORIGIN_NAME IS '레시피 이미지 원래 이름';
COMMENT ON COLUMN RECIPE.RECIPE_CHANGE_NAME IS '레시피 이미지 변경 이름';
COMMENT ON COLUMN RECIPE.RECIPE_EXP IS '간단 설명';
COMMENT ON COLUMN RECIPE.RECIPE_CONTENT IS '레시피 내용';
COMMENT ON COLUMN RECIPE.COUNT IS '조회수';
COMMENT ON COLUMN RECIPE.DIFFICULTY IS '난이도';
COMMENT ON COLUMN RECIPE.TIME IS '소요 시간';
COMMENT ON COLUMN RECIPE.RECIPE_DATE IS '레시피 작성일';
COMMENT ON COLUMN RECIPE.STATUS IS '상태';

CREATE SEQUENCE SEQ_RECIPE_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE
NOCACHE;

INSERT
  INTO RECIPE
       (
         RECIPE_NO
       , RECIPE_WRITER
       , RECIPE_TITLE
       , RECIPE_ORIGIN_NAME
       , RECIPE_CHANGE_NAME
       , RECIPE_EXP
       , RECIPE_CONTENT
       , COUNT
       , DIFFICULTY
       , TIME
       , RECIPE_DATE	
       , STATUS
      )
VALUES
      (
         SEQ_RECIPE_NO.NEXTVAL
       , DEFAULT
       , '아직도 안 먹어봤나요? <br>토마토 달걀 볶음'
       , 'https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/image/20220123/bd89a01dbda445c29e5b6ab56eb061cb.jpg'
       , ''
       , '한 번도 안 먹어본 사람은 있어도, 한 번만 먹어본 사람은 없다는! 토마토 달걀 볶음'
       , '1. 대파는 파기름을 내기 좋게 쫑쫑 썰어줍니다.<br>2. 토마토는 꼭지를 제거하고 먹기좋은 크기로 잘라주세요.<br>3. 볼에 달걀을 넣고 소금간을 한 다음 곱게 풀어줍니다.<br>4. 기름 두른 팬을 달궈준 다음 달걀물을 붓고 휘저어줍니다. 적당히 익은 스크램블에그는 접시에 덜어주세요.<br>5. 팬에 기름을 다시 두르고 대파를 볶아 파기름을 내줍니다.<br>6. 파향이 솔솔 올라오면 토마토를 넣고 같이 볶으면서 간장과 연두를 넣고 눌리듯 볶아줍니다. 센불에서 짧게 볶아주면 좋습니다.<br>7. 만들어둔 스크램블을 같이 넣고 볶다가 참기름, 후추로 마무리하면 완성!'
       , DEFAULT
       , '누구나'
       , '5분 이내'
       , DEFAULT 	
       , DEFAULT
     );
     
INSERT
  INTO RECIPE
       (
         RECIPE_NO
       , RECIPE_WRITER
       , RECIPE_TITLE
       , RECIPE_ORIGIN_NAME
       , RECIPE_CHANGE_NAME
       , RECIPE_EXP
       , RECIPE_CONTENT
       , COUNT
       , DIFFICULTY
       , TIME
       , RECIPE_DATE	
       , STATUS
      )
VALUES
      (
         SEQ_RECIPE_NO.NEXTVAL
       , DEFAULT
       , '남녀노소 좋아하는, 표고버섯 불고기'
       , 'https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/image/20220123/788e8a55646b440ba75956f503fa1e49.jpg'
       , ''
       , '건강에 좋은 표고버섯을 듬뿍 넣어 든든한 표고버섯불고기로 든든하게 즐겨보세요!'
       , '1. 불고기용 소고기는 키친타월로 핏물을 닦아 준비해줍니다.<br>2. 간장 4스푼, 다진마늘 1스푼, 맛술 1스푼, 후추와 참기름을 조금씩 넣고 설탕 4스푼을 넣어 양념을 만들어주세요.<br>3. 고기를 양념에 잘 버무려 잠시 냉장고에서 숙성시켜줍니다.<br>4. 표고버섯은 깨끗히 씻어 먹기 좋은 크기로 썰어주시고, 기호에 따라 대파, 양파. 홍고추 등 먹기 좋은 크기로 썰어 준비해줍니다.<br>5. 달궈진 프라이팬에 고기를 넣고 볶아줍니다. <br>6. 고기가 어느정도 익으면 준비해둔 표고버섯과 홍고추를 제외한 채소들을 넣고 함께 볶아줍니다.<br>7. 마지막으로 홍고추를 넣고, 대파를 채썰어 가득 얹어 마무리해주면, 표고버섯불고기 완성!'
       , DEFAULT
       , '초급'
       , '60분 이내'
       , DEFAULT 
       , DEFAULT
     );
     
INSERT
  INTO RECIPE
       (
         RECIPE_NO
       , RECIPE_WRITER
       , RECIPE_TITLE
       , RECIPE_ORIGIN_NAME
       , RECIPE_CHANGE_NAME
       , RECIPE_EXP
       , RECIPE_CONTENT
       , COUNT
       , DIFFICULTY
       , TIME
       , RECIPE_DATE	
       , STATUS
      )
VALUES
      (
         SEQ_RECIPE_NO.NEXTVAL
       , DEFAULT
       , '한입에 쏙 들어가는 브로콜리 계란말이'
       , 'https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/image/20220123/299b531c42924ea492978540a2f4c8ab.jpg'
       , ''
       , '예쁜 색감으로 아기자기한 비주얼! 한입 크기로 부드럽게 먹기에도 간편한 브로콜리 계란말이입니다.'
       , '1. 끓는 물에 소금을 넣고 브로콜리를 살짝 데쳐주세요. 색이 진해지면 꺼내 찬물에 헹궈 물기를 제거해주고 잘게 다져줍니다.<br>2. 달걀은 흰자, 노른자를 분리해 준비합니다.<br>3. 흰자에 생크림, 전분, 다진 브로콜리를 넣어 잘 섞어주세요.<br>4. 팬에 식용유를 두르고 흰달걀물을 얇게 펴 부쳐줍니다. 약불에 은근히 익혀준 뒤 돌돌 말아가며 모양을 잡아주세요.<br>5. 흰자를 다 부쳐준 뒤 겉면의 노른자 달걀물을 지단처럼 부쳐 감싸듯 익혀주세요.<br>6. 다 익으면 김발로 눌러 모양을 잡아주고, 한 김 식으면 알맞은 크기로 썰어 완성합니다.'
       , DEFAULT
       , '중급'
       , '15분 이내'
       , DEFAULT 
       , DEFAULT
     );
     
INSERT
  INTO RECIPE
       (
         RECIPE_NO
       , RECIPE_WRITER
       , RECIPE_TITLE
       , RECIPE_ORIGIN_NAME
       , RECIPE_CHANGE_NAME
       , RECIPE_EXP
       , RECIPE_CONTENT
       , COUNT
       , DIFFICULTY
       , TIME
       , RECIPE_DATE	
       , STATUS
      )
VALUES
      (
         SEQ_RECIPE_NO.NEXTVAL
       , DEFAULT
       , '부드러우면서 꾸덕한 단호박 바스크 치즈케이크'
       , 'https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/image/20220329/9f6a416cb2c147bb92e7366e840af11f.jpg'
       , ''
       , '노릇노릇 구워지는 모습만 봐도 행복! 재료들만 잘 섞어 오븐에 굽기만하면 완성되는 심플한 부드러움, 단호박 바스크 치즈케이크 입니다'
       , '1. 실온에 둔 크림치즈를 볼에 담고 주걱으로 잘 풀어줍니다.<br>2. 풀어둔 크림치즈에 설탕과 넣고 섞어줍니다.<br>3. 단호박은 쪄낸 뒤 부드럽게 으깨 준비해주고 크림치즈 혼합물어 생크림과 단호박을 넣어준 뒤 잘 섞어주세요.<br>4. 크림치즈 혼합물에 계란과 바닐라 익스트랙을 넣고 고르게 섞어줍니다.<br>5. 마지막으로 박력분과 시나몬파우더를 체쳐 넣어준 뒤 주걱으로 섞어주세요.<br>6. 유산지를 깐 원형 틀에 반죽을 팬닝하고 230도로 예열된 오븐에서 25~30분 간 구워주면 완성!'
       , DEFAULT
       , '고급'
       , '60분 이내'
       , DEFAULT 
       , DEFAULT
     );
     
INSERT
  INTO RECIPE
       (
         RECIPE_NO
       , RECIPE_WRITER
       , RECIPE_TITLE
       , RECIPE_ORIGIN_NAME
       , RECIPE_CHANGE_NAME
       , RECIPE_EXP
       , RECIPE_CONTENT
       , COUNT
       , DIFFICULTY
       , TIME
       , RECIPE_DATE	
       , STATUS
      )
VALUES
      (
         SEQ_RECIPE_NO.NEXTVAL
       , DEFAULT
       , '통마늘이 쏙! 너 마늘 찾고 있어~? <br>마늘떡볶이'
       , 'https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/image/20220123/f1fc331052f04654a5886a8d780204ad.jpg'
       , ''
       , '튀기듯 구워내 풍미를 끌어올린 통마늘에 바삭한 마늘 후레이크까지 더하니 금상첨화! 입안 가득 마늘 향을 선사하는 마성의 떡볶이, 마늘떡볶이'
       , '1. 마늘 10톨은 기름을 두른 팬에 튀기듯 볶아주세요.<br>2. 마늘 5톨은 굵직하게 다져서 노릇노릇 빛깔이 돌도록 튀겨 마늘후레이크를 만듭니다.<br>3. 양파, 당근, 어묵은 먹기좋은 크기로 썰어줍니다.<br>4. 고추장, 고운고춧가루, 설탕, 물엿, 간장을 배합하여 양념장을 만들어주세요.<br>5. 오목한 팬이나 널찍한 냄비에 떡, 채소, 양념장, 육수(닭or멸치 등)를 부어 끓여줍니다.<br>6. 국물이 자작하게 졸아들면 볶은 마늘을 넣고 버무려주세요.<br>7. 떡볶이를 그릇에 옮겨담고 마늘후레이크를 솔솔 뿌려주면 완성!'
       , DEFAULT
       , '중급'
       , '30분 이내'
       , DEFAULT 
       , DEFAULT
     );
     
     

----------------------------재료 INGREDIENTS----------------------------
CREATE TABLE INGREDIENTS(
    RECIPE_NO NUMBER PRIMARY KEY,
    SERVINGS NUMBER NOT NULL,
    INGREDIENT VARCHAR2(1000) NOT NULL,
    QUANTITY VARCHAR2(1000) NOT NULL,
    SEASONING VARCHAR2(1000),
    AMOUNT VARCHAR2(1000),
    
    FOREIGN KEY (RECIPE_NO) REFERENCES RECIPE (RECIPE_NO)
);

COMMENT ON COLUMN INGREDIENTS.RECIPE_NO IS '글 번호';
COMMENT ON COLUMN INGREDIENTS.SERVINGS IS '인분';
COMMENT ON COLUMN INGREDIENTS.INGREDIENT IS '주재료';
COMMENT ON COLUMN INGREDIENTS.QUANTITY IS '주재료 수량';
COMMENT ON COLUMN INGREDIENTS.SEASONING IS '양념';
COMMENT ON COLUMN INGREDIENTS.AMOUNT IS '양념 수량';

INSERT
  INTO INGREDIENTS
       (
          RECIPE_NO
	, SERVINGS
        , INGREDIENT
        , QUANTITY
        , SEASONING
        , AMOUNT
      )
VALUES
      (
          1
	, 1
        , '달걀,대파,토마토'
        , '1.5개,25g,100g'
        , '간장,소금,연두,참기름,후추'
        , '0.3T,0.1T,0.5T,0.1T,0.1T'
     );
     
INSERT
  INTO INGREDIENTS
       (
          RECIPE_NO
	, SERVINGS
        , INGREDIENT
        , QUANTITY
        , SEASONING
        , AMOUNT
      )
VALUES
      (
          2
	, 1
        , '대파,소고기(불고기용),양파,표고버섯,홍고추'
        , '20g,250g,40g,100g,10g'
        , '간장,다진마늘,맛술,참기름,후추'
        , '2T,0.5T,0.5T,0.3T,0.1T'
     );
     
INSERT
  INTO INGREDIENTS
       (
          RECIPE_NO
	, SERVINGS
        , INGREDIENT
        , QUANTITY
        , SEASONING
        , AMOUNT
      )
VALUES
      (
          3
	, 1
        , '달걀,브로콜리,생크림,전분'
        , '2개,50g,50ml,0.3T'
        , ''
        , ''
     );
     
INSERT
  INTO INGREDIENTS
       (
          RECIPE_NO
	, SERVINGS
        , INGREDIENT
        , QUANTITY
        , SEASONING
        , AMOUNT
      )
VALUES
      (
          4
	, 3
        , '계란,단호박,바닐라 익스트랙,생크림,설탕,시나몬 파우더,전분가루,크림치즈'
        , '2개,200g,5g,80g,80g,0.5t,25g,350g'
        , ''
        , ''
     );
     
INSERT
  INTO INGREDIENTS
       (
          RECIPE_NO
	, SERVINGS
        , INGREDIENT
        , QUANTITY
        , SEASONING
        , AMOUNT
      )
VALUES
      (
          5
	, 2
        , '당근,대파,떡볶이떡,마늘,사각어묵,양파'
        , '20g,30g,300g,15톨,2장,40g'
        , '간장,고추장,고춧가루,물엿,설탕'
        , '1스푼,3스푼,3스푼,3스푼,3스푼'
     );
  
   
------------------------------댓글 REPLY------------------------------
CREATE TABLE REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    RECIPE_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(50) NOT NULL,
    REPLY_CONTENT VARCHAR2(4000) NOT NULL,
    REPLY_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' NOT NULL,
    
    FOREIGN KEY (RECIPE_NO) REFERENCES RECIPE (RECIPE_NO),
    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID)
);

COMMENT ON COLUMN REPLY.REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN REPLY.RECIPE_NO IS '참조 레시피글 번호';
COMMENT ON COLUMN REPLY.USER_ID IS '회원 아이디';
COMMENT ON COLUMN REPLY.REPLY_CONTENT IS '댓글 내용';
COMMENT ON COLUMN REPLY.REPLY_DATE IS '작성일';
COMMENT ON COLUMN REPLY.STATUS IS '상태';

CREATE SEQUENCE SEQ_REPLY_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT
  INTO REPLY
       (
          REPLY_NO
        , RECIPE_NO
        , USER_ID
        , REPLY_CONTENT
        , REPLY_DATE
        , STATUS
      )
VALUES
      (
          SEQ_REPLY_NO.NEXTVAL
        , 1
        , 'user01'
        , '레시피 게시글 1번의 user01의 댓글'
        , DEFAULT
        , DEFAULT
     );

INSERT
  INTO REPLY
       (
          REPLY_NO
        , RECIPE_NO
        , USER_ID
        , REPLY_CONTENT
        , REPLY_DATE
        , STATUS
      )
VALUES
      (
          SEQ_REPLY_NO.NEXTVAL
        , 1
        , 'user02'
        , '레시피 게시글 1번의 user02의 댓글'
        , DEFAULT
        , DEFAULT
     );

INSERT
  INTO REPLY
       (
          REPLY_NO
        , RECIPE_NO
        , USER_ID
        , REPLY_CONTENT
        , REPLY_DATE
        , STATUS
      )
VALUES
      (
          SEQ_REPLY_NO.NEXTVAL
        , 2
        , 'user01'
        , '레시피 게시글 2번의 user01의 댓글'
        , DEFAULT
        , DEFAULT
     );

INSERT
  INTO REPLY
       (
          REPLY_NO
        , RECIPE_NO
        , USER_ID
        , REPLY_CONTENT
        , REPLY_DATE
        , STATUS
      )
VALUES
      (
          SEQ_REPLY_NO.NEXTVAL
        , 2
        , 'user02'
        , '레시피 게시글 2번의 user02의 댓글'
        , DEFAULT
        , DEFAULT
     );

INSERT
  INTO REPLY
       (
          REPLY_NO
        , RECIPE_NO
        , USER_ID
        , REPLY_CONTENT
        , REPLY_DATE
        , STATUS
      )
VALUES
      (
          SEQ_REPLY_NO.NEXTVAL
        , 3
        , 'user01'
        , '레시피 게시글 3번의 user01의 댓글'
        , DEFAULT
        , DEFAULT
     );


------------------------------좋아요 LIKED------------------------------     
CREATE TABLE LIKED(
    RECIPE_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(50) NOT NULL,
    
    PRIMARY KEY(RECIPE_NO,USER_ID)
);


COMMENT ON COLUMN LIKED.RECIPE_NO IS '참조 레시피글 번호';
COMMENT ON COLUMN LIKED.USER_ID IS '회원 아이디';


----------------     PRODUCT 관련     -----------------

CREATE TABLE PRODUCT(
    PRODUCT_NO NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(200) NOT NULL,
    PRICE NUMBER NOT NULL,
    SALE NUMBER NOT NULL,
    EXPLANATION VARCHAR2(4000) NOT NULL,
    LOCATION VARCHAR2(200) NOT NULL,
    PRODUCTION_DATE DATE NOT NULL,
    STOCK NUMBER NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N', 'R')),
    COUNT NUMBER DEFAULT 0 NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN PRODUCT.PRODUCT_NO IS '상품번호';
COMMENT ON COLUMN PRODUCT.PRODUCT_NAME IS '상품명';
COMMENT ON COLUMN PRODUCT.PRICE IS '상품가격';
COMMENT ON COLUMN PRODUCT.SALE IS '할인율';
COMMENT ON COLUMN PRODUCT.EXPLANATION IS '상품설명';
COMMENT ON COLUMN PRODUCT.LOCATION IS '생산지';
COMMENT ON COLUMN PRODUCT.PRODUCTION_DATE IS '생산일자';
COMMENT ON COLUMN PRODUCT.STOCK IS '재고량';
COMMENT ON COLUMN PRODUCT.STATUS IS '상품상태(Y/N/Ready)';
COMMENT ON COLUMN PRODUCT.COUNT IS '조회수';
COMMENT ON COLUMN PRODUCT.ENROLL_DATE IS '작성일';

CREATE SEQUENCE SEQ_PRODUCT_NO NOCACHE;

INSERT
  INTO PRODUCT
       (
        PRODUCT_NO
      , PRODUCT_NAME
      , PRICE
      , SALE
      , EXPLANATION
      , LOCATION
      , PRODUCTION_DATE
      , STOCK
      , STATUS
      , COUNT
      , ENROLL_DATE
      )
VALUES
      (
       SEQ_PRODUCT_NO.NEXTVAL
     , '못생겼지만 맛좋은 고구마'
     , 25000
     , 30
     , '못생긴게 더 맛있다?? 겨울대비용 고구마'
     , '전북 고창군 고창읍 고인돌공원길 75'
     , '2023-09-18'
     , 50
     , 'Y'
     , DEFAULT
     , DEFAULT
     );

INSERT
  INTO PRODUCT
       (
        PRODUCT_NO
      , PRODUCT_NAME
      , PRICE
      , SALE
      , EXPLANATION
      , LOCATION
      , PRODUCTION_DATE
      , STOCK
      , STATUS
      , COUNT
      , ENROLL_DATE
      )
VALUES
      (
       SEQ_PRODUCT_NO.NEXTVAL
     , '크기는 작지만 야무진 양파'
     , 18000
     , 10
     , '요리할 때 무조건 필요한 재료는 바로 양파!'
     , '전남 순천시 가곡길 9'
     , '2023-09-10'
     , 30
     , DEFAULT
     , DEFAULT
     , DEFAULT
     );

INSERT
  INTO PRODUCT
       (
        PRODUCT_NO
      , PRODUCT_NAME
      , PRICE
      , SALE
      , EXPLANATION
      , LOCATION
      , PRODUCTION_DATE
      , STOCK
      , STATUS
      , COUNT
      , ENROLL_DATE
      )
VALUES
      (
       SEQ_PRODUCT_NO.NEXTVAL
     , '요리에 생기를 불어 넣는 당근'
     , 15000
     , 10
     , '유기농인가요? 당근!!'
     , '강원특별자치도 강릉시 가작로 21'
     , '2023-09-28'
     , 15
     , 'Y'
     , DEFAULT
     , DEFAULT
     );

INSERT
  INTO PRODUCT
       (
        PRODUCT_NO
      , PRODUCT_NAME
      , PRICE
      , SALE
      , EXPLANATION
      , LOCATION
      , PRODUCTION_DATE
      , STOCK
      , STATUS
      , COUNT
      , ENROLL_DATE
      )
VALUES
      (
       SEQ_PRODUCT_NO.NEXTVAL
     , '울퉁불퉁 토마토'
     , 22000
     , 15
     , '울퉁불퉁 멋진몸매~가 되고 싶다면 토마토를 사세요!'
     , '경기 평택시 진위면 갈곶길 64'
     , '2023-10-10'
     , 20
     , DEFAULT
     , DEFAULT
     , DEFAULT
     );

INSERT
  INTO PRODUCT
       (
        PRODUCT_NO
      , PRODUCT_NAME
      , PRICE
      , SALE
      , EXPLANATION
      , LOCATION
      , PRODUCTION_DATE
      , STOCK
      , STATUS
      , COUNT
      , ENROLL_DATE
      )
VALUES
      (
       SEQ_PRODUCT_NO.NEXTVAL
     , '피망 친구 파프리카'
     , 12000
     , 10
     , '혈당 낮추는데에 아주 좋은 파프리카'
     , '경기 파주시 월롱면 다락고개길 8'
     , '2023-10-05'
     , 10
     , 'Y'
     , DEFAULT
     , DEFAULT
     );

-----------------------------------주문 ORDERS--------------------------------       
CREATE TABLE ORDERS (
   ORDER_NO NUMBER PRIMARY KEY,
   USER_ID VARCHAR2(50) NOT NULL,
   PRODUCT_NO NUMBER DEFAULT 0 NOT NULL,
   ORDER_DATE DATE DEFAULT SYSDATE NOT NULL,
   ORDER_CODE NUMBER DEFAULT 1 NOT NULL,
   TRACKING_NO VARCHAR2(2000),
   ADDRESS_MAIN VARCHAR2(2000) NOT NULL,
   ADDRESS_DETAIL VARCHAR2(2000) NOT NULL,
   RECEIVER VARCHAR2(50) NOT NULL,
   RECEIVER_PHONE VARCHAR2(20) NOT NULL,
   DELIVERY_MEMO VARCHAR2(2000),
   DELIVERY_FEE NUMBER DEFAULT 2500 NOT NULL,
   TOTAL_PRICE NUMBER DEFAULT 0 NOT NULL,
 
   FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID)

);

CREATE SEQUENCE SEQ_ORDERS_NO NOCACHE;

COMMENT ON COLUMN ORDERS.ORDER_NO IS '주문번호';
COMMENT ON COLUMN ORDERS.USER_ID IS '회원아이디';
COMMENT ON COLUMN ORDERS.PRODUCT_NO IS '상품번호';
COMMENT ON COLUMN ORDERS.ORDER_DATE IS '주문일자';
COMMENT ON COLUMN ORDERS.ORDER_CODE IS '1:미결제 / 2:결제완료(주문번호) / 3:배송준비중(송장번호) / 4:배송중 / 5:배송완료';
COMMENT ON COLUMN ORDERS.TRACKING_NO IS '송장번호';
COMMENT ON COLUMN ORDERS.ADDRESS_MAIN IS '배송지(주소)';
COMMENT ON COLUMN ORDERS.ADDRESS_DETAIL IS '배송지(상세)';
COMMENT ON COLUMN ORDERS.RECEIVER IS '받는사람';
COMMENT ON COLUMN ORDERS.RECEIVER_PHONE IS '받는사람 연락처';
COMMENT ON COLUMN ORDERS.DELIVERY_MEMO IS '배송 요청사항';
COMMENT ON COLUMN ORDERS.DELIVERY_FEE IS '배송비';
COMMENT ON COLUMN ORDERS.TOTAL_PRICE IS '총 주문 금액';


--------------------주문 상세 ORDERS_DETAIL--------------------
CREATE TABLE ORDERS_DETAIL(
    ORDER_NO NUMBER NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    QUANTITY NUMBER DEFAULT 0 NOT NULL,
    
    FOREIGN KEY (ORDER_NO) REFERENCES ORDERS (ORDER_NO),
    FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO)
);

COMMENT ON COLUMN ORDERS_DETAIL.ORDER_NO IS '주문번호';
COMMENT ON COLUMN ORDERS_DETAIL.PRODUCT_NO IS '상품번호';
COMMENT ON COLUMN ORDERS_DETAIL.QUANTITY IS '구매수량';

----------------     ATTACHMENT 관련     -----------------

CREATE TABLE ATTACHMENT(
    FILE_NO NUMBER PRIMARY KEY,
    REF_PNO NUMBER NOT NULL,
    ORIGIN_NAME VARCHAR2(200) NOT NULL,
    CHANGE_NAME VARCHAR2(200) NOT NULL,
    FILE_EXP VARCHAR2(4000) NOT NULL,
    UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    FILE_LEVEL NUMBER DEFAULT 1 NOT NULL,
    
    FOREIGN KEY (REF_PNO) REFERENCES PRODUCT (PRODUCT_NO)
);

COMMENT ON COLUMN ATTACHMENT.FILE_NO IS '파일번호';
COMMENT ON COLUMN ATTACHMENT.REF_PNO IS '참조상품번호';
COMMENT ON COLUMN ATTACHMENT.ORIGIN_NAME IS '파일원본명';
COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS '파일수정명';
COMMENT ON COLUMN ATTACHMENT.FILE_EXP IS '파일설명';
COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '파일업로드일';
COMMENT ON COLUMN ATTACHMENT.STATUS IS '파일상태';
COMMENT ON COLUMN ATTACHMENT.FILE_LEVEL IS '파일레벨';

CREATE SEQUENCE SEQ_ATTACHMENT_NO NOCACHE;


----------------     REVIEW 관련     -----------------

CREATE TABLE REVIEW(
    REVIEW_NO NUMBER PRIMARY KEY,
    REF_PNO NUMBER NOT NULL,
    USER_ID VARCHAR2(50) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    REVIEW_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),

    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID),
    FOREIGN KEY (REF_PNO) REFERENCES PRODUCT (PRODUCT_NO)
);

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '후기번호';
COMMENT ON COLUMN REVIEW.REF_PNO IS '참조상품번호';
COMMENT ON COLUMN REVIEW.USER_ID IS '회원아이디';
COMMENT ON COLUMN REVIEW.CONTENT IS '후기내용';
COMMENT ON COLUMN REVIEW.REVIEW_DATE IS '작성일';
COMMENT ON COLUMN REVIEW.STATUS IS '후기상태';

CREATE SEQUENCE SEQ_REVIEW_NO NOCACHE;

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 1, 'admin', '여러분! 못생겼지만 무진장 맛있습니다!', '20231008', DEFAULT);

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 1, 'user01', '파손없이 싱싱한 채소 잘 받았습니다ㅎㅎ 감사합니다!', '20231008', DEFAULT);

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 1, 'user02', '훨씬 저렴한 가격에 잘 산 것 같아요! 자주 이용할게요', '20231008', DEFAULT);

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 2, 'admin', '관리자도 내돈내산ㅎㅎ', '20231008', DEFAULT);

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 2, 'user01', '상품상태가 너무 좋네요! 당장 구독하러 가야것네요!', '20231008', DEFAULT);



--------------------장바구니 관련--------------------
CREATE TABLE CART(
    USER_ID VARCHAR2(50) NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    QUANTITY NUMBER DEFAULT 0 NOT NULL,
    
    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID),
    FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO)
);

COMMENT ON COLUMN CART.USER_ID IS '회원아이디';
COMMENT ON COLUMN CART.PRODUCT_NO IS '상품번호';
COMMENT ON COLUMN CART.QUANTITY IS '상품수량';

---------------------------- QA 관련 ------------------

CREATE TABLE QA(
    QA_NO NUMBER PRIMARY KEY,
    QA_CATEGORY VARCHAR2(500) NOT NULL,
    USER_ID VARCHAR2(50) NOT NULL,
    A_ID VARCHAR2(50),
    Q_TITLE VARCHAR2(500) NOT NULL,
    Q_CONTENT VARCHAR2(4000) NOT NULL,
    A_CONTENT VARCHAR2(4000),
    Q_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (Q_STATUS IN('Y', 'N')) ,
    A_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (A_STATUS IN('Y', 'N')) ,
    Q_DATE DATE DEFAULT SYSDATE,
    A_DATE DATE DEFAULT SYSDATE,
    
    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID)
);

COMMENT ON COLUMN QA.QA_NO IS '글번호';
COMMENT ON COLUMN QA.QA_CATEGORY IS '카테고리';
COMMENT ON COLUMN QA.USER_ID IS '회원아이디';
COMMENT ON COLUMN QA.A_ID IS '답변자 아이디';
COMMENT ON COLUMN QA.Q_TITLE IS '질문글 제목';
COMMENT ON COLUMN QA.Q_CONTENT IS '질문글 내용';
COMMENT ON COLUMN QA.A_CONTENT IS '답변글 내용';
COMMENT ON COLUMN QA.Q_STATUS IS '문의상태';
COMMENT ON COLUMN QA.A_STATUS IS '답변상태';
COMMENT ON COLUMN QA.Q_DATE IS '문의작성일';
COMMENT ON COLUMN QA.A_DATE IS '답변작성일';

CREATE SEQUENCE SEQ_QA_NO NOCACHE;

INSERT
  INTO QA
VALUES (SEQ_QA_NO.NEXTVAL,1,'user01','admin','제품 파손시 보상에 관련하여 질문있습니다.','제품이 손상된채로 배송이 왔는데 이에관련한 보상정책이 궁금합니다.','보상정책관련한 내용은 자주묻는질문에 답변이 있습니다. 이 점 참고하여 주세요!',DEFAULT,DEFAULT,'20231008','20231009');
INSERT
  INTO QA
VALUES (SEQ_QA_NO.NEXTVAL,2,'user02','admin','배송 관련하여 질문있습니다.','배송시에 신선도 관련하여 질문사항있습니다.','저희 못난이 맛난이는 신선도를 위하여 얼음팩을 빵빵하게 넣으드리고 있습니다.',DEFAULT,DEFAULT,'20231005','20231009');
INSERT
  INTO QA
VALUES (SEQ_QA_NO.NEXTVAL,3,'user01','admin','구독 관련하여 질문있습니다.','구독 장기이용시 혜택이 있나요?','구독 관련글을 참조해주세요!',DEFAULT,DEFAULT,'20231006','20231009');

--------------------공지사항 관련--------------------
CREATE TABLE NOTICE(
    NOTICE_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(50) NOT NULL,
    NOTICE_TITLE VARCHAR2(500) NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    UPFIX VARCHAR(5) DEFAULT 'Y' CHECK (UPFIX IN('Y', 'N')),
    
    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID)
);

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '글번호';
COMMENT ON COLUMN NOTICE.USER_ID IS '작성자';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '글제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '글내용';
COMMENT ON COLUMN NOTICE.STATUS IS'상태';
COMMENT ON COLUMN NOTICE.UPFIX IS'상단고정여부';

CREATE SEQUENCE SEQ_NOT_NO NOCACHE;

INSERT
 INTO NOTICE
VALUES (SEQ_NOT_NO.NEXTVAL,'admin','못난이맛난이 사이트가 개설되었습니다.','OO월OO일로 개설되었습니다.',DEFAULT,DEFAULT);
INSERT
 INTO NOTICE
VALUES (SEQ_NOT_NO.NEXTVAL,'admin','못난이 맛난이 구독기능이 개설되었습니다.','많은 이용부탁드려요.',DEFAULT,DEFAULT);
INSERT
 INTO NOTICE
VALUES (SEQ_NOT_NO.NEXTVAL,'admin','시연쌤은 신인가?','바로여신',DEFAULT,'N');

------------------------------구독 SUBSCRIBE---------------------------------------------------

CREATE TABLE SUBSCRIBE (
   USER_ID VARCHAR2(50) PRIMARY KEY,
   START_DATE DATE DEFAULT SYSDATE NOT NULL,
   END_DATE DATE NOT NULL,
   BOX_SIZE VARCHAR2(5) NOT NULL,
   TERM VARCHAR2(5) NOT NULL,
   STATUS VARCHAR2(5) DEFAULT 'Y' NOT NULL,
   DISLIKE VARCHAR2(2000),
   ADDRESS VARCHAR2(2000) NOT NULL,
   DETAIL_ADDRESS VARCHAR2(2000) NOT NULL
    
    
    );
    
     INSERT INTO SUBSCRIBE
    (
        USER_ID
    ,   START_DATE
    ,   END_DATE
    ,   BOX_SIZE
    ,   TERM
    ,   STATUS
    ,   DISLIKE
    ,  ADDRESS
    ,  DETAIL_ADDRESS  
    )
    VALUES
    (
        'admin'
       ,SYSDATE
       ,SYSDATE+30
       ,1
       ,2
       ,'Y'
       ,'당근,사과,오이'
	,'서울시'
	,'강남구'
       );
    
     INSERT INTO SUBSCRIBE
    (
       USER_ID
    ,   START_DATE
    ,   END_DATE
    ,   BOX_SIZE
    ,   TERM
    ,   STATUS
    ,   DISLIKE
    ,  ADDRESS
    ,  DETAIL_ADDRESS  
    )
    VALUES
    (
        'user01'
       ,SYSDATE
       ,SYSDATE+30
       ,2
       ,1
       ,'Y'
       ,'배,당근,가지'
,'서울시'
	,'강남구'
       );
    
     INSERT INTO SUBSCRIBE
    (
       USER_ID
    ,   START_DATE
    ,   END_DATE
    ,   BOX_SIZE
    ,   TERM
    ,   STATUS
    ,   DISLIKE
    ,  ADDRESS
    ,  DETAIL_ADDRESS  
    )
    VALUES
    (
        'user02'
       ,SYSDATE
       ,SYSDATE+30
       ,1
       ,3
       ,'Y'
       ,'사과'
,'서울시'
	,'강남구'
       );
       
        INSERT INTO SUBSCRIBE
    (
        USER_ID
    ,   START_DATE
    ,   END_DATE
    ,   BOX_SIZE
    ,   TERM
    ,   STATUS
    ,   DISLIKE
    ,  ADDRESS
    ,  DETAIL_ADDRESS  
    )
    VALUES
    (
        'user03'
       ,SYSDATE
       ,SYSDATE+30
       ,2
       ,1
       ,'Y'
       ,'당근'
,'서울시'
	,'강남구'
       );
       
        INSERT INTO SUBSCRIBE
    (
       USER_ID
    ,   START_DATE
    ,   END_DATE
    ,   BOX_SIZE
    ,   TERM
    ,   STATUS
    ,   DISLIKE
    ,  ADDRESS
    ,  DETAIL_ADDRESS  
    )
    VALUES
    (
        'user04'
       ,SYSDATE
       ,SYSDATE+30
       ,1
       ,2
       ,'Y'
       ,'오이'
,'서울시'
	,'강남구'
       );
    



----------------------------구성품 SUB_COMP-------------------------

CREATE TABLE SUB_COMP(
    COMP_NO NUMBER PRIMARY KEY,
    COMP_NAME VARCHAR2(50) NOT NULL
    );
    
CREATE SEQUENCE SEQ_COMP_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 99999999999
NOCYCLE
NOCACHE;

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'양파'
    );
INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'손질대파'
    );
    
    INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'통마늘'
    );
    
    INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'꽈리고추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'적양파'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'쪽파'
    );


INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'깐마늘'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'풋고추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'줄기양파'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'중파'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'오이고추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'청양고추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'대파'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'부추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'풋마늘'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'당조고추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'사과'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'배'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'복숭아'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'참외'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'대추단감'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'라임'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'감귤'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'카라향'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'황금향'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'레드향'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'한라봉'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'미니사과'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'레드키위'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'골드키위'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'그린키위'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'레몬'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'그린레몬'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'체리'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'사과대추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'블루베리'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'자두'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'천혜향'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'시금치'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'얼갈이배추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'버터헤드레터스'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'양배추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'미니 양배추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'로마네스크'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'케일'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'적상추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'아이스플랜트'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'적겨자'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'깻잎'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'김장배추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'청경채'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'청근대'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'적양배추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'양배추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'쑥갓'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'열무'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'청상추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'봄동'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'브로콜리니'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'알배추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'비타민'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'적근대'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'방울 양배추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'고깔 양배추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'베이비브로콜리'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'콜리플라워'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'포기상추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'프릴드아이스'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'청치커리'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'쌈배추'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'청겨자'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'아욱'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'브로콜리'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'청치콘'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'적치커리'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'로메인'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'비트잎'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'적치콘'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'생채잎'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'감자'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'호박고구마'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'옐로우비트'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'레디쉬'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'홍감자'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'달수고구마'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'순무'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'레인보우비트'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'당근'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'레드비트'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'우엉'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'콜라비'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'밤고구마'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'슈가비트'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'무'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'연근'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'미니새송이버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'주니어새송이버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'느타리버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'애느타리버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'흰양송이버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'송화버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'브라운양송이버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'표고버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'팽이버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'흰만가닥버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'참송이버섯'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'달래'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'숙주나물'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'콜나물'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'두릅'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'미나리'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'미니단호박'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'완숙토마토'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'애호박'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'가시오이'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'절단만차량'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'방울토마토'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'쥬키니호박'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'미니파프리카'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'땅콩단호박'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'파프리카'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'가지'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'풋호박'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'피망'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'다다기오이'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'취청오이'
    );

CREATE TABLE SUB_HISTORY(
    HIS_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(50) NOT NULL,
    COMP_NO1 NUMBER NOT NULL,
    COMP_NO2 NUMBER,
    COMP_NO3 NUMBER,
    COMP_NO4 NUMBER,
    COMP_NO5 NUMBER,
    HIS_DATE DATE DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID),
    FOREIGN KEY (COMP_NO1) REFERENCES SUB_COMP(COMP_NO)
    );
    
     CREATE SEQUENCE SEQ_HISTORY_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 99999999999
NOCYCLE
NOCACHE;
    
    
    INSERT INTO SUB_HISTORY
(
    HIS_NO
   ,USER_ID
   ,COMP_NO1
   ,COMP_NO2
   ,COMP_NO3
   ,COMP_NO4
   ,COMP_NO5
   ,HIS_DATE
   )
   VALUES
   (
    SEQ_HISTORY_NO.NEXTVAL
    ,'admin'
    ,1
    ,2
    ,3
    ,4
    ,5
    ,SYSDATE
    );

INSERT INTO SUB_HISTORY
(
    HIS_NO
   ,USER_ID
   ,COMP_NO1
   ,COMP_NO2
   ,COMP_NO3
   ,COMP_NO4
   ,COMP_NO5
   ,HIS_DATE
   )
   VALUES
   (
    SEQ_HISTORY_NO.NEXTVAL
    ,'user01'
    ,1
    ,2
    ,3
    ,4
    ,5
    ,SYSDATE
    );
    
    INSERT INTO SUB_HISTORY
(
    HIS_NO
   ,USER_ID
   ,COMP_NO1
   ,COMP_NO2
   ,COMP_NO3
   ,COMP_NO4
   ,COMP_NO5
   ,HIS_DATE
   )
   VALUES
   (
    SEQ_HISTORY_NO.NEXTVAL
    ,'user02'
    ,1
    ,2
    ,3
    ,4
    ,5
    ,SYSDATE
    );
    
    INSERT INTO SUB_HISTORY
(
    HIS_NO
   ,USER_ID
   ,COMP_NO1
   ,COMP_NO2
   ,COMP_NO3
   ,COMP_NO4
   ,COMP_NO5
   ,HIS_DATE
   )
   VALUES
   (
    SEQ_HISTORY_NO.NEXTVAL
    ,'user03'
    ,1
    ,2
    ,3
    ,4
    ,5
    ,SYSDATE
    );
    
    INSERT INTO SUB_HISTORY
(
    HIS_NO
   ,USER_ID
   ,COMP_NO1
   ,COMP_NO2
   ,COMP_NO3
   ,COMP_NO4
   ,COMP_NO5
   ,HIS_DATE
   )
   VALUES
   (
    SEQ_HISTORY_NO.NEXTVAL
    ,'user04'
    ,1
    ,2
    ,3
    ,4
    ,5
    ,SYSDATE
    );



------------------------QA_CATEGORY

CREATE TABLE QA_CATEGORY(
    CATEGORY_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(50)
);

INSERT INTO QA_CATEGORY VALUES(1,'상품문의');
INSERT INTO QA_CATEGORY VALUES(2,'배송문의');
INSERT INTO QA_CATEGORY VALUES(3,'주문/취소문의');
INSERT INTO QA_CATEGORY VALUES(4,'반품/교환문의');
INSERT INTO QA_CATEGORY VALUES(5,'주문/결제');
INSERT INTO QA_CATEGORY VALUES(6,'정기구독문의');
INSERT INTO QA_CATEGORY VALUES(7,'쿠폰/적립금');
INSERT INTO QA_CATEGORY VALUES(8,'회원정보관련');
INSERT INTO QA_CATEGORY VALUES(9,'기타문의');


commit;
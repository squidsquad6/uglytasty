# 못난이맛난이 UGLYTASTY 🥕🥦🥔🍎
<img src="https://github.com/squidsquad6/uglytasty/assets/145431108/f4b8c61c-9653-4845-b87c-551f11857bef"  width="500" height="120"/>  

### 🖥 About Project
못난이 농산물 판매로 환경, 판매자, 소비자 모두에게 순기능을 발생시키기고 구매한 채소를 활용할 수 있는 레시피를 제공하여 소비자로 하여금 그러한 순기능을 더욱 극대화할 수 있는 웹 사이트 구현  
<br/><br/>
<br/><br/>

### 📚 Background Story
규격 외 농산물들은 맛도 영양도 다를 바 없지만, 크기가 조금 작거나 크거나 개성 있다는 이유로 적절한 판로를 찾기가 어렵습니다. 이러한 규격 외 농산물의 폐기는 유통과 소비 모든 단계에서 사회적 손실을 야기합니다.
이에 저희는 ‘못난이 농산물’이라고 불리며 폐기되는 규격 외 농산물들을 판매하고, 이러한 농산물을 활용해 직접 요리할 수 있는 레시피를 제공하는 사이트를 만들고자 했습니다.  
<br/><br/>
<br/><br/>

### 💡 Features
- 소셜 로그인(카카오, 네이버, 구글)
- 메인 페이지 (생산자 납품 문의)
- 못난이 농산물 구독 서비스
- 못난이 농산물 단품 마켓 / 장바구니
- 못난이 농산물 활용 레시피 게시판, 댓글
- 구독 서비스 및 상품 결제 : API를 활용한 결제 서비스
- 주소 찾기 API 활용(회원가입, 상품 주문, 상품 등록)
- 지도 API 활용(상품 등록)
- 먹비티아이 : 맞춤 서비스 제공 및 재미 요소
- 고객 센터(1:1 문의, 공지사항)
- 관리자 페이지 (엑셀 업로드 / 다운로드)
<br/><br/>
<br/><br/>

### ERD
![erd](https://github.com/squidsquad6/uglytasty/assets/145431108/8c5eb9b1-1226-4917-8495-94df52288fbd)  
<br/><br/>
<br/><br/>

### 기술별 설명
## ⭐메인 페이지⭐
#### - 어바웃어스(못난이맛난이 사이트 소개) 및 생산자 납품 문의
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/sujin/%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80(%EC%83%9D%EC%82%B0%EC%9E%90%EB%82%A9%ED%92%88%EB%AC%B8%EC%9D%98).gif?raw=true">
<br/><br/> 
<br/><br/>


## ⭐로그인⭐
#### - 일반 로그인 및 소셜 로그인 서비스 제공
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A1%9C%EA%B7%B8%EC%9D%B8%20%ED%8E%98%EC%9D%B4%EC%A7%80%20%EC%BA%A1%EC%B3%90%20-%20%EC%86%8C%EC%85%9C%EB%A1%9C%EA%B7%B8%EC%9D%B8%20%EC%84%9C%EB%B9%84%EC%8A%A4%20%EC%A0%9C%EA%B3%B5.png?raw=true">
<br/><br/> 
<br/><br/>


## ⭐회원가입⭐
#### - 아이디 중복 체크
ajax를 활용하여 아이디 중복 체크 기능 구현
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%20%EC%95%84%EC%9D%B4%EB%94%94%20%EC%A4%91%EB%B3%B5%20%EC%B2%B4%ED%81%AC.gif?raw=true">
<br/><br/>

#### - 이메일 인증
비활성화 상태인 회원가입 버튼이 이메일 인증이 완료되면 활성화
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%20-%20%EC%9D%B4%EB%A9%94%EC%9D%BC%20%EC%9D%B8%EC%A6%9D.gif?raw=true">
<br/><br/>

#### - 주소 찾기 API 활용
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%20%EC%A3%BC%EC%86%8C%20%EC%B0%BE%EA%B8%B0%20API.gif?raw=true">
<br/><br/>
<br/><br/>


## ⭐못난이 단품 게시판⭐
#### - 상품 전체 리스트 조회 : 상품 키워드 검색 & 최신순/인기순/가격낮은순 조회
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/sujin/%EB%8B%A8%ED%92%88_%EC%A0%84%EC%B2%B4%EB%A6%AC%EC%8A%A4%ED%8A%B8.gif?raw=true">
<br/><br/>

#### - 상품 등록
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/sujin/%EB%8B%A8%ED%92%88_%EC%83%81%ED%92%88-%EB%93%B1%EB%A1%9D.gif?raw=true">
<br/><br/>

#### - 상품 상세 페이지 (생산지 : 지도 API)
#### - 상품 후기 댓글 & 레시피
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/sujin/%EB%8B%A8%ED%92%88_%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%80_%EB%8C%93%EA%B8%80_%EB%A0%88%EC%8B%9C%ED%94%BC_.gif?raw=true">
<br/><br/>

#### - 상품 수정
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/sujin/%EB%8B%A8%ED%92%88_%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%80_%EC%88%98%EC%A0%95_.gif?raw=true">
<br/><br/>

#### - 상품 일시품절 / 재입고
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/sujin/%EB%8B%A8%ED%92%88_%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%80_%EC%9D%BC%EC%8B%9C%ED%92%88%EC%A0%88_%EC%9E%AC%EC%9E%85%EA%B3%A0_.gif?raw=true">
<br/><br/>
<br/><br/>


## ⭐장바구니⭐
#### - 전체 선택 / 선택 상품 삭제
#### - 수량(max값 : 재고량) 변경
#### - 선택 상품 주문하기
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/sujin/%EC%9E%A5%EB%B0%94%EA%B5%AC%EB%8B%88.gif?raw=true">
<br/><br/>
<br/><br/>


## ⭐주문하기 + 결제하기⭐
#### - 배송정보 (주소 API)
#### - 결제하기 (toss API)
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/sujin/%EC%A3%BC%EB%AC%B8%ED%95%98%EA%B8%B0_%EA%B2%B0%EC%A0%9C%ED%95%98%EA%B8%B0.gif?raw=true">
<br/><br/>
<br/><br/>


## ⭐맛난이 레시피 게시판⭐
#### - 게시글 리스트 조회 : 최신순/조회순 정렬
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A0%88%EC%8B%9C%ED%94%BC%20-%20%EA%B2%8C%EC%8B%9C%EA%B8%80%20%EC%A1%B0%ED%9A%8C%20(%EC%B5%9C%EC%8B%A0%EC%88%9C,%20%EC%A1%B0%ED%9A%8C%EC%88%9C).gif?raw=true">
<br/><br/>

#### - 게시글 키워드 검색
게시글 제목 또는 해당 게시글 음식의 재료 목록에 사용자가 입력한 키워드가 포함되어 있는 게시글 목록 조회 가능
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A0%88%EC%8B%9C%ED%94%BC%20-%20%ED%82%A4%EC%9B%8C%EB%93%9C%20%EA%B2%80%EC%83%89.gif?raw=true">
<br/><br/>

#### - 게시글 작성/수정/삭제
화면단과 서버단에서 재료와 수량을 각각 쉼표 구분자로 이은 문자열로 넘기고 받도록 구현
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A0%88%EC%8B%9C%ED%94%BC%20-%20%EA%B2%8C%EC%8B%9C%EA%B8%80%20%EC%9E%91%EC%84%B1,%EC%88%98%EC%A0%95,%EC%82%AD%EC%A0%9C.gif?raw=true">
<br/><br/> 

#### - 게시글 댓글 작성 및 삭제
댓글 작성 기능을 ajax로 구현
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A0%88%EC%8B%9C%ED%94%BC%20-%20%EB%8C%93%EA%B8%80%20%EC%9E%91%EC%84%B1,%20%EC%82%AD%EC%A0%9C.gif?raw=true">
<br/><br/> 

#### - 게시글 좋아요 기능
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A0%88%EC%8B%9C%ED%94%BC%20-%20%EC%A2%8B%EC%95%84%EC%9A%94.gif?raw=true">
<br/><br/>
<br/><br/>


## ⭐먹비티아이⭐
#### - 재미 요소를 통해 못난이맛난이 회원이 되도록 유도하는 테스트
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/sujin/%EB%A8%B9%EB%B9%84%ED%8B%B0%EC%95%84%EC%9D%B4.gif?raw=true">
<br/><br/>
<br/><br/>


## ⭐마이페이지⭐
#### - 회원정보 조회 및 변경 : 이메일 인증 후 가능
비활성화 되어있던 회원정보 수정 버튼을 이메일 인증 성공 후 활성화되도록 구현
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80%20-%20%ED%9A%8C%EC%9B%90%EC%A0%95%EB%B3%B4%20%EC%9D%B4%EB%A9%94%EC%9D%BC%EC%9D%B8%EC%A6%9D.gif?raw=true">
<br/><br/>

#### - 비밀번호 변경 : 암호화
사용자가 비밀번호 확인란에 입력한 비밀번호와 DB에 암호화되어 저장된 비밀번호를 비교 후 일치할 경우에만 비밀번호 변경 가능   
일치한다면 사용자가 새로운 비밀번호 입력란에 입력한 비밀번호를 다시 암호화 하여 DB에 저장
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80%20-%20%EB%B9%84%EB%B0%80%EB%B2%88%ED%98%B8%20%EB%B3%80%EA%B2%BD.gif?raw=true">
<br/><br/> 

#### - 주문 및 배송 조회
주문 번호 별 주문 내역 조회 가능, 주문 번호 클릭시 해당 주문 번호의 주문자 정보, 품목, 가격 등 상세 내용 확인 가능
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80%20-%20%EC%A3%BC%EB%AC%B8%20%EB%B0%B0%EC%86%A1%20%EC%A1%B0%ED%9A%8C.gif?raw=true">
<br/><br/> 

#### - 찜한 레시피
로그인한 사용자가 좋아요 한 레시피 목록 조회 가능, 게시글 클릭시 해당 게시글 상세 페이지로 이동
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80%20-%20%EC%B0%9C%ED%95%9C%20%EB%A0%88%EC%8B%9C%ED%94%BC.gif?raw=true">
<br/><br/> 

#### - 1:1 문의 게시판
로그인한 사용자가 작성한 1:1 문의 게시글 조회 가
<img src="https://github.com/squidsquad6/uglytasty/blob/main/uglytasty/src/main/webapp/resources/readmeImages/yuri/%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80%20-%201%EB%8C%801%20%EB%AC%B8%EC%9D%98.gif?raw=true">
<br/><br/> 





*양식(리드미 작성 완료 후 지울 예정)*
## ⭐양식⭐
#### - 기능
(간단 설명)
<img src="">
<br/><br/> 
<br/><br/>
(별표시 메뉴 사이에는 br 두 줄, - 메뉴 사이에는 br 한 줄)







### 🛠 Technology Stack
<div style="display:flex; flex-direction:row;">
    <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=Java&logoColor=white"> 
    <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> 
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> 
    <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> 
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> 
    <br>
    <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black">
 <img src="https://img.shields.io/badge/visual studio code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white">
    <br>
      <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
    <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
    <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
    <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
</div> 



### 👨‍👩‍👧‍👦 Team Members
정유리 이수진 최연우  

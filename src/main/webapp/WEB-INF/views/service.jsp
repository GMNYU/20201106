<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/includes/header.jsp"%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>서비스 페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/resources/css/reset.css">
  <link rel="stylesheet" href="/resources/css/service_style.css">
  <link href="/resources/mcss/service_mStyle.css" media="screen and (max-width: 425px)" rel="stylesheet">
  <link href="/resources/tcss/service_tStyle.css" media="screen and (min-width: 426px) and (max-width: 768px)" rel="stylesheet">

</head>
<body>
	<section>
	<!-- 멤버쉽 시작 -->
	<div id="membership">
		<div id="membershipGuide">
			<h2>마이 스타 리워드</h2>
			<br><br>
			<p>마이 스타 리워드는 FOUR커피를 사랑해 주시는 
			고객님을 위하여 별을 적립하여 혜택으로 돌려드리는 서비스입니다.<br>
			등록된 카드를 매장에서 사용해 보세요. FOUR커피의 또다른 즐거움을 느끼실수 있습니다!</p>
		</div>
		<div id="levelGuide">
			<div id="benefit1">
				<p class="count">0</p>
				<h2 class="levelName">Welcome Level</h2>
				<p class="condition">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카드를 등록하세요</p>
				<div class="bnfTextbox">
					<ul>
					<li> - FOUR커피 카드로 음료 구매 시, Free Extra 1개 제공
					<li> - FOUR커피 카드로 결제 시, 현금영수증 자동 발행
					<li> - 분실 신고 시점의 카드 잔액 보호
					<li> - 자동 충전 5만원 이상 설정 후, 자동 충전 발생 시마다 쿠폰 제공
						<span id="bnf1span">(충전 금액 합산은 적용되지 않습니다.)</span>
					</ul>
				</div>
			</div>

			<div id="benefit2">
				<p class="count">5</p>
				<h2 class="levelName">&nbsp;Green Level</h2>
				<p class="condition">&nbsp;&nbsp;별 5개 적립시 레벨업!</p>
				<div class="bnfTextbox">
					<ul>
						<li> <span style="color: black; font-weight: bolder;">Welcome Level</span> 혜택 모두 포함
						<li> - 생일 축하 무료 음료 e-쿠폰 제공
						<li> - 리저브™ 원두 구매 시, 리저브™ 음료 or 카페 아메리카노(Hot/Iced) e-쿠폰 제공
						<li> - 카페 아메리카노(Hot/Iced) e-쿠폰 제공
						<li> - 신규 음료수 1+1 e-쿠폰
						<li> - 회원 전용 이벤트
					</ul>
				</div>		
			</div>
			
			<div id="benefit3">
				<p class="count">30</p>
				<h2 class="levelName">&nbsp;&nbsp;Gold Level</h2>
				<p class="condition">별 12개 적립시 무료 음료 1잔!</p>
				<div class="bnfTextbox"  id="goldBnf">
					<ul>
						<li><span style="color: green; font-weight: border;">Green Level</span> 혜택 모두 포함
						<li> - 골드회원만의 e-Gold Card 발급
						<li> - 별 ★ 12개 적립 시마다 무료 음료 쿠폰 제공
						<li> - Personalized Offer e-쿠폰 제공
					</ul>
				</div>
							
			</div>
		</div>
	</div>
	<!-- 멤버쉽 종료 -->
	
	<!-- 카드 시작 -->
	<div id="card">
		<div id="cardGuide">
			<h2>FOUR 커피만의 특별함, <span>FOUR커피 카드를 소개합니다</span></h2>
		</div>
		<div id="cardBenefit">
			<h2>카드 혜택</h2>
			<ul>
				<li>카드 가입시 설정한 생일에 당일 사용 가능한 무료 쿠폰을 보내 드립니다.
				<li>음료 한 잔 당 (샷, 시럽, 휘핑, 자바칩 등)1개가 무료로 제공됩니다.
				<li>자바칩은 프라푸치노/블렌디드 음료 주문 시에만 추가할 수 있습니다
			</ul>
		</div>
		<div id="cardSale">
			<h2>카드 가입 방법</h2>
			<p>가까운 매장의 파트너에게 문의 하거나 키오스크를 이용 부탁드립니다.
			<br><br><br>
			<h2 id="h2Second">카드 사용 방법</h2>
			<ul>
				<li>충전, 재충전, 결제 가능 매장 : 전국 매장
				<li>충전 불가 매장(결제만 가능) : 백화점 및 시즌 매장 등 일부 매장 
				<li>충전 및 결제 불가 매장 : 매장 이름 입력
				<li>국외에서 발행한 카드는 국내 사용이 불가합니다.
			</ul>
		</div>
		<div id="cardCharge">
			<h2>카드 충전 정보</h2>
			<ul>
				<li><p style="font-weight: bold; font-size: 15px;">매장의 키오스크를 이용하여 충전이 가능합니다.</p> 
				<li>최초 충전 금액 및 단위 : 5,000원~500,000원 (1만원 이상부터는 만원 단위로 충전가능)
				<li>재충전 금액 및 단위 : 10,000원~550,000원 (만원 단위/최대 잔액 55만원 내에서 선택가능)
				<li>5000원 이상 최초충전 시에만 카드를 증정하며, 충전되지 않은 카드는 별도 판매하지 않습니다.
				<li>신용카드로 충전 시, 청구서상에는 상품권 유형으로 표시됩니다.
				<li>할인 가능한 신용카드로 카드 충전 시, 할인이 적용되지 않습니다.
			</ul>
		</div>
	</div>
	<!-- 카드 종료 -->
	</section>
</body>
</html>
<%@ include file="../views/includes/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="/css/store.css">
<link rel="stylesheet" href="/css/cart.css">
<script>
	function cartDelete(cartno){
		if(confirm("해당 상품을 삭제할까요?")){
			//또다른 방법<form action='/cart/delete'></form>
			//또다른 방법(RESTful) location.href='/cart/delete' + cartno;
			location.href='/cart/delete?cartno=' + cartno;
		}//if end
	}//cartDelete() end
</script>

<!-- contents 시작 -->
<div id="contents">
  	<div id="divAction"><!-- header와 body사이에 있는 빨간 라인 -->
  	<div class="tit-evt">
  		<h3>장바구니 리스트</h3>
  	</div>
  	
  	<!-- category_wrap 시작 -->
  	<div class="category_wrap">
  		<div class="category_contents_wrap">
  			<ul class="category_content">
  				<li id="cm1" name="categorymenu">
   					<a href="/product/category.do?product_category_id=1">패키지</a>
   				</li>
   				<li id="cm2" name="categorymenu">
   					<a href="/product/category.do?product_category_id=2">영화관람권</a>
   				</li>
   				<li id="cm3" name="categorymenu">
   					<a href="/product/category.do?product_category_id=3">콤보</a>
   				</li>
   				<li id="cm4" name="categorymenu">
   					<a href="#">팝콘</a>
   				</li>
   				<li id="cm5" name="categorymenu">
   					<a href="#">음료</a>
   				</li>
   				<li id="cm6" name="categorymenu">
   					<a href="#">스낵</a>
   				</li>
   				<li id="cm7" name="categorymenu">
   					<a href="#">플레이존</a>
   				</li>
  			</ul>
  			<ul class="cart_content">
  				<li>
  					<a href="/cart/list.do">장바구니<span id="cartviewcnt">0</span></a>
  				</li>
  			</ul>
  		</div>
  	</div>
  	<!-- category_wrap 끝 -->
  	
	<!-- cart_wrap 시작 -->
	<div class="cart_step_wrap">
		<ul class="cart_step step_unit3">
			<li class="step1 active"><span>STEP 01</span><strong>장바구니</strong></li>
			<li class="step2"><span>STEP 02</span><strong>결제하기</strong></li>
			<li class="step3"><span>STEP 03</span><strong>결제완료</strong></li>
		</ul>
	</div>
	<div class="row">
		<form name="cartfrm" id="cartfrm" method="post">
		<input type="hidden" name="cartno" value="${cartno.cart_payment_id}">
		<table class="com_cart_list_wrap">
		    <thead>
		      <tr class="thead_wrap">
		        <th><strong>상품명</strong></th>
		        <th><strong>판매금액</strong></th>
		        <th><strong>수량</strong></th>
		        <th><strong>구매금액</strong></th>
		        <th><strong>선택</strong></th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr class="tbody_wrap">
		        <td>${row.payment_price}</td>
				<td>${row.payment_price}</td>
				<td>${row.product_count}</td>
				<td>${row.payment_price}</td>
				<td>
					<input type="button" value="삭제" onclick="cartDelete(${row.cart_payment_id})">
				</td>
		      </tr>
		    </tbody>
		</table>
		<span id="notimsg">장바구니에 담긴 상품은 최대 30일까지 보관됩니다.</span>
		<table class="com_cart_total_price_wrap" summary="총 상품 금액, 할인금액을 합산한 총 결제예정 금액 표기">
			<colgroup>
				<col style="width: 30%">
				<col style="width: 36%">
				<col style="width: 34%">
			</colgroup>
			<thead>
		      <tr class="thead_wrap">
		        <th>총 상품 금액</th>
		        <th>할인금액</th>
		        <th>총 결제 예정금액</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr class="tbody_wrap">
		        <td>${row.payment_price}</td>
				<td>0원</td>
				<td>${row.payment_price}</td>
		      </tr>
		    </tbody>
		</table>
			<input type="button" value="구매하기" id="cartButton" onclick="location.href='/order/confirm.do'">
		</form>
	</div>
	<!-- cart_wrap 끝 -->
	</div>
</div>
<!-- contents 끝 -->   
<%@ include file="../footer.jsp" %>
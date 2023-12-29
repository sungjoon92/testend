<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="/css/store.css">

   <!-- contents 시작 -->
   <div id="contents">
   	<div id="divAction"></div> <!-- header와 body사이에 있는 빨간 라인 -->
   	<div class="tit-evt">
   		<h3>스토어</h3>
   	</div>
   	
   	<!-- category_wrap 시작 -->
   	<div class="category_wrap" style="left:0px;">
   		<div class="category_contents_wrap">
   			<ul class="category_content">
   				<li id="cm1" name="categorymenu">
   					<a href="/product/category.do?product_category_id=1">패키지
   					</a>
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
	<!-- category_product_wrap 시작 -->
	<div>
		<ul class="category_product_list">
			<li>
				<strong class="category_product_title">패키지
					<a href="/product/category.do?product_category_id=1" class="btn_category_product">더보기</a>
				</strong>
				<ul class="category_product_inner_list">
				<c:forEach items="${list}" var="row" varStatus="vs">
					<c:choose>
				        <c:when test="${row.product_category_id == 1}">
							<li class="active">
								<a href="/product/detail.do?product_id=${row.product_id}" class="btn_category_product">
								<span class="best_product_img_wrap">
									<img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/16778218049340.jpg">
								<%-- <img src="/images/store/${row.product_image}"> --%>
								</span>
								<span class="best_product_text_wrap">
									<span class="best_product_text_name">${row.product_name}</span>
									<span class="best_product_text_price">${row.product_cost}</span>
								</span>
								</a>
							</li>
						</c:when>
				        <c:when test="${row.product_category_id == 2}">
				            <li class="active">
								<a href="/product/detail.do?product_id=${row.product_id}" class="btn_category_product">
								<span class="best_product_img_wrap">
									<img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/16778218049340.jpg">
								<%-- <img src="/images/store/${row.product_image}"> --%>
								</span>
								<span class="best_product_text_wrap">
									<span class="best_product_text_name">${row.product_name}</span>
									<span class="best_product_text_price">${row.product_cost}</span>
								</span>
								</a>
							</li>
				        </c:when>
				        <c:otherwise>
				            <!-- 그 외의 경우 -->
				            <p>Other: ${row.product_name}</p>
				        </c:otherwise>
			    	</c:choose>
				</c:forEach>
				</ul>
			</li>
		</ul>

		<ul class="category_product_list">
			<li>
				<strong class="category_product_title">영화관람권
					<a href="/product/category.do?product_category_id=2" class="btn_category_product">더보기</a>
				</strong>
				<ul class="category_product_inner_list">
				<c:forEach items="${list}" var="row" varStatus="vs">
				<c:if test="${row.product_category_id == 2}">
					<li class="active">
						<a href="/product/detail.do?product_id=${row.product_id}" class="btn_category_product">
							<span class="best_product_img_wrap">
								<img src="https://img.cgv.co.kr/GiftStore/Product/Pc/List/16778218049340.jpg" alt="우리패키지">
								<%-- <img src="/images/store/${row.product_image}"> --%>
							</span>
							<span class="best_product_text_wrap">
								<span class="best_product_text_name">${row.product_name}</span>
								<span class="best_product_text_price">${row.product_cost}</span>
							</span>
						</a>
					</li>
				</c:if>
				</c:forEach>
				</ul>
			</li>
		</ul>
		<ul class="category_product_list">
			<li>
				<strong class="category_product_title">콤보<a href="#" class="btn_category_product">더보기</a></strong>
				<ul class="category_product_inner_list">
					<li class="active">
						<a href="/product/detail.do" class="btn_category_product">
							<span class="best_product_img_wrap">
							<img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16678903563480.jpg" alt="더블콤보">
							<span class="best_product_text_wrap">
								<span class="best_product_text_name">더블콤보</span>
								<span class="best_product_text_price">13,000</span>
							</span>
						</a>
						</li>
						<li class="active">
						<a href="#" class="btn_category_product">
							<span class="best_product_img_wrap">
							<img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16678896068820.jpg" alt="라지콤보">
								<span class="best_product_text_wrap">
								<span class="best_product_text_name">라지콤보</span>
								<span class="best_product_text_price">15,000</span>
							</span>
						</a>
						</li>
						<li class="active">
							<a href="#" class="btn_category_product">
							<span class="best_product_img_wrap">
							<img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16678058249750.jpg" alt="CGV콤보">
								<span class="best_product_text_wrap">
								<span class="best_product_text_name">CGV콤보</span>
								<span class="best_product_text_price">10,000</span>
							</span>
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
   	<!-- category_product_wrap 끝 -->
   </div>
   <!-- contents 끝 -->
<%@ include file="../footer.jsp" %>
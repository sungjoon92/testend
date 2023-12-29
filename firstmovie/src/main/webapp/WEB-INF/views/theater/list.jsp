<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/css/theater.css">


<script>
	// 	$(function () {
	// 		let tabBtn = $(".sel-city");
	// 		let tabCont = $(".theater-place ul li");

	// 		$(".sel-city").click(function () {
	// 			alert('11');
	// 			let target = $(this);
	// 			let index = target.index();
	// 			tabBtn.removeClass('on');
	// 			target.addClass('on');
	// 			tabCont.hide();
	// 			tabCont.eq(index).show();
	// 			console.log(target);
	// 		})//$(".sel-city").click end
	// 	})
</script>


<!--// theater-main -->
<div class="theater_wrap">
	<h2>전체극장</h2>
	<!-- 극장 리스트 시작 -->
	<div class="theater_box" style="height: 80px;">
		<div class="theater_list">
			<ul class="theater_btn">
				<c:forEach items="${theaterlist}" var="theater" varStatus="vs">
					<li><a href="list.do?region_id=${theater.region_id}">${theater.region}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div>
			<ul class="theater_cont">
				<c:forEach items="${branchlist}" var="branch" varStatus="vs">
					<li><a href="branchlist.do?region_id=${branch.region_id}&branch_id=${branch.branch_id}">${branch.branch_name}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- 극장 리스트 끝 -->

	<!-- 지점 이미지 시작 -->
		<div>
			<img src="${branchimg.branch_img}">
		</div>
	<!-- 지점 이미지 끝 -->

	<!-- 극장상영시간표 시작 -->
	<div class="screenlist_wrap">

		<c:forEach items="${screenlist}" var="screen" varStatus="vs">
			<ul class="screenlist">
				<%-- <li><a>호점 : ${screen.branch_name}</a></li> --%>
				<li class="movie_name"><a href="http://localhost:9095/movie/detail.do?movie_id=${screen.movie_id}">영화제목 : ${screen.movie_name}</a><span>${screen.movie_genre_name }/${screen.movie_running_time}분/${screen.movie_production_year}개봉</span></li>
				<li><a>상영관 위치 : ${screen.screen_location}</a></li>
				<li><a>전체 좌석수 : ${screen.screen_seat_count}석</a></li>
				<li><a>상영날짜 : ${screen.movie_showing_date}</a></li>
				<li><a>상영시간 : ${screen.movie_showing_time}</a></li>
				<%-- <li><a>영화장르 : ${screen.movie_genre_id}</a></li> --%>
			</ul>
		</c:forEach>
	</div>

	<!-- 극장상영시간표 끝 -->
	

	
</div>
<%@ include file="../footer.jsp"%>
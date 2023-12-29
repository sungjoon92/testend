<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/css/moviewrite.css">
<h2>영화추가</h2>
		<form name="moviefrm" id="moviefrm" method="post" action="insert" enctype="multipart/form-data">
			<table class="movie_addition">
				<tr>
					<td>영화아이디</td>
					<td><input type="text" name="movie_id"></td>
				</tr>
				<tr>
					<td>장르아이디</td>
					<td><input type="number" name="movie_genre_id"></td>
				</tr>
				<tr>
					<td>영화이름</td>
					<td><input type="text" name="movie_name"></td>
				</tr>
				<tr>
					<td>상영시간</td>
					<td><input type="text" name="movie_running_time"></td>
				</tr>
			
				<tr>
					<td>관람등급</td>
					<td><input type="text" name="movie_audience_rating"></td>
				</tr>
				<tr>
					<td>영화순위</td>
					<td><input type="number" name="movie_rank"></td>
				</tr>
				<tr>
					<td>영화 이미지</td>
					<td><input type="text" name="movie_image"></td>
				</tr>
				<tr>
					<td>영화 비디오</td>
					<td><input type="text" name="movie_video"></td>
				</tr>
				<tr>
					<td>감독이름</td>
					<td><input type="text" name="director_name"></td>
				</tr>
				<tr>
					<td>배우이름</td>
					<td><input type="text" name="actor_name"></td>
				</tr>
				<tr>
					<td class="">
						
					</td>
					<td class="execution">
						<input name="reset" id="reset" type="reset">
						<input name="submit" id="submit" type="submit">
					</td>
					
				</tr>
			</table>
		</form>


		<%@ include file="../footer.jsp"%>
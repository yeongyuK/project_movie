<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
* {	margin: 0;	padding: 0;}

.search_bar{ margin:auto; width:500px; padding:10px; }

a {	text-decoration: none;
	font-size: 20px;}

a:hover{font-weight:bold;}

.movie_list{ margin:auto; width:1000px; height:195px;}

.info {
	font-size: 13px;
	padding-top: 10px;
}

.content {
	font-size: 13px;
	width: 900px;
	margin: 10px;
	padding: 10px;
}
</style>

<script type="text/javascript">
	function search() {
		var str_search = document.getElementById("str_search").value;
		location.href = "movie_list_search.do?str_search=" + str_search;
	}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form>
		<div class="search_bar">
			<input id="str_search" type="text" placeholder="검색어를 입력하세요"> 
			<input type="button" value="검색" onclick="search();" />
		<div class="count">검색 결과는 총 ${ rowTotal }건 입니다.</div>
		</div>
		
		

	<c:forEach var="vo" items="${ list }">
		<div class="movie_list">
			<div style="float: left; margin:5px;">
				<img src="resources/img/${ vo.movieImage }" width="200px"
					height="135px" />
			</div>
			<div class="board">
				<a href="movie_view.do?movieIdx=${ vo.movieIdx }">${ vo.movieTitle }</a><br>
				<div class="info">감독 : ${ vo.director } 출품년도 : ${ vo.createYear }
					국가 : ${ vo.createCountry } 러닝타임 : ${ vo.running }</div>
				<br>
				<div class="content">${ vo.programNote }</div>
			</div>
			<hr>
		</div>
	</c:forEach>
	</form>
	
	<div align="center">
		${ pageMenu }
	</div>
</body>
</html>
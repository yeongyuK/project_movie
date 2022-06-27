<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.program{margin:auto; width:500px;}
img{float:left;}
.movie_info{width:250px; height:200px; float:right;width:45%; margin:10px}
</style>
</head>
<body>
	
	<div class="program">
		<h2>${ vo.movieTitle }</h2>
		<img src="resources/img/${vo.movieImage}" width="250px" height="200px"/>
		<div class="movie_info">
		<p>감독 ${ vo.director }</p>
		<p>제작국가 ${  vo.createCountry }</p>
		<p>제작년도 ${ vo.createYear }</p>
		<p>러닝타임 ${ vo.running }</p>
		</div>
		<h2>Program Note</h2>
		${ vo.programNote }<br>
		
		<h2>Director</h2>
		${ vo.director }<br>
		${ vo.directorContent }<br>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style type="text/css">
			.container{margin:auto; width:500px; height:500px; 
					   border:3px solid black;
					   text-align:center;}
		</style>
		<script type="text/javascript">
		</script>
	</head>
	
	<body>
		<div class="container">
			<h2>예매가 완료되었습니다.</h2>
			<p>예매번호 : ${vo.ticketId } </p>
			<p>제목 : ${ vo1.movieTitle } </p>
			<p>날짜 : ${ vo1.movieDate } </p>
			<p>시간 : ${ vo1.movieTime } </p>
			<p>인원수 : 성인  ${ vo.adultCount }명  | 청소년 ${ vo.childCount }명</p>
			<img src="resources/img/${ vo1.movieImage }" width="200px" height="180px"/>
			<p><input type="button" value="확인" onclick="location.href='ticketing_view.do'"></p>
		</div>
	</body>
</html>
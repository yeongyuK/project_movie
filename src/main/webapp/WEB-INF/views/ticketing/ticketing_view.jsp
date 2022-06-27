<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
table {
	border-collapse: collapse;
}

.tab{
	width:100%;
  	height: 50px;
}

.tablinks {
  width: 15%;
  height: 100%;
  border: none;
  outline: none;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #a6a6a6;
}

.tablinks.active {
  color: #000;
  background-color: #fff;
}	

.guide {
	width: 1000px;
	height: 160px;
	margin-bottom: 50px;
	margin-top:50px;
}

.guide th {
	background: #A9F4FF;
}

.ticket {
	width: 1000px;
}

.ticket th {
	height: 40px;
	background: #767676;
	color: #fff;
}

.ticket td {
	padding: 15px
}

</style>

	<script type="text/javascript">
	function openTab(evt, tabName) {
	      var i, tabcontent, tablinks;
	      tabcontent = document.getElementsByClassName("tabcontent");
	      for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	      }
	      tablinks = document.getElementsByClassName("tablinks");
	      for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	      }
	      document.getElementById(tabName).style.display = "block";
	      evt.currentTarget.className += " active";
	}
	</script>
</head>

<body>
	<h3 align="center">상영시간표</h3>

	<div class="tab" align="center">
		 	 <button class="tablinks active" onclick="openTab(event, 'tab1')">7/1</button>
		 	 <button class="tablinks" onclick="openTab(event, 'tab2')">7/2</button>
		 	 <button class="tablinks" onclick="openTab(event, 'tab3')">7/3</button>
		 	 <button class="tablinks" onclick="openTab(event, 'tab4')">7/4</button>
		 	 <button class="tablinks" onclick="openTab(event, 'tab5')">7/5</button>
	</div>

	<table class="guide" border="1" align="center">
		<tr>
			<th align="center">상영 정보 안내</th>
			<th align="center">좌석안내</th>
		</tr>

		<tr>
			<td>관객과의 대화 : 영화 상영 후, 감독이나 배우와 함께 영화에 대한 이야기를 나누는 시간<br>
				토킹 시네마 : 영화 상영 후 영화전문가 및 관련 전문가가 함께 하나의 영화에 대해 깊은 이야기를 나누는 시간
			</td>
			<td>전 좌석 선착순 입장(자유석)<br> 1인당 최대 4매 예매 가능
			</td>
		</tr>
	</table>
	
	<div id="tab1" class="tabcontent" style="display: block;">
	<table class="ticket" border="1" align="center">
		<tr>
			<th width="200px">상영시간</th>
			<th width="600px">제목</th>
			<th width="200px">예매</th>
		</tr>
			
		<c:forEach var="vo" items="${ list }" varStatus="status" >
			<c:forEach var="vo1" items="${ vo }">
				<c:if test="${ status.index eq 0 }">
					<tr>
						<td align="center">${ vo1.movieTime }</td>
						<td>${ vo1.movieTitle }</td>
						<td align="center"><input type="button" value="예매" 
							onclick="location.href='ticketing_detail.do?movieIdx=${vo1.movieIdx}'">
							<span id="revCount">${ revCountList.get(vo[0]).get(vo1.movieIdx) }</span> / <span id="maxCount">${ maxCount }</span>
						</td>
					</tr>
				</c:if>
			</c:forEach>		
		</c:forEach>
	</table>
	</div>
	
	<div id="tab2" class="tabcontent" style="display: none;">
	<table class="ticket" border="1" align="center">
		<tr>
			<th width="200px">상영시간</th>
			<th width="600px">제목</th>
			<th width="200px">예매</th>
		</tr>
			
		<c:forEach var="vo" items="${ list }" varStatus="status" >
			<c:forEach var="vo1" items="${ vo }">
				<c:if test="${ status.index eq 1 }">
					<tr>
						<td align="center">${ vo1.movieTime }</td>
						<td>${ vo1.movieTitle }</td>
						<td align="center"><input type="button" value="예매" 
							onclick="location.href='ticketing_detail.do?movieIdx=${vo1.movieIdx}'"></td>
					</tr>
				</c:if>
			</c:forEach>		
		</c:forEach>
	</table>
	</div>
	
	<div id="tab3" class="tabcontent" style="display: none;">
	<table class="ticket" border="1" align="center">
		<tr>
			<th width="200px">상영시간</th>
			<th width="600px">제목</th>
			<th width="200px">예매</th>
		</tr>
			
		<c:forEach var="vo" items="${ list }" varStatus="status" >
			<c:forEach var="vo1" items="${ vo }">
				<c:if test="${ status.index eq 2 }">
					<tr>
						<td align="center">${ vo1.movieTime }</td>
						<td>${ vo1.movieTitle }</td>
						<td align="center"><input type="button" value="예매" 
							onclick="location.href='ticketing_detail.do?movieIdx=${vo1.movieIdx}'"></td>
					</tr>
				</c:if>
			</c:forEach>		
		</c:forEach>
	</table>
	</div>
	
	<div id="tab4" class="tabcontent" style="display: none;">
	<table class="ticket" border="1" align="center">
		<tr>
			<th width="200px">상영시간</th>
			<th width="600px">제목</th>
			<th width="200px">예매</th>
		</tr>
			
		<c:forEach var="vo" items="${ list }" varStatus="status" >
			<c:forEach var="vo1" items="${ vo }">
				<c:if test="${ status.index eq 3 }">
					<tr>
						<td align="center">${ vo1.movieTime }</td>
						<td>${ vo1.movieTitle }</td>
						<td align="center"><input type="button" value="예매" 
							onclick="location.href='ticketing_detail.do?movieIdx=${vo1.movieIdx}'"></td>
					</tr>
				</c:if>
			</c:forEach>		
		</c:forEach>
	</table>
	</div>
	
	<div id="tab5" class="tabcontent" style="display: none;">
	<table class="ticket" border="1" align="center">
		<tr>
			<th width="200px">상영시간</th>
			<th width="600px">제목</th>
			<th width="200px">예매</th>
		</tr>
			
		<c:forEach var="vo" items="${ list }" varStatus="status" >
			<c:forEach var="vo1" items="${ vo }">
				<c:if test="${ status.index eq 4 }">
					<tr>
						<td align="center">${ vo1.movieTime }</td>
						<td>${ vo1.movieTitle }</td>
						<td align="center"><input type="button" value="예매" 
							onclick="location.href='ticketing_detail.do?movieIdx=${vo1.movieIdx}'"></td>
					</tr>
				</c:if>
			</c:forEach>		
		</c:forEach>
	</table>
	</div>
</body>
</html>
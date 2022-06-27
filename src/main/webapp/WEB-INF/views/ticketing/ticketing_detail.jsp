<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style type="text/css">
		
		h3{text-align:center;}
		
		.rev{margin:auto; width:600px; height:500px;}
		
		.rev1{margin:auto;}
		
		.count{margin-top:20px; margin-bottom:20px;}
		
		.btn{margin-top:20px; text-align:center;}
		</style>
		
		<script type="text/javascript">
			
			var adultCount;
			var childCount;
			var totalPrice;
			var a_count;
			var c_count;
			var revCount;
			var maxCount;
			var t_price;
			var a_price = 15000;
			var c_price = 10000;
			
			
			function count(type) {
				adultCount = document.getElementById('adultCount');
				childCount = document.getElementById('childCount');
				totalPrice = document.getElementById('totalPrice');
				revCount = document.getElementById('revCount');
				maxCount = document.getElementById('maxCount');
				
				a_count = adultCount.innerText;
				c_count = childCount.innerText;
				t_price = totalPrice.innerText;
				rev_count = revCount.innerText;
				max_count = maxCount.innerText;
				
				if(type == 'a_plus') {
					if( !checkLimit() ) return;
					 a_count = parseInt(a_count) + 1;
					 setTotalPrice();
				 }else if(type == 'a_minus')  {
					 if( a_count == 0 ) return;
					 a_count = parseInt(a_count) - 1;
					 setTotalPrice();
				 }else if(type == 'c_plus') {
					 if( !checkLimit() ) return;
					 c_count = parseInt(c_count) + 1;
					 setTotalPrice();
				 }else if(type == 'c_minus')  {
					 if( c_count == 0 ) return;
					 c_count = parseInt(c_count) - 1;
					 setTotalPrice();
				 } 
				 
				 adultCount.innerText = a_count;
				 childCount.innerText = c_count;
				 
			}
			
			function checkLimit() {
				if( parseInt(a_count) + parseInt(c_count) == 4 ){
					alert("예매 가능 수량은 4매 입니다.");
					return false;
				}else if( parseInt(a_count) + parseInt(c_count) == parseInt(rev_count)){
					alert("남은 좌석이 없습니다.");
					return false;
				}
				return true;
			}
			
			function setTotalPrice() {
				t_price = (parseInt(a_count) * parseInt(a_price)) + (parseInt(c_count) * parseInt(c_price));
				totalPrice.innerText = t_price;
			}
			
			function reserve() {
				adultCount = document.getElementById('adultCount');
				childCount = document.getElementById('childCount');
				totalPrice = document.getElementById('totalPrice');
				
				a_count = adultCount.innerText;
				c_count = childCount.innerText;
				t_price = totalPrice.innerText;
				 
				if( parseInt(adultCount) == 0 && parseInt(childCount) == 0 ){
					alert("인원을 선택해주세요.");
					return;
				}else{		
					if( confirm("예매 하시겠습니까?")){
					}else{	
						return;
					} 
				}
				
				location.href="insert.do?movieIdx=" + ${data.movieIdx} + 
							"&adultCount=" + a_count + 
							"&childCount=" + c_count + 
						 	"&totalPrice=" + t_price; 
				
			}
			
		</script>
	</head>
		
	<body>
		<form>
		<input type="hidden" value="${ data.movieIdx }" id="movieIdx">
		<h3>예매하기</h3>
		<div class="rev">
			<img src="resources/img/${ data.movieImage }" width="200px" height="320px" style="float:left"/>
			<div class="rev1">
				<p>제목 : ${ data.movieTitle } </p>
				<p>날짜 : ${ data.movieDate }</p>
				<p>시간 : ${ data.movieTime }</p>
				<p>요금 : 성인 15,000원  / 청소년 10,000원</p>
				<hr>
				
				<span style="float:left;width:40%;">관람인원선택</span>
				<span style="float:right;">예매 가능 수 : 
				<span id="revCount">${ revCount }</span> / <span id="maxCount">${ maxCount }</span></span><br>
				
				<div class="count">
				성인 : 
				<input type='button' onclick='count("a_minus")' value='-'/>
				<span id='adultCount' name='adultCount' value='0'>0</span>
				<input type='button' onclick='count("a_plus")' value='+'/>
				
				청소년 : 
				<input type='button' onclick='count("c_minus")' value='-'/>
				<span id='childCount' name='childCount' value='0'>0</span>
				<input type='button' onclick='count("c_plus")' value='+'/>
				</div>
				
				<div>결제 금액 : <span id="totalPrice" name="totalPrice" value='0'>0</span>원</div>
				
				<div class="btn">
				<input type="button" value="취소" onclick="location.href='ticketing_view.do'">
				<input type="button" value="결제" onclick="reserve();">
				</div>
			</div>
		</div>
		
		</form>
		
		
		
		
		
		
		
		
		
		<%-- <form>
			&nbsp;&nbsp;
			<% for( char c = 'A'; c <= 'H'; c++ ){ %>
				<small><%= c %></small>&nbsp;&nbsp;
			<%} %>
			<br>
			<% for( int i = 1; i <= 6; i++ ){ %>
				<%= i %>
				<% for( char c = 'A'; c <= 'H'; c++ ){ %>
					<input type="checkbox" name="seat" value=<%= c %>-<%= i %>>
				<%} %>
				<br>
				<%= i == 3 ? "<br>" : "" %>
			<%} %>
		</form> --%>
		
	</body>
</html>
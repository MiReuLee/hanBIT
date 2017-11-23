<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
tr.title > td {background: gray;}
table *{border: 1px solid black; text-align: center;}
button.submit{width: 300px; margin-right: 50px;}
</style>
<script>
function del(no){
	if (confirm(no+"번을 삭제하시겠습니까?")){
		location.href='${pageContext.request.contextPath }/exam/delete.do?no='+no;
	}else{
	    return;
	}
}
</script>
검색 된 결과 ${size }개
<table border="1">
	<tr class="title">
		<td>번호</td><td>이름</td><td>성별</td>
		<td>종교</td><td>졸업일</td><td></td>
	</tr>
	<c:forEach items="${list }" var="a">
	<tr>
		<td>${a.no }</td><td>${a.name }</td><td>
		<c:if test="${a.gencode%2 == 1}">남</c:if>
		<c:if test="${a.gencode%2 == 0}">여</c:if>
		</td>
		<td>${a.religion }</td>
		<td>${a.day }</td>
		<td><button type="button">
		<a href="${pageContext.request.contextPath }/exam/modifyForm.do?no=${a.no}">수정</a>
		/
		<a href="#" onclick="del(${a.no})">삭제</a>
		</button></td>
	</tr>
	</c:forEach>
</table>
<c:forEach begin="1" end="${lsize }" varStatus="a">
<a href="?page=${a.index }">[${a.index }]</a>
</c:forEach>
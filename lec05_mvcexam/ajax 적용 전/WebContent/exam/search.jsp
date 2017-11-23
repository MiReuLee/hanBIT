<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
table.search *{border: 1px solid black; text-align: center;}
table.search td.title{background: gray;}
button.submit{width: 300px; margin-right: 50px;}
form.all *{display: inline;}
</style>

<script>
function chk() {
	var startsize = '';
	for (var i = 0; i < document.ff.startday.length; i++) {
		if(document.ff.startday[i].value.length == 1)
			startsize += 0;
		startsize += document.ff.startday[i].value;
	}
	var endsize = '';
	for (var i = 0; i < document.ff.endday.length; i++) {
		if(document.ff.endday[i].value.length == 1)
			endsize += 0;
		endsize += document.ff.endday[i].value;
	}

	if(startsize - endsize > 0){
		alert("시작 날짜가 종료 날짜보다 큽니다.");
		return false;
	}
	
	return true;
}

function insert() {
	location.href='${pageContext.request.contextPath }/exam/insertForm.do';
}
</script>

<form action="${pageContext.request.contextPath }/exam/search.do" method="post" name="ff" onsubmit="return chk()">
<table class="search">
	<tr>
		<td colspan="6" class="title">사원 정보 검색</td>
	</tr>
	<tr>
		<td class="title">이름</td>
		<td><input type="text" name="name"></td>
		<td class="title">성별</td>
		<td><input type="checkbox" value="1" name="gender">남<input type="checkbox" value="2" name="gender">여</td>
		<td class="title">종교</td>
		<td>
			<select name="religionCode">
			<option value="0"></option>
			<c:forEach items="${rel }" var="a">
				<option value="${a.no }">${a.name }</option>
			</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td class="title">학력</td>
		<td>
			<c:forEach items="${sch }" var="a">
				<input type="checkbox" value="${a.no }" name="sch">${a.name }
			</c:forEach>
		</td>
		<td class="title">기술</td>
		<td colspan="3">
			<c:forEach items="${ski }" var="a">
				<input type="checkbox" value="${a.no }" name="ski">${a.name }
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td class="title">졸업일</td>
		<td colspan="5">
			<select name="startday">
				<c:forEach begin="${date.startday }" end="${date.endday }" varStatus="y">
					<option value="${y.index }">${y.index }</option>
				</c:forEach>
			</select>년
			<select name="startday">
				<c:forEach begin="1" end="12" varStatus="m">
					<option value="${m.index }">${m.index }</option>
				</c:forEach>
			</select>월
			<select name="startday">
				<c:forEach begin="1" end="31" varStatus="d">
					<option value="${d.index }">${d.index }</option>
				</c:forEach>
			</select>일&nbsp~&nbsp
			<select name="endday" class="y">
				<c:forEach begin="${date.startday }" end="${date.endday }" varStatus="y">
					<option value="${y.index }">${y.index }</option>
				</c:forEach>
			</select>년
			<select name="endday" class="m">
				<c:forEach begin="1" end="12" varStatus="m">
					<option value="${m.index }">${m.index }</option>
				</c:forEach>
			</select>월
			<select name="endday" class="d">
				<c:forEach begin="1" end="31" varStatus="d">
					<option value="${d.index }">${d.index }</option>
				</c:forEach>
			</select>일
	</tr>
</table>
	<button type="submit" class="submit">검색</button>
	<button type="button" onclick="location.href='${pageContext.request.contextPath }/exam/search.do'">전부검색</button>
	<button type="reset">초기화</button>
	<button type="button" onclick="insert()">등록</button>
</form>
<script>
$("select.y > option[value = '${date.endday }']").prop("selected", true)
$("select.m > option[value = '12']").prop("selected", true)
$("select.d > option[value = '31']").prop("selected", true)
</script>
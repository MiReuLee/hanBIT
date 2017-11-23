<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
table.insert *{border: 1px solid black; text-align: center;}
table.insert td.title{background: gray;}
</style>

<script>
function chk() {
	if(!document.ff.name.value){
		alert("이름을 입력하세요.");
		return false;
	}
	if(document.ff.religionCode.value == '0'){
		alert("종교를 입력하세요.");
		return false;
	}
	if(!document.ff.schoolCode.value){
		alert("학력을 입력하세요.");
		return false;
	}
	var bool = false;
	for (var i = 0; i < document.ff.ski.length; i++) {
		if(document.ff.ski[i].checked){
			bool = true;
		}	
	}
	if(!bool) {
		alert("기술을 입력하세요.");
		return false;
	}
	
	var reg = /^[0-9]*$/;
	var jusize = 0;
	for (var i = 0; i < document.ff.jumin_no.length; i++) {
		jusize += document.ff.jumin_no[i].value.length;
		if(isNaN(document.ff.jumin_no[i].value)) {
			alert("주민 번호는 숫자만 입력하세요.");
			return false;
		}
	}	
	
	if(jusize != 13) {
		alert(jusize);
		alert("13자리 주민번호를 입력하세요.");
		return false;
	}
	
	return true;
}
</script>

<form action="${pageContext.request.contextPath }/exam/insert.do" method="post" name="ff" onsubmit="return chk()">
<table class="insert">
	<tr>
		<td colspan="6" class="title">사원 정보 등록</td>
	</tr>
	<tr>
		<td class="title">이름</td>
		<td><input type="text" name="name"></td>
		<td class="title">주민번호</td>
		<td><input type="text" name="jumin_no">-<input type="password" name="jumin_no"></td>
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
				<input type="radio" value="${a.no }" name="schoolCode">${a.name }
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
			<select name="gday">
				<c:forEach begin="1900" end="2100" varStatus="y">
					<option value="${y.index }">${y.index }</option>
				</c:forEach>
			</select>년
			<select name="gday">
				<c:forEach begin="1" end="12" varStatus="m">
					<option value="${m.index }">${m.index }</option>
				</c:forEach>
			</select>월
			<select name="gday">
				<c:forEach begin="1" end="31" varStatus="d">
					<option value="${d.index }">${d.index }</option>
				</c:forEach>
			</select>일
	</tr>
</table>
	<button type="submit">등록</button>
	<button type="reset">초기화</button>
</form>
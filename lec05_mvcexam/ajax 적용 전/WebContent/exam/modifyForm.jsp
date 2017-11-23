<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
table.modify *{border: 1px solid black; text-align: center;}
table.modify td.title{background: gray;}
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

function del(no){
	if (confirm(no+"번을 삭제하시겠습니까?")){
		location.href='${pageContext.request.contextPath }/exam/delete.do?no='+no;
	}else{
	    return;
	}
}
</script>

<form action="${pageContext.request.contextPath }/exam/modify.do" method="post" name="ff" onsubmit="return chk()">
<input type="hidden" name="no" value="${param.no }">
<table class="modify">
	<tr>
		<td colspan="6" class="title">사원 정보 수정</td>
	</tr>
	<tr>
		<td class="title">이름</td>
		<td><input type="text" name="name" value="${exam.name }"></td>
		<td class="title">주민번호</td>
		<td><input type="text" name="jumin_no" value="${exam.jumin_no[0] }">
		-<input type="password" name="jumin_no" value="${exam.jumin_no[1] }"></td>
		<td class="title">종교</td>
		<td>
			<select name="religionCode" class="rc">
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
				<input type="radio" value="${a.no }" name="schoolCode" class="sc">${a.name }
			</c:forEach>
		</td>
		<td class="title">기술</td>
		<td colspan="3">
			<c:forEach items="${ski }" var="a">
				<input type="checkbox" value="${a.no }" name="ski" class="sk">${a.name }
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td class="title">졸업일</td>
		<td colspan="5">
			<select name="gday" class="y">
				<c:forEach begin="1900" end="2100" varStatus="y">
					<option value="${y.index }">${y.index }</option>
				</c:forEach>
			</select>년
			<select name="gday" class="m">
				<c:forEach begin="1" end="12" varStatus="m">
					<option value="${m.index }">${m.index }</option>
				</c:forEach>
			</select>월
			<select name="gday" class="d">
				<c:forEach begin="1" end="31" varStatus="d">
					<option value="${d.index }">${d.index }</option>
				</c:forEach>
			</select>일
	</tr>
</table>
	<button type="submit">수정</button>
	<button type="button" onclick="del(${param.no})">삭제</button>
</form>

<script>
$("select.y > option[value = '${exam.gday[0] }']").prop("selected", true)
$("select.m > option[value = '${exam.gday[1] }']").prop("selected", true)
$("select.d > option[value = '${exam.gday[2] }']").prop("selected", true)
$("select.rc > option[value = '${exam.religionCode }']").prop("selected", true)
$("input.sc[value = '${exam.schoolCode }']").prop("checked", true)
var a = ${exam.ski}
a.forEach(function(val){
	$("input.sk[value = "+val+"]").prop("checked", true);
	}
)
</script>
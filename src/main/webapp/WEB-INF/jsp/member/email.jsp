<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/mir.jsp" %>
<%@ include file="/WEB-INF/jsp/include/include.jsp" %>
<body>
	<h1>이메일로 전송 된 키를 입력하세요.</h1>
	<div>아이디:</div><input type="text" name="id">
	<div>키:</div><input type="text" name="emailkey">
	<button>체크</button>
	<div class="civa">이메일을 잘못 입력하셨나요?</div>
	
	<script type="text/javascript">
	var path = '${pageContext.request.contextPath}'
	$("button").click(function () {
		var data = "id="+$("input[name='id']").val();
		var civa = "인증";
		var siba = "chk";
		if($("input[name='email1']").val() && $("input[name='email2']").val()) {
			data += "&email1="+$("input[name='email1']").val()+"&email2="+$("input[name='email2']").val();
			civa = "변경";
			siba = "cha";
		}
		else data += "&emailKey="+$("input[name='emailkey']").val();
			$.ajax({
				url: path+"/member/email"+siba+".json",
				data: data,
				success: function (data) {
					if(data) {
						alert(civa+" 성공");
						location.href = path+"/study/main.do";
					} else {
						alert(civa+" 실패");
					}
				}
			});
	});
	
	$(".civa").click(function () {
		$("button").text("변경");
		$("div:eq(1)").next().remove();
		$("div:eq(1)").remove();
		$("input").after("<div>이메일 수정(ID):</div><input type='text' name='email1'><div>이메일 수정(Domain):</div><input type='text' name='email2'>");
		$(this).remove();
	});
	</script>
</body>
</html>
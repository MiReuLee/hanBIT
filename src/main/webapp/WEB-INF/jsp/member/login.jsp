<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/mir.jsp" %>
<%@ include file="/WEB-INF/jsp/include/include.jsp" %>
<fieldset class="login_form">
					<legend class="blind">로그인</legend>
					<div class="input_row" id="id_area">
						<span class="input_box">
							<label for="id" id="label_id_area" class="lbl">아이디</label>
							<input type="text" id="id" name="id" tabindex="7" accesskey="L" placeholder="아이디" class="int" maxlength="41" value="">
						</span>
					</div>
					<div id="err_empty_id" class="error" style="display:none;">아이디를 입력해주세요.</div>
					<div class="input_row" id="pw_area">
						<span class="input_box">
							<label for="pw" id="label_pw_area" class="lbl">비밀번호</label>
							<input type="password" id="pw" name="pw" tabindex="8" placeholder="비밀번호" class="int" maxlength="16">
						</span>
					</div>
					<div class="error" id="err_empty_pw" style="display:none;">비밀번호를 입력해주세요.</div>
					<div class="check_info">
						<div class="login_check">
							<span class="login_check_box">
								<input type="checkbox" id="login_chk" name="nvlong" class="" tabindex="9" value="off">
								<label for="login_chk" id="label_login_chk" class="sp">로그인 상태 유지</label>
							</span>
						</div>
					</div>
					<input type="button" title="로그인" alt="로그인" tabindex="12" value="로그인" class="btn_global">
				</fieldset>
				
				<script>
					if($.cookie("id")) {
						$("#id").val($.cookie("id"));
						$("#login_chk").prop("checked", "true");
					}
					var path = "${pageContext.request.contextPath}";
					$(".btn_global").click(function () {
						if(!$("#id").val()) {$("#err_empty_id").css("display", ""); return;}
						else $("#err_empty_id").css("display", "none");
						if(!$("#pw").val()) {$("#err_empty_pw").css("display", ""); return;}
						else $("#err_empty_pw").css("display", "none");
						$.ajax({
							url: path+"/member/login.json",
							data: "chk="+$("#login_chk").prop("checked")+"&id="+$("#id").val()+"&pass="+$("#pw").val(),
							success: function (data) {
								if(data) {alert("로그인 성공"); location.href = path+"/study/main.do";}
								else alert("로그인 실패");
							}
						})
					});
				</script>
</body>
</html>
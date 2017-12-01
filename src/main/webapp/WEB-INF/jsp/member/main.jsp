<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/mir.jsp" %>
<%@ include file="/WEB-INF/jsp/include/include.jsp" %>
<style>
div:not(.line){border:1px solid black; background: white;
float: left; display: grid;}
div.line{height: 20px; display: grid;}
span{transition-duration: 1s;}
span.green{color:green;}
span.red{color:red;}
select{height: 22px;}
</style>
</head>
<body>
		<form id="form">
		<div>
		<font>아이디</font><input type="text" name="id">
		<span></span>
		</div>
		
		<div>
		<font>비밀번호</font><input type="password" name="pass">
		<span></span>
		<button class="passLook" type="button">비밀번호 보기</button>
		</div>
		
		<div>
		<font>비밀번호 재확인</font><input type="password" name="pw2">
		<span></span>
		<button class="passLook" type="button">비밀번호 보기</button>
		</div>
		
		<div class="line"></div>
		
		<div>
		<font>이름</font><input type="text" name="name">
		<span></span>
		</div>
		
		<div>
		<font>Email 아이디</font><input type="text" name="email1">
		<span></span>
		</div>
		
		<div>
		<font>Email 도메인</font>
		<select name="email2">
			<option value="@gmail.com">@gmail.com</option>
			<option value="@naver.com">@naver.com</option>
			<option value="@daum.net">@daum.net</option>
		</select>
		<span class="green">사용 가능한 Email 도메인입니다.</span>
		<button type="button">직접 입력하기</button>
		</div>
		
		<div>
		<font>주소</font>
		<input name="address" readonly="readonly">
		<button type="button">Daum 주소</button>
		</div>
		
		<div><button type="button" class="siba">제출</button></div>
		
<!-- 		<div> -->
<!-- 		<font>Email 인증 코드</font> -->
<!-- 		<span></span> -->
<!-- 		<button type="button" class="emailkey">Email 인증 전송</button> -->
<!-- 		</div> -->
		</form>
		
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
		<script type="text/javascript">
			var path = '${pageContext.request.contextPath}';
			
			/* $(document).keyup(function (e) {
				if (e.keyCode === 9) {
					while(true) {
						if ($(":focus").next() ==
					}
				}
			}); */
			
			function input() {
				$("input").attr("autocomplete", "off");
			}
			
			var civa = false;
			
			input();
			
			var siva = false;
			
			$("button.siba").click(function () {
				if($("span.green").length == 7) {		
					if(!siva) {						
						$.ajax({
							url: path+"/member/insert.json",
							data: $("#form").serialize(),
							beforesend: function () {
								siva = true;
							},
							success: function () {
								alert("가입 성공.")
								location.href = path+"/member/email.do";
							},
							error: function () {
								alert("에러 남");
								siva = false;
							}
						});
					}
				}
				else alert("빈 거 있음.");
			});
			
			$("button:eq(3)").click(function(){
				var sib = $(this).prev();
				var siv = $(this).parent();
				daum.postcode.load(function(){
			        new daum.Postcode({
			            oncomplete: function(data) {
			            	sib.val(data.roadAddress);
			            	siv.append($("<span>").text("사용 가능한 주소입니다 ㅅㅂ").addClass("green"))
			            }
			        }).open();
			    });
		    });
			
// 			$("button.emailkey").click(function () {
// 				var t = $(this);
// 				$.ajax({
// 					url: path+"/member/email.json",
// 					data: "email="+$("input[name='email1']").val()+$("[name='email2']").val(),
// 					success: function () {
// 						t.before($("<input type='text' id='siba'>"));
// 						t.attr("class", "chk").text("코드 체크");
						
// 						$("button.chk").click(function () {
// 							$.ajax({
// 								url: path+"/member/emailchk.json",
// 								data: "emailkey"+$("#siba").text(),
// 								success: function (data) {
// 									if(data) {
// 										t.append($("<span>").addClass("green").text("인증 성공"));
// 										$("input[name^='email']").attr("readonly", "readonly");
// 										$("select[name='email2']").attr("disabled", "disabled");
// 										$("[name^='email']").css("color", "gray");
// 										t.prev().remove();
// 									} else {
// 										t.append($("<span>").addClass("red").text("인증 실패"));
// 									}
// 									t.remove();
// 								}
// 							});
// 						});
// 						input();
// 					}
// 				});
// 			});
			
			$("div.line").css({width: $(window).width()+'px'});
			
			function siba() {
				$('div:not(.line)').css({width: ($(window).width()/3)+'px'});
			}
			
			siba();
			
			$(window).resize(function () {
				siba()
			});
			
			var select = $("select").clone();
			var selChk = false;
			
			$("button:eq(2)").click(function () {
				if(!selChk) {
					selChk = true;
					$(this).text("리스트 선택하기");
					$("select").replaceWith($("<input type='text' value='@' class='change' name='email2'>"));					
					
					$(".change").keyup(function (e) {
						var span = $(this).next();
						var name = $(this).prev().text();
						var value = $(this).val();
						
						function s (text, bool) {
							if(bool) span.attr("class", "green");
							else span.attr("class", "red");
							span.text(text);
						}
						
						var reg = /[a-zA-Z0-9@_.-]+/;
						var reg2 = /^\@([a-zA-Z0-9-_])*\.[a-zA-Z0-9-_]{2,4}$/;
						
						if (e.keyCode == 17) {
							s("Ctrl키는 사용 불가능합니다.");
							$(this).val("");
						} else if (!value) {
							s("이메일을 입력하세요.");
						} else if (!value.indexOf("@") == 0) {
							s("골뱅이를 입력하세요.");
						} else if (!reg.test(value)) {					
							s("이메일은 숫자와 '@', '_', '.', '-', 영문만 입력 가능합니다.");
						}  else if (!reg2.test(value)) {					
							s("유효한 도메인을 입력하세요.");
						} else {
							s("올바른 "+name+"입니다.", true);
						}
			    	});
					
					$(".change").trigger("keyup");
				} else {
					selChk = false;
					$(this).text("직접 입력하기");
					$(this).prev().text("사용 가능함.").attr("class", "green");
					$("input.change").replaceWith(select);
				}
				
				input();
			})
			
			var chk = false;
			$("button.passLook").click(function () {
					if(!chk) {
						$(this).text("비밀번호 안 보기");
						$("input[type='password']").attr("type", "text").addClass("pass");
						chk = true;
					} else {
						$(this).text("비밀번호 보기");
						$("input.pass").attr("type", "password");
						chk = false;
					}
					input();
				}
			);
			
			$("input").keyup(function (e) {
				var span = $(this).next();
				var name = $(this).prev().text();
				
				function s (text, bool) {
					if(bool) {
						span.attr("class", "green");
					}
					else span.attr("class", "red");
					span.text(text);
				}
				
				if($(this)[0] === $("input:eq(0)")[0]) {
					$.ajax({
						url: path+"/member/main.json",
						data: "id="+$(this).val(),
						success: function (data) {
							if(!data) {
								s("이미 사용 중인 "+name+"입니다.");
								return;
							}
						}
					});
				}
				
				var reg = /[^a-zA-Z0-9]+/;
				var reg2 = /[^ㄱ-ㅎㅏ-ㅣ가-힣]/;
				var p1 = "";
				var p2 = "";
				
				var a = ["아이디", "비밀번호"];
				var b = ["이름", "비밀번호 재확인", "Email 도메인"];
				for (var i = 0; i < b.length; i++) {
					if (name == b[i]) {
						p1 = "은";
						p2 = "을"
					} else {
						p1 = "는";
						p2 = "를";
					}
				}

				if (e.keyCode == 17) {
					s("Ctrl키는 사용 불가능합니다.");
					$(this).val("");
				} else if(!$(this).val()) {
					s(name+p2+" 입력하세요.")	;
				} else if($(this).val().indexOf(" ") > -1) {
					s("공백을 입력하지 마세요.");
					$(this).val($(this).val().trim());
					$(this).val($(this).val().replace(/[ ]/, ''));
				} else if (!($(this)[0] === $("input:eq(3)")[0]) && $(this).val().length < 4) {
					s(name+p1+" 4자리 이상 입력하세요.");
				} else if ($(this).val().length > 20) {					
					s(name+p1+" 20자까지만 사용 가능합니다.");
				} else if (!($(this)[0] === $("input:eq(3)")[0]) && reg.test($(this).val())) {					
					s(name+p1+" 숫자와 영문만 입력 가능합니다.");
				} else if($(this)[0] === $("input:eq(3)")[0] && reg2.test($(this).val())) {
					s(name+p1+" 한글만 입력 가능합니다.");
				} else if($(this)[0] === $("input:eq(2)")[0] && $(this).val() != $("input:eq(1)").val()) {
					s("비밀번호와 "+name+"이 다릅니다.")
				} else {
					s("올바른 "+name+"입니다.", true);
				}
				
				input();
			}
		);
		</script>
</body>
</html>
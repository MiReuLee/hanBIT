<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/mir.jsp"%>
<%@ include file="/WEB-INF/jsp/include/include.jsp"%>
<c:choose>
	<c:when test="${not empty msg }">
		<script>
			alert('${msg}');
			location.href = '${pageContext.request.contextPath}/study/main.do'
		</script>
	</c:when>
	<c:otherwise>
		<style>
div[contenteditable=true] {
	color: gray;
	overflow: auto;
}

div.title {
	width: 530px;
	height: 50px;
	background: white;
	text-align: center;
	padding-top: 1vh;
}

div.title>div {
	width: 530px;
	height: 22px;
}

div.listBox {
	margin-top: 20px;
}

div.list {
	overflow: hidden;
	padding: 0.5vh;
	background: aliceblue;
	width: 30vw;
	margin-right: 2.7vw;
	display: inline-block;
	line-height: initial;
}

div.list>div:first-child {
	width: 59%;
	display: inline-block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

div.list>div.object {
	font-size: 3vh;
	border-bottom: 1px solid black;
	height: 5vh;
	margin-left: 1vw;
	font-weight: bold;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

div.list button {
	float: right;
}

div.line {
	margin-top: 10px;
	width: 100%;
	height: 2px;
	background: black;
}

div.tt {
	width: 30vw;
	height: 18px;
}

div.ttt {
	overflow: auto;
	height: 377px;
	width: 450px;
}
</style>
		<body>
			<div class="title">
				<div contenteditable="true" class="classTitle">
					${list[0].classTitle }</div>
				<img class="plus"
					src="https://cdn4.iconfinder.com/data/icons/keynote-and-powerpoint-icons/256/Plus-128.png"
					width="18" style="float: right; margin: 0px 2px 0px 2px;"> <img
					class="sub"
					src="https://maxcdn.icons8.com/Share/icon/color/User_Interface//submit_progress1600.png"
					width="18" style="float: right; margin: 0px 2px 0px 2px;">
			</div>
			<div class="listBox">
				<c:if test="${list.size() > 1 }">
					<c:forEach begin="1" end="${list.size()-1 }" var="i">
						<div class="list">
							<div data-no="${list[i].classNo }">${list[i].classTitle }</div>
							<button type='button'>수정</button>
							<button type='button' class="ii">글쓰기</button>
							<div class="line"></div>
							<c:forEach begin="0" end="9" var="z">
								<div class="object" data-no="${list[i].list[z].boardNo }">${list[i].list[z].title }</div>
							</c:forEach>
						</div>
					</c:forEach>
				</c:if>
			</div>

			<script>
				var path = '${pageContext.request.contextPath}';
				
				function re() {
					var w = $(window).width()/2-$(".title").width()/2;
					$(".title").css({"margin-left": w+'px'});
				}
				
				function ob() {
					$(".object:not([data-no=''])").click(function () {
						location.href = path+"/study/detail.do?no="+$(this).attr("data-no")
					})
				}
				
				document.onload = re();
				document.onload = ob();
				document.onload = ii();
				
				function ii() {
					var iiChk = false;
					$(".ii").click(function () {
						if(iiChk) return;
						iiChk = true;
						var title = $(this).prev().prev().text();
						var no = $(this).prev().prev().attr("data-no");
						var list = $($(this).parent());
						list.find(".object").remove();
						list.append($("<div>").addClass("ttt").attr({"contenteditable": "true"}).text('내용을 입력하세요.'));
						$(this).prev().remove();
						$(this).prev().attr("contenteditable", "true").text("제목을 입력하세요.");
						$(this).before($("<input>").attr({"type": "file", "multiple": "true", "id": "file"}));
						$(this).parent().wrap($("<form>").attr("enctype", "multipart/form-data"));
						$(this).text("제출").attr("class", "oo");
						oo(title, no);
					});
				}
				
				function oo(title, no) {
					$(".oo").click(function () {
						var t = $(this).parent();
						var formData = new FormData();
						formData.append("title", $(this).prev().prev().text());
						formData.append("contents", $(this).next().next().text());
						formData.append("classNo", no);
						for (var i = 0; i < $("#file")[0].files.length; i++) {
							formData.append("attachFile"+i, $("#file")[0].files[i]);
						}

						$.ajax({
							url: path+"/study/write.json",
							data: formData,
							processData: false,
							contentType: false,
							type: 'POST',
							success: function (data) {
								console.log(data)
								t.empty();
								var l = t.append($("<div>").text(title).attr("data-no", no));
							
								if (!sessionStorage.getItem("user"))
								l.append($("<button type='button'>").text("수정"));
							
								l.append($("<button type='button'>").text("글쓰기").addClass("ii"))
								.append($("<div>").addClass("line"));
								
								for (var i = 0; i < data.length; i++) {
									l.append($("<div>").addClass("object").text(data[i].title).attr("data-no", data[i].boardNo));
								}							
								
								for (var i = 0; i < 9-data.length; i++) {
									l.append($("<div>").addClass("object"));
								}
								ob();
							}
						});
					})
				}
				
				$(window).resize(function () {
					re();
				});
				
				if ($(".classTitle").text().trim() == "") $(".classTitle").attr("data-bool", "false");
				else {
					$(".classTitle").attr("data-bool", "true");
					$(".classTitle").attr("data-no", "${list[0].classNo}");
				}
				
				
				var chk = false;
				
				$(".sub").click(function () {
					var obj = $(".classTitle");
					var sb = false;
					
					var url;
					var data = "classRegDate="+${param.day}+"&classTitle="+obj.text();
					
					if (obj.attr("data-bool") == "false") {
						obj.attr("data-bool", "true");
						url = path+"/study/titleInsert.json";
						sb = true;
					} else {
						url = path+"/study/titleUpdate.json";
						data += "&classNo="+obj.attr("data-no");
					}
					
					$.ajax({
						url: url,
						type: "post",
						data: data,
						sussecc: function (data) {
							if (sb) obj.attr("data-no", data);
						}
					});
				});
				
				$(".plus").click(function () {
					if(!chk) {
						chk = true;
						
						var table = $("<div>").addClass("list").append($("<div>").addClass("tt").attr({"contenteditable": "true"}).text("제목을 입력하세요."))
						.append("<button type='button'  type='button' id='submit'>제출</button><div class='line'></div>");
	
						table.append($("<div>").addClass("ttt").attr({"contenteditable": "true"}).text('내용을 입력하세요.'));
						
						table.css({height: $($(".list")[0]).height()+'px'});
						
						$(".listBox").append(table);
						
						$("#submit").click(function () {
							var title = $(".tt").text();
							$.ajax({
								url: path+"/study/insert.json",
								data: "classRegDate="+${param.day}+"&classTitle="+title+"&contents="+$(this).next().next().text()+"&categoryNo=1",
								success: function (data) {
									chk = false;
									var l = $("<div>").addClass("list")
									.append($("<div>").text(title).attr("data-no", data.no));
									
									if (!sessionStorage.getItem("user"))
									l.append($("<button type='button'>").text("수정"));
									
									l.append($("<button type='button'>").text("글쓰기").addClass("ii"))
									.append($("<div>").addClass("line"))
									.append($("<div>").addClass("object").text("예시").attr("data-no", data.boardNo));
									
									for (var i = 0; i < 9; i++) {
										l.append($("<div>").addClass("object"));
									}
									
									$(".listBox > .list:last-child").remove();
									$(".listBox").append(l);
									
									ob();
									ii();
								}
							});
						});
					} else return;
				});
				
			</script>
		</body>
	</c:otherwise>
</c:choose>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/jsp/include/mir.jsp" %>
<%@ include file="/WEB-INF/jsp/include/include.jsp" %>
<style>
.prev{color: gray;}
td{width: 15vw; height: 12vh; text-align: center; background: white;}
input{width:65px; text-align: center;}
.sun{color: red;}
.sat{color: blue;}
td > div:first-child{font-weight: bold;}
tr:first-child > td{height: 20px; font-size: 20px; font-weight: bold;}
</style>
<body>
	<h1></h1>
	<button><</button><input><input><button>></button><br>
	<button>이동</button>
	<button>이번 달</button>
	<table border="1">
		<tbody>
		</tbody>
	</table>
	
	
	<script>	
	var path = '${pageContext.request.contextPath}';
	
	document.onload = makeDal();
	
	function ciba() {
		var tr = $("<tr>");
		var siba = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
		for (var i = 0; i < siba.length; i++) {
			tr.append($("<td>").text(siba[i]));
		}
		$("tbody").append(tr);
	}
	
	
	function event (civ) {
		$("div.title").click(function () {			
			var obj = $(this);
			if (obj.text() == "title을 입력하세요.") obj.text(" ");
		});
		
		$("button.titleSubmit").click(function () {
			var obj = $(this).prev();
			
			var url;
			var data = "classRegDate="+obj.attr("id")+"&classTitle="+obj.text();
			
			if (obj.attr("data-bool") == "f") {
				obj.attr("data-bool", "t");
				url = path+"/study/titleInsert.json";
			} else {
				url = path+"/study/titleUpdate.json";
				data += "&classNo="+obj.attr("data-no");
			}
			
			$.ajax({
				url: url,
				type: "post",
				data: data
			});
		});
		
		$("td > div:first-child").click(function () {
			var id = $(this).next().attr("id").replace(/[/]/gi, "");
			location.href=path+"/study/day.do?day="+id;
		});
		
		//if(!civ) makeDal("凸");
	}
	
	function title (str, civ) {
		$.ajax({
			url: path+"/study/main.json",
			data: "date="+str,
			success: function (map) {
				$("td:not(.prev) > div.title").attr({
					contenteditable: "true"
				});
				
				for (var i = 0; i < $("td:not(.prev) > div.title").length; i++) {
					var dt = $($("td:not(.prev) > div.title")[i]);
					if (map[dt.attr("id")] != undefined) dt.text(map[dt.attr("id")].classTitle).attr({"data-bool": "t", "data-no": map[dt.attr("id")].classNo});
					else
						dt.text("title을 입력하세요.")
						  .attr("data-bool", "f");
				}
			}
		});
		
		event(civ);
	};
	
	function submit () {
		makeDal(new Date(parseInt($("input:eq(0)").val()), parseInt($("input:eq(1)").val())-1, 1));
	};
	
	function prevEvent () {
		makeDal(new Date(nowDate.getFullYear(), nowDate.getMonth()-1, 1));
	};

	function nextEvent () {
		makeDal(new Date(nowDate.getFullYear(), nowDate.getMonth()+1, 1));
	};
	
	$(document).keydown(function (event) {
		switch (event.keyCode) {
		case 13 :
			submit();
			break;
		case 37 :
			prevEvent();
			break;
		case 38 :
			makeDal(new Date(nowDate.getFullYear()+1, nowDate.getMonth(), 1));
			break;
		case 39 :
			nextEvent();
			break;
		case 40 :
			makeDal(new Date(nowDate.getFullYear()-1, nowDate.getMonth(), 1));
			break;
		}
	});
	
	var nowDate = new Date();
	
	$("button:eq(0)").click(function () {	
		prevEvent();
	});
	$("button:eq(1)").click(function () {	
		nextEvent();
	});
	$("button:eq(2)").click(function () {	
		submit();
	});
	$("button:eq(3)").click(function () {	
		makeDal(new Date());
	});
	
	function makeDal(date) {
		var civ = false;
		if(typeof date === 'string') {
			date = new Date();
			date.setDate(1);
			$("tbody").empty();
			ciba();
			civ = true;
		} else if(date) {
			$("tbody").empty();
			ciba();
		} else {
			var date = new Date();
			date.setDate(1);
			ciba();
		}
		nowDate = date;
		
		var y = date.getFullYear()+"년";
		var m = (date.getMonth()+1)+"월";
		var yy = (date.getFullYear()).toString().substring(2);
		var pyy = new Date(date.getFullYear(), date.getMonth()-1).getFullYear().toString().substring(2);
		var mm = date.getMonth()+1;
		$("title").text(y+"\t"+m);
		$("h1").text(y+"\t"+m);
		$("input:eq(0)").val(y);
		$("input:eq(1)").val(m);
		$("button:eq(2)").width($("input:eq(0)").width()+$("input:eq(1)").width());
		
		var day = date.getDate();
		var yoil = date.getDay();
		
		var prev = new Date(date.getFullYear(), date.getMonth());
		prev = new Date(prev - 1);
		var prevDay = prev.getDate()-(yoil-1);
		
		var next = new Date(date.getFullYear(), date.getMonth()+1);
		next = new Date(next - 1);
		var lastDay = next.getDate();
		
		$("table").append("<tr>");
		for (var i = 0; i < yoil; i++) {
			var dd = prevDay;
			if (dd.toString().length == 1) dd = "0"+dd;
			$("tr:eq(1)").append("<td class='prev'><div>"+prevDay+++"</div><div class='title' id='"+pyy+"/"+(mm-1)+"/"+(dd-1)+"'></div></td>");
		}
		for (var i = 1; i <= 7-yoil; i++) {
			var dd = i;
			if (dd.toString().length == 1) dd = "0"+dd;
			var str = yy+"/"+mm+"/"+dd;
			var dayHtml = $("<td>").append($("<div>").text(i)).append($("<div>").addClass("title").attr("id", str)).append("<button type='button' class='titleSubmit'>제출</button>");
			if(i == 7-yoil) dayHtml.addClass("sat");
			$("tr:eq(1)").append(dayHtml);
		}
		var weekCnt = 2;
		$("table").append("<tr>");
		var week = $("tr:eq("+weekCnt+")")
		
		for (var i = 7-yoil+1; i <= lastDay; i++) {
			var dd = i;
			if (dd.toString().length == 1) dd = "0"+dd;
			var nowYoil = week.find("td").length;
			var str = yy+"/"+mm+"/"+dd;
			var dayHtml = $("<td>").append($("<div>").text(i)).append($("<div>").addClass("title").attr("id", str)).append("<button type='button' class='titleSubmit'>제출</button>");
			if (nowYoil%7 == 0) {
				$("table").append("<tr>");
				week = $("tr:eq("+weekCnt+++")");
				dayHtml.addClass("sun");
			} else if (nowYoil%6 == 0) dayHtml.addClass("sat");
			week.append(dayHtml)
		}
		
		title(yy+"/"+mm, civ);
	}
	</script>
</body>
</html>
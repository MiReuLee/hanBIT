<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<body>
	<div class="homeBtn" style="font-size: 25px;">
		<a href="${pageContext.request.contextPath}/main/main.do" style="color: white; text-shadow: 0 0 2px black;">
		<i class="fa fa-home fa-fw" aria-hidden="true"></i>홈으로
		</a>
	</div>
	<div class="col-lg-6">
	    <div class="input-group">
	      <input type="text" class="form-control" id="target" placeholder="Search for...">
	      <span class="input-group-btn">
	        <button id="search" class="btn btn-default" type="button">
	        <i class="fa fa-search fa-spin" aria-hidden="true"></i>&nbsp;검색</button>
	      </span>
	    </div>
	    <!-- 검색결과 창 -->
	    <div class="result_container"></div>
	  
	  <button onclick="document.getElementById('serchDetail').style.display='block'" class="w3-button w3-black" style="float: right;">검색옵션 설정</button>
	  <div id=serchDetail class="w3-modal w3-animate-opacity">
	    <div class="w3-modal-content w3-card-4">
	      <header class="w3-container w3-teal"> 
	        <span onclick="document.getElementById('serchDetail').style.display='none'" 
	        class="w3-button w3-large w3-display-topright">&times;</span>
	        <h2>옵션을 설정해주세요</h2>
	      </header>
	      <div class="w3-container" align="center">
	      	<p>
		        <span>
		        	<select id="option">
		        		<option value="title">제목</option>
		        		<option value="writer">작성자</option>
		        		<option value="contents">내용</option>
		        		<option value="titleContents">제목+내용</option>
		        	</select>
		        	<select id="when">
			        	<option value="when1">최근 15일 동안</option>
			        	<option value="when2">최근 1개월 동안</option>
			        	<option value="when3">최근 3개월 동안</option>
			        	<option value="when4">최근 6개월 동안</option>
			        	<option value="when5">1년 이상 전 동안</option>
			        	<option value="when6">2년 이상 전 동안</option>
		        	</select>
		    	</span>
	    	</p>
	      </div>
	    </div>
	  </div>

	</div>
	<div class="logform" style="z-index: 3000" >
		<div class="w3-container">
		  <button onclick="document.getElementById('login').style.display='block'" class="w3-button w3-green w3-large">Login</button>
		
		  <div id="login" class="w3-modal">
		    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
		
		      <div class="w3-center"><br>
		        <span onclick="document.getElementById('login').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
		        <img alt="로그인창" style="width:30%" class="w3-circle w3-margin-top">
		      </div>
<!-- 로그인폼 -->		
		      <form class="w3-container" action="/action_page.php">
		        <div class="w3-section">
		          <label><b>아이디</b></label>
		          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디를 입력하세요." name="id" required>
		          <label><b>비밀번호</b></label>
		          <input class="w3-input w3-border" type="password" placeholder="비밀번호를 입력하세요" name="ps" required>
		          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">로그인</button>
		          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">회원가입</button>
		          <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> 자동 로그인
		        </div>
		      </form>
		
		      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
		        <button onclick="document.getElementById('login').style.display='none'" type="button" class="w3-button w3-red">취소</button>
		        <span class="w3-right w3-padding w3-hide-small">비밀번호를 <a href="#">잃어버렸습니까?</a></span>
		      </div>
		      
		    </div>
  		</div>
	</div>
</div>
	<script>
	
	
	// 검색창 모션
	function viewSerchDetail(){
		var $serachDetail = $(".serach-detail");
		var $serchDetailBtn = $(".serchDetailBtn");
		if($serachDetail.attr("id")=="serachTypeHidden"){
			$serachDetail.attr("id", "serachTypeShow");
			$serchDetailBtn.attr("id", "serachBtnShow");				
		}
		else{
			$serachDetail.attr("id", "serachTypeHidden");
			$serchDetailBtn.attr("id", "serachBtnHidden");				
		}
	}

	var path = '${pageContext.request.contextPath}';

	$("#search").click(function (e) {
		$.ajax({
			url: path + "/search/search.json",
			data: "target="+$("#target").val()+"&option="+$("#option > option:selected").val(),
			success: function(data) {
				$(".result_container > table").html("");
				var tableStart = "<table class='searchList'>";
				var tableEnd = "</table>";
				var tableContents = "";
				if(data.length == 0){
					tableContents = "<tr><th>검색된 결과가 없습니다.</th><td>";
				}

				console.log($("#option > option:selected").val());
				
				for (let ele of data) {
					var date = new Date(ele.regDate).toLocaleDateString();
					
					tableContents += 
					"<tr><th>글쓴이</th><td>"+ele.writer+
					"</td>"+
					"<th>제목</th><a href='#'><td>"+ele.title+
					"</td></a>"+
					"<th>날짜</th><td>"+date+
					"</td></tr>";
				}
				$(".result_container").append(tableStart + tableContents + tableEnd);
				$(".result_container > table").fadeToggle();
			}

		});
	});
	
	$("#target").keyup(function (e) {
			$.ajax({
				url: path + "/search/search.json",
				data: "target="+$("#target").val()+
					  "&option="+$("#option > option:selected").val()+
					  "&when="+$("#when > option:selected").val(),
				success: function(data) {
					$(".result_container").html("");
					var tableStart = "<table class='searchList'>";
					var tableEnd = "</table>";
					var tableContents = "";
					
					if(data.length == 0){
						tableContents = "<tr><th>검색된 결과가 없습니다.</th><td>";
					}
					
					for (let ele of data) {
						var date = new Date(ele.regDate).toLocaleDateString();
						
						tableContents += 
						"<tr onclick='#'><th>글쓴이</th><td>"+ele.writer+
						"</td>"+
						"<th>제목</th><td>"+ele.title+
						"</td>"+
						"<th>날짜</th><td>"+date+
						"</td></tr>";
					}
					$(".result_container").append(tableStart + tableContents + tableEnd);
					$(".result_container > table").fadeToggle();
				}

			});
		});
	
	$("#target").focusout(function () {
		$(".result_container > table").fadeToggle();
	});
	
	$("#target").focusin(function () {
		$(".result_container > table").fadeToggle();
	});
	</script>
</body>
</html>
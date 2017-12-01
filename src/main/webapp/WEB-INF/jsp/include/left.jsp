<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<nav class="w3-collapse" style="width:250px;" id="mySidebar">

<div class="container">
  <a class="menuBtn" id="btnHidden" href="javascript:viewMenu();">
  	<i class="fa fa-arrows-h fa-2x fa-border" aria-hidden="true"></i><br>더보기
  </a>
  <div class="w3-padding-64 w3-large w3-text-grey list-group" id="menuHidden" style="font-weight:bold">
	  <div class="w3-container w3-display-container w3-padding-16">
	    <h3 class="w3-wide"><b>Yang Im Yun Lee</b></h3>
	  </div>
    <a href="${pageContext.request.contextPath}/notice/list.do" class="w3-bar-item w3-button"><i class="fa fa-bell fa-fw" aria-hidden="true"></i>&nbsp;공지사항</a>
    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-pencil fa-fw" aria-hidden="true"></i>&nbsp;수업 게시판</a>
    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-comments fa-fw" aria-hidden="true"></i>&nbsp;질문 게시판</a>
    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-sitemap fa-fw" aria-hidden="true"></i>&nbsp;커리큘럼 게시판</a>
    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-users fa-fw" aria-hidden="true"></i>&nbsp;강의평가 게시판</a>
    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-bar-chart fa-fw" aria-hidden="true"></i>&nbsp;출석률 게시판</a>
  </div>
</div>
</nav>
	<script>
	function viewMenu(){
		var $listGroup = $(".list-group");
		var $menuBtn = $(".menuBtn")
		if($listGroup.attr("id")=="menuHidden"){
			$listGroup.attr("id", "menuShow");
			$menuBtn.attr("id", "btnShow");				
		}
		else{
			$listGroup.attr("id", "menuHidden");
			$menuBtn.attr("id", "btnHidden");				
		}
	}
	</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/jsp/include/mir.jsp"%>
<%@ include file="/WEB-INF/jsp/include/include.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="waitme/waitMe.js"></script>
<script src="common.js"></script>
<style>
[data-type="civa"] {
	width: 10%;
}
</style>
<body>
	<div class="mySlides w3-display-container w3-center">
		<img src="${pageContext.request.contextPath }/image/jsp.gif"
			style="height: 200px;">
		<div
			class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
		</div>
	</div>

	<div class="mySlides w3-display-container w3-center">
		<img src="${pageContext.request.contextPath }/image/sql.png"
			style="height: 200px;">
		<div
			class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
		</div>
	</div>

	<div class="mySlides w3-display-container w3-center">
		<img src="${pageContext.request.contextPath }/image/android.png"
			style="height: 200px;">
		<div
			class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
		</div>
	</div>

	<div class="w3-container w3-content w3-center w3-padding-64"
		style="max-width: 800px; background-color: white;" id="band">
		<h1 class="w3-wide">${board.title}</h1>
		<p class="w3-opacity">
			<i>${board.writer }</i>
		</p>
		<p class="w3-justify">${board.contents}</p>
	</div>

	<div class="w3-row">
		<c:forEach items="${file }" var="f">
			<div class="w3-center" data-type="civa" data-name="${f.systemName }">
				<c:set var="fileName" value="${fn:split(f.systemName, '.')}" />
				<c:if test="${fileName[fn:length(fileName)-1] eq 'xml'}">
					<img src="${pageContext.request.contextPath }/civa/XML.png"
					style="width: 45%" class="w3-circle w3-hover-opacity">
				</c:if>
				<p>${f.originalName }</p>
			</div>
		</c:forEach>
	</div>

	<script type="text/javascript">
		var path = '${pageContext.request.contextPath }';
		
		$("[data-type='civa']").click(function () {
			var filename = $(this).attr("data-name");
			var xhr = new XMLHttpRequest();
			xhr.responseType = 'blob';
			xhr.onload = function () {
				var a = document.createElement('a');
				a.href = window.URL.createObjectURL(xhr.response); // xhr.response is a blob
				a.download = filename; // Set the file name.
				a.style.display = 'none';
				document.body.appendChild(a);
				a.click();
				delete a;
			};
			xhr.open('GET', path+"/civa/"+filename);
			xhr.send();
		});
		
		var myIndex = 0;
		carousel();
		

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 4000);
		}
	</script>
</body>
</html>
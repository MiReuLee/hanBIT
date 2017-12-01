<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="dashboard display-animation"
	style="margin: 0 auto; width: 1130px;">
	<div class="tile tile-lg tile-pink ripple-effect">
		<div class="content-wrapper">
			<div class="tile-content">
				<div class="tile-holder tile-holder-sm">
					<div class="title">최근 게시물 목록</div>
				</div>
				<table class="sortable">
					<thead>
						<tr>
							<th data-sort="name">작성자</th>
							<th data-sort="title">제목</th>
							<th data-sort="date">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${newlyBoard}" var="s" varStatus="loop">
							<tr>
								<td>${s.writer}</td>
								<td>${s.title}</td>
								<fmt:formatDate var="date" value="${s.regDate}"
									pattern="yy/MM/dd" />
								<td>${date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<button class="hover" style="float: right;"><i class="fa fa-plus-square-o" aria-hidden="true"></i>더보기</button>
			</div>
		</div>
	</div>
	<div class="tile tile-lg tile-sqr tile-purple ripple-effect">
		<div class="content-wrapper">
			<div class="tile-content">
				<div class="tile-holder tile-holder-sm">
					<div class="title">공지사항</div>
				</div>
				<div class="w3-container">
					<div
						class="w3-panel w3-pale-green w3-bottombar w3-border-green w3-border">
						<p id="noticeContents">${notice.contents}</p>
					</div>
				</div>
				<button
					onclick="document.getElementById('notice').style.display='block'"
					class="w3-button w3-black">작성</button>
			</div>
		</div>
	</div>
	<div class="tile tile-lg tile-sqr tile-cyan ripple-effect">
		<div class="content-wrapper">
			<div class="tile-content">
				<div class="tile-holder tile-holder-sm">
					<div class="title">오늘의 내기</div>
					<div id="todayDealTitle" class="caption"
						style="color: black; padding: 3px;">
						<p class="title">상품</p>${todayDeal.title}</div>
				</div>
				<div class="w3-container">
					<div class="w3-panel w3-border w3-light-grey w3-round-large">
						<p id="todayDealContents">${todayDeal.contents}</p>
					</div>
				</div>
				<button
					onclick="document.getElementById('todayDeal').style.display='block'"
					class="w3-button w3-black">작성</button>
			</div>
		</div>
	</div>
	<div class="tile tile-lg tile-sqr tile-red ripple-effect">
		<div class="content-wrapper">
			<div class="tile-content">
				<div class="tile-holder tile-holder-sm">
					<div class="title">출석률</div>
				</div>
				<div ng-app="myApp">
					<bars data="40,4,55,15,16,33,52,20,35,67,45,32,45,32,78,88"></bars>
				</div>
				<p>한달 기준</p>
			</div>
		</div>
	</div>
	<div class="tile tile-lg tile-light-blue ripple-effect">
		<div class="content-wrapper">
			<div class="tile-content" style="padding-top: 12px;">
				<div class="tile-holder tile-holder-sm">
					<div class="title">달력</div>
				</div>
				<div id="calendar-container">
					<div id="calendar-header">
						<span class="calendar-header-box calendar-button"
							onclick="calendarBack()"> <i class="fa fa-angle-left"></i>
						</span> <span id="calendar-year-title" class="calendar-header-box year">2017</span>
						<span class="calendar-header-box calendar-button"
							onclick="calendarNext()"> <i class="fa fa-angle-right"></i>
						</span>
					</div>
					<div id="calendar-wrapper"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="tile tile-lg tile-sqr tile-amber ripple-effect">
		<div class="content-wrapper">
			<div class="tile-content">
				<div class="tile-holder tile-holder-sm">
					<div class="title">Support Link</div>
				</div>
				<div id="social-platforms">
					<a class="btn btn-icon btn-facebook" href="#"><i
						class="fa fa-facebook"></i><span>Facebook</span></a> <a
						class="btn btn-icon btn-twitter" href="#"><i
						class="fa fa-twitter"></i><span>Twitter</span></a> <a
						class="btn btn-icon btn-googleplus" href="#"><i
						class="fa fa-google"></i><span>Google+</span></a> <a
						class="btn btn-icon btn-pinterest" href="#"><i
						class="fa fa-pinterest"></i><span>Pinterest</span></a> <a
						class="btn btn-icon btn-linkedin" href="#"><i
						class="fa fa-linkedin"></i><span>LinkedIn</span></a>
				</div>

			</div>
		</div>
	</div>
</div>

<!-- 모달 부분 ------------------------------------------------------------------------->
<!-- 모달 부분 ------------------------------------------------------------------------->
<!-- 모달 부분 ------------------------------------------------------------------------->

<div id="notice" class="w3-modal">
	<div class="w3-modal-content">
		<header class="w3-container w3-red"> <span
			onclick="document.getElementById('notice').style.display='none'"
			class="w3-button w3-display-topright">&times;</span>
		<h2>공지사항</h2>
		</header>
		<div class="w3-container">
			<input id="noticeForm" class="w3-input w3-border w3-light-grey"
				type="text" style="width: 870px; height: 200px;" placeholder="내용 입력">
		</div>
		<p>
			<button id="noticeWrite" class="w3-button w3-black w3-round-large">작성</button>
		</p>
	</div>
</div>
<div id="todayDeal" class="w3-modal">
	<div class="w3-modal-content">
		<header class="w3-container w3-teal"> <span
			onclick="document.getElementById('todayDeal').style.display='none'"
			class="w3-button w3-display-topright">&times;</span>
		<h2>오늘의 내기</h2>
		</header>
		<div class="w3-container">
			<input id="todayDealForm" class="w3-input w3-border w3-light-grey"
				type="text" style="width: 870px; height: 200px;" placeholder="내용 입력">
			<hr>
			<input id="todayDealTitleForm"
				class="w3-input w3-border w3-light-grey" type="text"
				placeholder="상품 입력">
		</div>
		<p>
			<button id="todayDealWrite" class="w3-button w3-black w3-round-large">입력</button>
		</p>
	</div>
</div>
<script>
	var path = '${pageContext.request.contextPath}';

	$("#noticeWrite").on("click", function(e) {
		$.ajax({
			url : path + "/main/notice.json",
			data : "contents=" + $("#noticeForm").val() + "&categoryNo=6",
			success : function() {
				document.getElementById('notice').style.display = 'none';
				$("#noticeContents").text($("#noticeForm").val());
			}
		});
	});

	$("#todayDealWrite")
			.on("click", function(e) {
					$.ajax({
						url : path + "/main/todayDeal.json",
						data : "contents="
								+ $("#todayDealForm").val()
								+ "&categoryNo=7&title="
								+ $("#todayDealTitleForm").val(),
						success : function() {
							document.getElementById('todayDeal').style.display = 'none';
							$("#todayDealContents").text($("#todayDealForm").val());
							$("#todayDealTitle").text($("#todayDealTitleForm").val());
				}
			});
	});

	/////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////

	Date.prototype.addDays = function(days) {
		var dat = new Date(this.valueOf())
		dat.setDate(dat.getDate() + days);
		return dat;
	};

	var focusDate = new Date();
	var today = new Date();

	window.onload = function() {
		var container = document.getElementById("calendar-wrapper");

		makeCalendar(true, focusDate);
	};

	function calendarBack() {
		var fadeOutTable = document.getElementsByClassName("calendar-table3")[0];
		fadeOutTable.classList.add("calendar-animation-drop");
		window.setTimeout(function() {
			var newYear = focusDate.getFullYear();
			var newMonth = focusDate.getMonth() - 1;
			if (newMonth == 0) {
				newMonth = 12;
				newYear--;
			}
			focusDate.setYear(newYear);
			focusDate.setMonth(newMonth);
			makeCalendar(true, focusDate, false);
		}, 300);
	}

	function calendarNext() {
		var fadeOutTable = document.getElementsByClassName("calendar-table1")[0];
		fadeOutTable.classList.add("calendar-animation-drop");
		window.setTimeout(function() {
			var newYear = focusDate.getFullYear();
			var newMonth = focusDate.getMonth() + 1;
			if (newMonth == 12) {
				newMonth = 0;
				newYear++;
			}
			focusDate.setYear(newYear);
			focusDate.setMonth(newMonth);
			makeCalendar(true, focusDate, true);
		}, 300);
	}

	function makeCalendar(isTriple, fDate, isNext) {
		var elements = document.getElementsByClassName("calendar");
		while (elements.length > 0) {
			elements[0].parentNode.removeChild(elements[0]);
		}

		document.getElementById("calendar-year-title").innerHTML = fDate
				.getFullYear();

		if (!isTriple) {
			document.getElementById("calendar-wrapper").appendChild(
					getCalendarTable(focusDate.getFullYear(), focusDate
							.getMonth() + 1));
		} else {
			var tableToEdit = getCalendarTable(focusDate.getFullYear(),
					focusDate.getMonth());
			tableToEdit.classList.add("calendar-dim");
			tableToEdit.classList.add("calendar-table1");
			if (isNext) {
				tableToEdit.classList.add("calendar-animation-leftFadeOut");
			} else {
				tableToEdit.classList.add("calendar-animation-right");
			}
			document.getElementById("calendar-wrapper")
					.appendChild(tableToEdit);
			addBreak();
			tableToEdit = getCalendarTable(focusDate.getFullYear(), focusDate
					.getMonth() + 1);
			tableToEdit.classList.add("calendar-table2");
			if (isNext) {
				tableToEdit.classList.add("calendar-animation-leftFade");
			} else {
				tableToEdit.classList.add("calendar-animation-rightFade");
			}
			document.getElementById("calendar-wrapper")
					.appendChild(tableToEdit);
			addBreak();
			tableToEdit = getCalendarTable(focusDate.getFullYear(), focusDate
					.getMonth() + 2);
			tableToEdit.classList.add("calendar-dim");
			tableToEdit.classList.add("calendar-table3");
			if (isNext) {
				tableToEdit.classList.add("calendar-animation-left");
			} else {
				tableToEdit.classList.add("calendar-animation-rightFadeOut");
			}
			document.getElementById("calendar-wrapper")
					.appendChild(tableToEdit);
		}
	};

	function addBreak() {
		var breakElement = document.createElement('div');
		breakElement.classList.add("calendar-table-break");
		breakElement.classList.add("calendar");
		var breakElementChild = document.createElement('div');
		breakElementChild.classList.add("calendar-table-break-child");
		breakElement.appendChild(breakElementChild);
		document.getElementById("calendar-wrapper").appendChild(breakElement);
	};

	function getCalendarTable(year, month) {
		if (month == 0) {
			month = 12;
			year--;
		}

		if (month == 13) {
			month = 1;
			year++;
		}

		// Safari fix
		if (month < 10) {
			month = "0" + month;
		}

		var calendarDate = new Date(year + "-" + month + "-01");
		var firstDay = calendarDate.getDay();
		var numberOfDays = new Date(calendarDate.getFullYear(), calendarDate
				.getMonth() + 1, 0).getDate();

		var monthNameArray = [ "January", "February", "March", "April", "May",
				"June", "July", "August", "September", "October", "November",
				"December" ];

		// Create HTML Table
		var table = document.createElement('table');
		table.classList.add("calendar");
		var heading = document.createElement('div');
		heading.classList.add("calendar-month-heading");
		heading.innerHTML = monthNameArray[month - 1];
		heading.style = "width : 10px";
		table.appendChild(heading);
		var tr = document.createElement('tr');
		tr.style = "width=15px";
		tr.classList.add("calendar");

		// Day Letters
		for (var i = 0; i < 7; i++) {
			var th = document.createElement('th');
			th.classList.add("calendar");
			th.innerHTML = "SMTWTFS"[i];
			th.style = "width=15px";
			if (i == 0) {
				th.style = "color : red";
			} else if (i == 6) {
				th.style = "color : blue";
			}
			tr.appendChild(th);
		}
		table.appendChild(tr);

		// Week 1
		tr = document.createElement('tr');
		tr.classList.add("calendar");
		var i = 0;
		for (; i < 7; i++) {
			if (i == firstDay) {
				break;
			}
			var td = document.createElement('td');
			td.classList.add("calendar");
			td.innerHTML = "";
			tr.appendChild(td);
		}
		table.appendChild(tr);

		var dayNumber = 1;
		for (; i < 7; i++) {
			var td = document.createElement('td');
			td.classList.add("calendar");
			processDay(td, calendarDate, dayNumber);
			td.innerHTML = dayNumber;
			if (i == 0) {
				td.style = "color : red";
			} else if (i == 6) {
				td.style = "color : blue";
			}
			dayNumber++;
			tr.appendChild(td);
		}
		table.appendChild(tr);

		// Other Weeks
		for (var r = 3; r <= 7; r++) {
			tr = document.createElement('tr');
			tr.classList.add("calendar");
			for (var i = 0; i < 7; i++) {
				if (dayNumber > numberOfDays) {
					table.appendChild(tr);
					return table;
				}
				var td = document.createElement('td');
				td.classList.add("calendar");
				if (i == 0) {
					td.style = "color : red";
				} else if (i == 6) {
					td.style = "color : blue";
				}
				processDay(td, calendarDate, dayNumber);
				td.innerHTML = dayNumber;
				dayNumber++;
				tr.appendChild(td);
			}
			table.appendChild(tr);
		}
		return table;
	};

	var seasons = [
			new DaysRange(new Date("2016-11-25"), new Date("2017-01-20"),
					"peak"),
			new DaysRange(new Date("2017-01-21"), new Date("2017-02-02"),
					"high") ];

	var bookings = [
			new DaysRange(new Date("2017-01-11"), new Date("2017-01-16"),
					"booked"),
			new DaysRange(new Date("2017-01-16"), new Date("2017-01-28"),
					"pending"),
			new DaysRange(new Date("2016-12-23"), new Date("2017-01-04"),
					"booked"),
			new DaysRange(new Date("2017-02-04"), new Date("2017-02-22"),
					"pending"),
			new DaysRange(new Date("2017-02-22"), new Date("2017-02-24"),
					"pending"),
			new DaysRange(new Date("2017-02-24"), new Date("2017-03-04"),
					"booked") ];

	function DaysRange(startDate, endDate, name) {
		this.days = getDates(startDate, endDate);
		this.name = name;
	};

	function processDay(element, calendarDate, dayNumber) {
		var dayDate = new Date(calendarDate.getTime());
		dayDate.setDate(dayNumber);

		// Highlight Today
		if (dayDate.toDateString() == today.toDateString()) {
			element.classList.add("calendar-daystyle-today");
		}

		var bookingName = getDateBooking(dayDate.toDateString());
		//console.log(dayNumber + " : " + bookingName);
		if (bookingName.startsWith("booked")) {
			if (bookingName.includes("_start") && bookingName.includes("_end")) {
				if (bookingName.includes("pending")) {
					element.classList
							.add("calendar-daystyle-booking-cross-pending");
				} else {
					element.classList.add("calendar-daystyle-booking-cross");
				}
			} else if (bookingName.includes("_start")) {
				element.classList.add("calendar-daystyle-booking-start");
			} else if (bookingName.includes("_end")) {
				element.classList.add("calendar-daystyle-booking-end");
			} else {
				element.classList.add("calendar-daystyle-booking-middle");
			}
		} else if (bookingName.startsWith("pending")) {
			if (bookingName.includes("_start") && bookingName.includes("_end")) {
				if (bookingName.includes("booked")) {
					element.classList
							.add("calendar-daystyle-pending-cross-booking");
				} else {
					element.classList.add("calendar-daystyle-pending-cross");
				}
			} else if (bookingName.includes("_start")) {
				element.classList.add("calendar-daystyle-pending-start");
			} else if (bookingName.includes("_end")) {
				element.classList.add("calendar-daystyle-pending-end");
			} else {
				element.classList.add("calendar-daystyle-pending-middle");
			}
		}

		var seasonName = getDateSeason(dayDate.toDateString());
		if (seasonName == "peak") {
			element.classList.add("calendar-daystyle-price-peak");
		} else if (seasonName == "high") {
			element.classList.add("calendar-daystyle-price-high");
		} else {
			element.classList.add("calendar-daystyle-price-normal");
		}

	};

	function getDateSeason(dayDateString) {
		var seasonName = "";
		seasons.forEach(function(season) {
			season.days.forEach(function(day) {
				if (day == dayDateString) {
					seasonName = season.name;
					return seasonName;
				}
			});
		});
		return seasonName;
	};

	function getDateBooking(dayDateString) {
		var bookingName = "";
		bookings.forEach(function(booking) {
			var dayNum = 1;
			booking.days.forEach(function(day) {
				if (day == dayDateString) {
					var extra = "";
					if (dayNum == 1) {
						extra = "_start";
					} else if (dayNum == booking.days.length) {
						extra = "_end";
					}
					bookingName += booking.name + extra;
				}
				dayNum++;
			});
		});
		return bookingName;
	};

	// Get days array between 2 dates
	function getDates(startDate, stopDate) {
		var dateArray = new Array();
		var currentDate = startDate;
		while (currentDate <= stopDate) {
			var dateString = currentDate.toDateString();
			dateArray.push(dateString);
			currentDate = currentDate.addDays(1);
		}
		return dateArray;
	};

	angular.module('myApp', []).

	directive(
			'bars',
			function($parse) {
				return {
					restrict : 'E',
					replace : true,
					template : '<div id="chart"></div>',
					link : function(scope, element, attrs) {
						var data = attrs.data.split(','), chart = d3.select(
								'#chart').append("div").attr("class", "chart")
								.selectAll('div').data(data).enter().append(
										"div").transition().ease("elastic")
								.style("width", function(d) {
									return d + "%";
								}).style("height", "4px").style("color",
										"white").style("text-shadow",
										"0 0 2px black").text(function(d) {
									return d + "%";
								});
					}
				};
			});

	/**
	 * Created by Kupletsky Sergey on 16.09.14.
	 *
	 * Hierarchical timing
	 * Add specific delay for CSS3-animation to elements.
	 */

	(function($) {
		var speed = 2000;
		var container = $('.display-animation');
		container.each(function() {
			var elements = $(this).children();
			elements.each(function() {
				var elementOffset = $(this).offset();
				var offset = elementOffset.left * 0.8 + elementOffset.top;
				var delay = parseFloat(offset / speed).toFixed(2);
				$(this).css("-webkit-animation-delay", delay + 's').css(
						"-o-animation-delay", delay + 's').css(
						"animation-delay", delay + 's').addClass('animated');
			});
		});
	})(jQuery);

	/**
	 * Created by Kupletsky Sergey on 04.09.14.
	 *
	 * Ripple-effect animation
	 * Tested and working in: ?IE9+, Chrome (Mobile + Desktop), ?Safari, ?Opera, ?Firefox.
	 * JQuery plugin add .ink span in element with class .ripple-effect
	 * Animation work on CSS3 by add/remove class .animate to .ink span
	 */

	(function($) {
		$(".ripple-effect").click(function(e) {
			var rippler = $(this);

			// create .ink element if it doesn't exist
			if (rippler.find(".ink").length == 0) {
				rippler.append("<span class='ink'></span>");
			}

			var ink = rippler.find(".ink");

			// prevent quick double clicks
			ink.removeClass("animate");

			// set .ink diametr
			if (!ink.height() && !ink.width()) {
				var d = Math.max(rippler.outerWidth(), rippler.outerHeight());
				ink.css({
					height : d,
					width : d
				});
			}

			// get click coordinates
			var x = e.pageX - rippler.offset().left - ink.width() / 2;
			var y = e.pageY - rippler.offset().top - ink.height() / 2;

			// set .ink position and add class .animate
			ink.css({
				top : y + 'px',
				left : x + 'px'
			}).addClass("animate");
		})
	})(jQuery);

	var compare = { // Declare compare object
		name : function(a, b) { // Add a method called name
			a = a.replace(/^the /i, ''); // Remove The from start of parameter
			b = b.replace(/^the /i, ''); // Remove The from start of parameter

			if (a < b) { // If value a is less than value b
				return -1; // Return -1
			} else { // Otherwise
				return a > b ? 1 : 0; // If a is greater than b return 1 OR
			} // if they are the same return 0
		},
		duration : function(a, b) { // Add a method called duration
			a = a.split(':'); // Split the time at the colon
			b = b.split(':'); // Split the time at the colon

			a = Number(a[0]) * 60 + Number(a[1]); // Convert the time to seconds
			b = Number(b[0]) * 60 + Number(b[1]); // Convert the time to seconds

			return a - b; // Return a minus b
		},
		date : function(a, b) { // Add a method called date
			a = new Date(a); // New Date object to hold the date
			b = new Date(b); // New Date object to hold the date

			return a - b; // Return a minus b
		}
	};

	$('.sortable').each(function() {
		var $table = $(this); // This sortable table
		var $tbody = $table.find('tbody'); // Store table body
		var $controls = $table.find('th'); // Store table headers
		var rows = $tbody.find('tr').toArray(); // Store array containing rows

		$controls.on('click', function() { // When user clicks on a header
			var $header = $(this); // Get the header
			var order = $header.data('sort'); // Get value of data-sort attribute
			var column; // Declare variable called column

			// If selected item has ascending or descending class, reverse contents
			if ($header.is('.ascending') || $header.is('.descending')) {
				$header.toggleClass('ascending descending'); // Toggle to other class
				$tbody.append(rows.reverse()); // Reverse the array
			} else { // Otherwise perform a sort                            
				$header.addClass('ascending'); // Add class to header
				// Remove asc or desc from all other headers
				$header.siblings().removeClass('ascending descending');
				if (compare.hasOwnProperty(order)) { // If compare object has method
					column = $controls.index(this); // Search for columnâ€™s index no

					rows.sort(function(a, b) { // Call sort() on rows array
						a = $(a).find('td').eq(column).text(); // Get text of column in row a
						b = $(b).find('td').eq(column).text(); // Get text of column in row b
						return compare[order](a, b); // Call compare method
					});

					$tbody.append(rows);
				}
			}
		});
	});
</script>
</html>
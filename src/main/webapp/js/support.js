/**
 * 
 */
"use strict";

var path = "/mini2-home";
let dataList;
let containerH = 0;



$(document).ready(function() {
	containerH = $("#titleContainer").height();
	TweenMax.to($("#contentContainer"), .5, { top : containerH })
	TweenMax.to($("#titleContainer"), .5, { left : $("#baseContainer").width() / 2 - 
                                                   $("#titleContainer").width() / 2 })
                                                   
	$("#submitButton").click(function(e){
		$.ajax({
			type : "POST",
			url : "insertSupport.do",
			data : $("#frm").serialize(),
			dataType : "json",
			success : function(data) {
				setBackLayerControl("none");
				callAjax(path+"/supportlink/readSupport.json", null);
				$("input").val("")
			}
		});			
	})
	callAjax(path+"/supportlink/readSupport.json", null);
	setTitleAlign();
	writeButtonControll();
	setBackLayerMouseEvent();
	 let x = $(this).width() / 2 - $("#baseContainer").width() / 2;
	let y = $(this).height() / 2 - $("#baseContainer").height() / 2;
	TweenMax.to( $("#baseContainer"), 0, { left: x, top : y } ); 
	
})

function setTitleAlign()
{	
	//let x = 600 / 2 - $("#titleContainer").width() / 2;
	//TweenMax.to( $("#titleContainer"), 1, { left: x, } );
}

function callAjax(url, param)
{
	$("#contentContainer").empty();
	containerH = $("#titleContainer").height();
	$.ajax({
		url : url,
		data : {supportNo: param},
		dataType : "json",
		success : (data) => 
		{				
			dataList = data;
			
			for(var i = 0; i < dataList.length; i++)
			{
				makeList(i, dataList[i].site);
			}

		}
	})
}


function makeList(i, link)
{
	$("#contentContainer").append("<div id=contentContainer"+i+" class='listBox'></div>")
	
	$("div#contentContainer"+i).append("<a target='_blank' href=" + link + ">" + link + "</a>")
							   .append("<div id=modify" + i + " class='modify' value='aaaaa'>수정</div>")
			   				   .append("<div id=delete" + i + "  class='delete'>삭제</div>");
	
	$(".modify").css({ position : "absolute",
					  borderRadius: "5px 15px",
					  background: "#ffa2a2",
					  width : "46px",
					  height : "24px",
					  left : "499px",
					  top : "3px",
					  textAlign: "center"});
	
	$(".delete").css({ position : "absolute",
					   borderRadius: "5px 15px",
					   background: "#f7f798",
					   width : "46px",
					   height : "24px",
					   left : "549px",
					   top : "3px",
					   textAlign: "center"});
	
	//$(".modify").addClass("listBox") // 미리 준비된 클래스 가져다 쓰기
	
	
	$("#modify" + i).attr("data-id", i);
	$("#modify" + i).click(function(){
		console.log($(this).data("id"))
		setBackLayerControl("block");
		controlinBlackLayer();
		controlPopup();
	})
	
	$("#delete" + i).attr("data-id", i);
	$("#delete" + i).click(function(){
		console.log(dataList[$(this).data("id")].supportNo)
		callAjax(path+"/supportlink/deleteSupport.json", dataList[$(this).data("id")].supportNo);
	})
	
	
	
	var h = $(".listBox").height() + 10;
	containerH += h;
	$("#baseContainer").height(containerH);
	TweenMax.to( $("#contentContainer"+i), 1, { top : (i * h) } );
	
	if(i == dataList.length - 1) $(window).trigger("resize");
}

function controlPopup()
{
	var windowWidth = $( window ).width();
	var windowHeight = $( window ).height();
	
	let x = windowWidth / 2 - $("#writePopup").width() / 2;
	let y = windowHeight / 2 - $("#writePopup").height() / 2;
	
	TweenMax.to($("#writePopup"), 1, { left : x, top : y});
}

function controlinBlackLayer()
{
	var width = $(window).width();
    var height = $(window).height();
     
    //화면을 가리는 레이어의 사이즈 조정
    $(".inBlackLayer").width(width);
    $(".inBlackLayer").height(height);
    $(".inBlackLayer").css("opacity", 0);
    TweenMax.to( $(".inBlackLayer"), 1, { opacity : .7 } );
    
}

function writeButtonControll()
{
	
	$("#writeButton").click(function(){
		setBackLayerControl("block");
		controlinBlackLayer();
		controlPopup();
	})
}

function setBackLayerMouseEvent()
{
	 $(".inBlackLayer").click(function(){
		 setBackLayerControl("none")
    })
}

function setBackLayerControl(mode)
{
	$(".backLayer").css("display", mode)
}

$(window).on("resize", function(e){
	let x = $(this).width() / 2 - $("#baseContainer").width() / 2;
	let y = $(this).height() / 2 - $("#baseContainer").height() / 2;
	TweenMax.to( $("#baseContainer"), 1, { left: x, top : y } );
	
	var width = $(window).width();
    var height = $(window).height();
     
    //화면을 가리는 레이어의 사이즈 조정
    $(".inBlackLayer").width(width);
    $(".inBlackLayer").height(height);
    
    if($(".backLayer").css("display") != "none") controlPopup();
})










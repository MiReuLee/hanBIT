$(document).ajaxStart(function() {
	$("body").waitMe({
		effect : "bounce",
		text : "바운스 바운스 두근 대 들릴까봐 겁나",
		bg : "rgba(0, 0, 255, 0.5)",
		color : "black"
	});
}).ajaxStop(function() {
	$("body").waitMe("hide");
});
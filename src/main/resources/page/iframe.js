$(function(){
	$("#menulist li").click(function(){
		$(this).addClass('active').siblings().removeClass("active");
		var ohref=$(this).attr("ohref");
		$("iframe").attr("src",ohref);
	})
})

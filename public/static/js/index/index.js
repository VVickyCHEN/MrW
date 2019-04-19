	$(function(){
		$('.nav ul li').hover(function(){
			 $(this).children('ul.nav-select').slideDown();
		},function(){
			$(this).children('ul.nav-select').slideUp();
		})
	})
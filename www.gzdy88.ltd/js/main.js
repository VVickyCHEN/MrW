$(document).ready(function() {
	var p = 0,
		t = 0;
	var head = $('.header');
	$(window).scroll(function(e) {
		p = $(this).scrollTop();
		if (t <= p) { //下滚  
			if (p > 300) {
				head.css({
					"-webkit-transform": "translate3d(0,-100%,0)",
					"-moz-transform": "translate3d(0,-100%,0)",
					"-ms-transform": "translate3d(0,-100%,0)",
					"-o-transform": "translate3d(0,-100%,0)",
					transform: "translate3d(0,-100%,0)"
				});
			}
		} else { //上滚  
			head.css({
				"-webkit-transform": "translate3d(0,0,0)",
				"-moz-transform": "translate3d(0,0,0)",
				"-ms-transform": "translate3d(0,0,0)",
				"-o-transform": "translate3d(0,0,0)",
				transform: "translate3d(0,0,0)"
			});
		}
		setTimeout(function() {
			t = p;
		}, 0);
	});
	$('.onlogin').click(function() {
		$('.alert_mask').height($(document.body).height()).width($(document.body).width());
		$('.alert_mask').fadeIn(300);
		$('.alert_login').show(400);
		$('.alert_clone').click(function() {
			$('.alert_mask').fadeOut(300);
			$('.alert_login').hide(400);
		});
	});
});
// index
$(function(){
	// 模式
	$('.moshi li').mouseover(function() {
		$(this).addClass('animated pulse');
	});
	$('.moshi li').mouseenter(function() {
		$(this).removeClass('animated pulse');
	});

	// 五网
	$('.wuwang .content ul').width(1150 * $('.wuwang .content li').length + 'px');
	$(".wuwang .tab a").mouseover(function() {
		$(this).addClass('on').siblings().removeClass('on');
		var index = $(this).index();
		number = index;
		var distance = -1150 * index;
		$('.wuwang .content ul').stop().animate({
			left: distance
		});
	});

	var auto = 1; //等于1则自动切换，其他任意数字则不自动切换
	if (auto == 1) {
		var number = 0;
		var maxNumber = $('.wuwang .tab a').length;

		function autotab() {
			number++;
			number == maxNumber ? number = 0 : number;
			$('.wuwang .tab a:eq(' + number + ')').addClass('on').siblings().removeClass('on');
			var distance = -1150 * number;
			$('.wuwang .content ul').stop().animate({
				left: distance
			});
		}
		var tabChange = setInterval(autotab, 3000);
		//鼠标悬停暂停切换
		$('.wuwang').mouseover(function() {
			clearInterval(tabChange);
		});
		$('.wuwang').mouseout(function() {
			tabChange = setInterval(autotab, 3000);
		});
	}

	// 优势
	$('.youshi_col').mouseover(function() {
		$(this).find('img').addClass('animated bounce');
	});
	$('.youshi_col').mouseenter(function() {
		$(this).find('img').removeClass('animated bounce');
	});



});

$(function() {
	// 定时弹出咨询弹窗
	var show_max_time = 60;
	var show_max_times = 2;
	var show_type = 0;
	var show_time = 1;
	var show_times = 0;
	var NUM = Number(sessionStorage.getItem('NUM'));

	function action() {
		setInterval(function() {
			if (NUM < show_max_times && show_type != 1 && show_time == show_max_time) {
				if ($(window).width() >= 1024) {
					$('.popup-mask').show();
					$(".site-modal").show();
					$('.site-modal').addClass('bounceIn');
					show_type = 1;
				}
			}
			show_time += 1;
			//console.log(show_time+"-"+NUM+"-"+show_type);
		}, 1000);
	}

	if (NUM == 0) {
		//console.log('执行if')
		sessionStorage.setItem('NUM', 0)
		action();
	} else {
		//console.log('执行else')
		action();
	}


	setInterval(function() {
		if (show_times < show_max_times && show_type != 1 && show_time == show_max_time) {
			$('.site-modal').removeClass('bounceIn').addClass('shake');
		}
	}, 6000);

	// 关闭咨询弹窗
	$('.btn-modal-close').on('click', function() {

		$('.popup-mask').hide();
		$(".site-modal").slideUp(200);
		show_time = 1;

		sessionStorage.setItem('NUM', NUM += 1)
		show_type = 0;
		//console.log(sessionStorage.getItem('NUM'))
	});

	//客服
	$('.kf_aside li').mouseover(function() {
		$(this).find('.a_con').addClass('animated bounce');
	})
	$('.kf_aside li').mouseenter(function() {
		$(this).find('.a_con').removeClass('animated bounce');
	})
	$(".kf_aside .to_top").click(function() {
		var speed = 300;
		$('body,html').animate({
			scrollTop: 0
		}, speed);
		return false;
	});

	// 注册链接
	$('.resUrl').attr('href', '/e/member/register/index.php?tobind=0&groupid=3&button=下一步');
});


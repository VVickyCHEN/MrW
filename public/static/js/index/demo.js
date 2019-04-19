$(document).ready(function(){
	var bodyid = $('body').attr('id');

	/*----------------???????????? ????????????--------------------------*/
	var windowHei = $(window).height();
	var windowWid = $(window).width();


	var screenRatio = windowWid/windowHei;
	var waypoint_offset;
	screenRatio > 1 ? waypoint_offset='30%':waypoint_offset='50%';
	$(window).resize(function(){
		windowHei = $(window).height();
		windowWid = $(window).width();
	    screenRatio = windowWid/windowHei;
		screenRatio > 1 ? waypoint_offset='30%':waypoint_offset='50%';
	});
	/*if($('#floors').length>0 && $('.floor').length>1){
	  var screenWidth = window.screen.width;
	  var currFloor=0;
	  if(screenWidth>1600){$('#floors').addClass('Widescreen')};
  
	  var floorSize = $('.floor').size();
	  for(f=0; f<floorSize; f++){
		$('#floors').append('<a rel="'+$('.floor').eq(f).attr('id')+'"><span>'+$('.floor').eq(f).attr('rel')+'</span><i></i></a><br>')  
	  }
	  $('#floors').append('<em id="ico_wheel"></em>')
	}*/
	
	$('.floor').waypoint(function(direction) {
	  if (bodyid=='body0'){
	    var myid=$(this.element).attr('id');
	    console.info(this.element);
	    console.info(myid);
	    $('#floors a[rel="' + myid + '"]').addClass('hover').siblings().removeClass('hover');
	    currFloor = $('#floors a[rel="' + myid + '"]').index();
	  }
	  /*????????????*/
	  $(this.element).find('.animated').each(function() {
		if($(this).attr('data-delay')){
			// alert(1);
		  $(this).css({'animation-delay':$(this).attr('data-delay'),'-moz-animation-delay':$(this).attr('data-delay'),'-webkit-animation-delay':$(this).attr('data-delay')});
		}
		$(this).css({'animation-play-state':'running','-webkit-animation-play-state':'running'});
		if($(this).attr('data-animated')){

		  $(this).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){

		    $(this).addClass($(this).attr('data-animated'));
		    	// alert($(this).attr('data-animated'));
		  })
		}
      });
	}, {
	  offset: waypoint_offset
	})
	
	$('#mark').waypoint(function(direction) {
	  if(direction=='up'){$('#header').removeClass('haveBG')};
	  if(direction=='down'){$('#header').addClass('haveBG')};
    }, {
	  offset:0
	})
	
	$('#floors a').click(function(){
		var myindex = $(this).index();
		var per;
		if(myindex<currFloor){
		  per=0.31
		}else{
		  per=0.3	
		}
		var myRel = $(this).attr('rel');
		offsetTop = $('#'+myRel).offset().top;
		$('body,html').stop(true,false).animate({ scrollTop:offsetTop-windowHei*per}, 800);
	})
	
/*-----------??????????????????--------------*/
  /*???????????????????????????????????????*/
  window.rqAnchor;
  window.rqAnchor = $.getUrlParam('anchor')
  if(rqAnchor){
    $("html, body").scrollTop(0).animate({scrollTop: $('#'+rqAnchor).offset().top},800);
  }
  
  /*????????????????????????????????????????????????????????????*/
  $('#body0').find('#floors').find('a').not('.spec').click(function(event){
	  event.preventDefault();
	  /*var keyw = 'anchor';
	  var myHref = $(this).attr('href');
	  var urlcs = '?'+myHref.split("?")[1];
	  var reg = new RegExp("(^|&)"+ keyw +"=([^&]*)(&|$)");
	  var r = urlcs.substr(1).match(reg);
	  if(r!=null){
		  //alert(unescape(r[2]));
		  var theTarget = unescape(r[2]);
		  $("html, body").animate({scrollTop: $('#'+theTarget).offset().top},800);
		  $('#'+theTarget).click();
	  }else{
		  window.location.href = myHref;
	  }*/
  })
	
});

/*????????????????????????*/
(function($){
  $.getUrlParam = function(name)
  {
  var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
  var r = window.location.search.substr(1).match(reg);
  if (r!=null) return unescape(r[2]); return null;
  }
})(jQuery);

//----------??????????????????
  (function () {
	$.fn.Slideshow = function (speed,autoHei) {
		return this.each(function (i) {
		  var curr = 0,
			  child_size = $(this).find('dl').size(),
			  firstLi = $(this).find('dl:first').html(),
			  autoPlay = true,
			  millisec = 4000,/*??????????????????*/
			  _this = $(this);
		  
		  if(autoHei=='true'){
			_this.append('<div style="overflow:hidden; font-size:0; line-height:0;opacity:0;filter:alpha(opacity=0); -moz-opacity:0; -khtml-opacity:0;">'+firstLi+'</div>');	
		  }
		  /*????????????*/
		  if(child_size>1){
			var btn = "<a class='prev'></a><a class='next'></a>";
			$(this).append(btn);
		  }
		  
		  /*???????????????*/
		  $(this).find('.prev').click(function() {
			  todo = curr-1<0?child_size-1:curr-1;
			  var currLi = _this.find('dl').eq(curr);
			  var prevLi = _this.find('dl').eq(todo);
			  currLi.css({'z-index':1}).stop(true,false).animate({'left':'100%'},speed,function(){$(this).css('display','none')});
			  prevLi.css({'z-index':2,'display':'block','left':'-100%'}).stop(true,false).animate({'left':'0'},speed);
			  curr = todo;
			  var slideIndex=todo+1;
			  slideIndex=slideIndex<10?'0'+slideIndex:slideIndex;
			  $('#slideIndex').html(slideIndex);
		  });
	  
		  /*???????????????*/
		  $(this).find('.next').click(function() {
			  todo = (curr + 1) % child_size;
			  var currLi = _this.find('dl').eq(curr);
			  var nextLi = _this.find('dl').eq(todo);
			  currLi.css({'z-index':2}).stop(true,false).animate({'left':'-100%'},speed,function(){$(this).css('display','none')});
			  nextLi.css({'z-index':1,'display':'block','left':'100%'}).stop(true,false).animate({'left':'0'},speed);
			  curr = todo;
			  var slideIndex=todo+1;
			  slideIndex=slideIndex<10?'0'+slideIndex:slideIndex;
			  $('#slideIndex').html(slideIndex);
		  });
		  
		  /*?????????*/
		  auto_Play = setInterval(function() {
			if(autoPlay && child_size>0){
			   _this.find('.next').click();
			}
		  },millisec);
		  
		  $(this).hover(function() {
			autoPlay = false;
		  },function() {
			autoPlay = true;
		  })
  
		});
	};
  })(jQuery);

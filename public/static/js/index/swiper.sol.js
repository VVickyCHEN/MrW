var swiper = new Swiper('.swiper-container', {
    scrollbar: '.swiper-scrollbar',
    direction: 'vertical',
    slidesPerView: 'auto',
    mousewheelControl: true,
    freeMode: true,
	freeModeMomentumRatio : 2,
});
   var anis = swiper.slides[0].querySelectorAll('.ani');
   for(i=0;i<anis.length;i++){
	   anis[i].style.visibility ='hidden' ;
	   anis[i].classCache=anis[i].className;
	   anis[i].className ='';
   }
setInterval(checkScroll,50);

function checkScroll(){
	
	_wrapperTranslate=swiper.getWrapperTranslate()
	
	for(i=0;i<anis.length;i++){
		if(anis[i].offsetTop<(-_wrapperTranslate+swiper.height-50) && anis[i].style.visibility =='hidden'){
			anis[i].style.visibility ='visible';
			anis[i].className = "" + anis[i].classCache + " " + 'animated';
			
			}
		}
	
	}
$(document).ready(function() {
	var hstPos = $('div.main .ct .hst-menu').position();
	var hstPos_ = hstPos.top - 80;
	$(window).scroll(function() {
		var wPos = $(window).scrollTop();
		console.log('Window pos...' + wPos);
		console.log('hst pos...' + hstPos_);
		//header glow
		if(wPos>10){
			$('div.header').addClass('scroll-glow');
		}else if(wPos<10){
			$('div.header').removeClass('scroll-glow');	
		}
		if (wPos >= hstPos_) {
			$('div.main .ct .hst-menu').addClass('hst-fixed');
		} else {
			$('div.main .ct .hst-menu').removeClass('hst-fixed');
		}
	});
});

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
	
	$('div.main .rp .l-avatar img, div.main .rp .lj a[type="login"]').hover(function(){
		$('div.main .rp .signin').addClass('active-signin');
	});
	
	$('div.main .rp .l-avatar img, div.main .rp .lj a[type="login"]').click(function(){
		$('div.main .rp .signin').addClass('active-signin');
		console.log('cliked login................');
		return false;
	});
	
	//login boxes
	$('div.signin .input .xxx.email').click(function(){
		$('div.signin .input input[type="text"]').val('');
	});
	$('div.signin .input .xxx.password').click(function(){
		$('div.signin .input input[type="password"]').val('');
	});
	
	$('div.signin .input input[type="password"]').keypress(function(e) {
      var is_shift_pressed = false;
      if (e.shiftKey) {
        is_shift_pressed = e.shiftKey;
      } else if (e.modifiers) {
        is_shift_pressed = !!(e.modifiers & 4);
      }
      if (((e.which >= 65 && e.which <=  90) && !is_shift_pressed) || ((e.which >= 97 && e.which <= 122) && is_shift_pressed)) {
        $("div.signin .input .capslock").show();    
      } else {
        $("div.signin .input .capslock").hide();  
      }
 });
});

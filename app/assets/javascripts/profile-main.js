$(function() {
	jQuery.fx.interval = 10;
	$('div.main .ct.profile .dh .dheader a').click(function() {
		//get the href
		var href = $(this).data('href');
		$('div.main .ct.profile .dh .dheader a').removeClass('active-option');
		$(this).addClass('active-option');
		var activeContent = 'div.main .ct.profile .dh .dcontent .dcontent-options.' + href;
		console.log('active content: ' + activeContent);
		//hide all contents.
		$('div.main .ct.profile .dh .dcontent .dcontent-options').hide();
		$(activeContent).show();
		return false;
	});

	$('a#add-account').click(function() {
		var active = $(this).data('active');
		if (active === false) {
			//show status update
			$('div#status-update-panel').slideDown(300, function() {
				$(this).show();
				$('span#status-update').show();
			});
			$(this).data('active', true);
		} else {
			//hide status update
			$('div#status-update-panel').slideUp(300, function() {
				$(this).hide();
				$('span#status-update').hide();
			});
			$(this).data('active', false);
		}
		return false;
	});
});

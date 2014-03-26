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
			$('p#add-content-option').slideDown(300, function() {
				$(this).show();
			});
			$(this).data('active', true);
		} else {
			//hide status update
			$('p#add-content-option').slideUp(300, function() {
				$(this).hide();
			});
			$(this).data('active', false);
		}
		return false;
	});

	$('p#add-content-option input[type="radio"]').change(function() {
		if ($(this).is(':checked')) {
			var info = ' : ' + $(this).val();
			var panel = $(this).data('panel');
			var hidecontent = $(this).data('hidecontent');
			//close all of them
			$('div.status-update').slideUp(300, function() {
				$(this).hide();
				$('span#status-update').hide();
			});
			//if it was hidden, unhide
			$('#my-content').show();
			//then show the current
			$('div#' + panel).slideDown(300, function() {
				$(this).show();
				$('span#status-update').html(info);
				$('span#status-update').show();
				//let it go away
				$('p#add-content-option').hide();
				if (hidecontent === true) {
					$('#my-content').hide();
				}
			});
			return false;
		}
	});

	//font-size changes.
	var classStyles = 'div.pref .pref-option .op-detail span.s-small,div.pref .pref-option .op-detail span.s-medium,div.pref .pref-option .op-detail span.s-big';
	$(classStyles).click(function() {
		$(classStyles).removeClass('selected');
		$(this).addClass('selected');
	});
});

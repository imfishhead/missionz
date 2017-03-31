$(window).load(function() {
	$('[data-seemore]').click(function() {
		$('#pop').show()
		$('body').css('overflow', 'hidden')
	})
	$('#pop .close').click(function() {
		$('#pop').hide()
		$('body').css('overflow', 'auto')
	})

	$('.can-you-guess-who-this-is').on( 'touchstart', function() {
		$(this).toggleClass('nohover')
	})
})





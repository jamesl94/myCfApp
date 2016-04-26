ready = ->
	#Alert fading
	$('.alert').delay(5000).fadeOut(1000)

	#Raty funcitonality
	$('.rating').raty(path: '/assets/images', scoreName: 'comment[rating]')
	$('.rated').raty(path: '/assets/images', readOnly: true, \
		score: -> return $(this).attr('data-score'))

$(document).ready(ready)
$(document).on('page:load', ready)
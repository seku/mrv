$(document).ready ->
	$('.hero-images .image').first().addClass('animate');
	$('.hero-images .image').on 'animationend webkitAnimationEnd oanimationend MSAnimationEnd', (_e) ->
		if _e.originalEvent.propertyName == 'opacity'
			console.log 'exit'
			return false

		$image = $(this)
		$next = $image.next()

		if $next.length == 0
			$next = $image.siblings().first()

		console.log $next
		# $image.removeClass 'animate'
		$image.toggleClass 'animate'
		$next.toggleClass 'animate'
		return false
	return

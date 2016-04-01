# $(document).ready ->
#   setInterval (->
#     $current = $('.hero-images .show')
#     $next = if $current.next().length > 0 then $current.next() else $current.siblings().first()
#     $current.removeClass 'show'
#     $next.addClass 'show'
#     return
#   ), 6000
#
$('.hero-images .image').first().addClass('animate');

$('.hero-images .image').on 'animationend', (_e) ->
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

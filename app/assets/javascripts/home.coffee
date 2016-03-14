$(document).ready ->
  setInterval (->
    $current = $('.hero-images .show')
    $next = if $current.next().length > 0 then $current.next() else $current.siblings().first()
    $current.removeClass 'show'
    $next.addClass 'show'
    return
  ), 6000
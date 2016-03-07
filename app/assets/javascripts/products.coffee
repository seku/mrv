$(document).ready ->
  initializeEasyZoom = ->
    unless window.$api  
      $easyzoom = $('.products .categories.current .easyzoom').easyZoom()
      window.$api = $easyzoom.data('easyZoom') 

  teardownEasyZoom = ->
    if window.$api  
      window.$api.teardown()
      window.$api = null           

  displayCategory = (id) ->
    teardownEasyZoom()

    $(".categories").removeClass("current")
    $(".categories" + id).addClass("current")
    $(".navigation_frames").hide()

    initializeEasyZoom() 

    $(".products .categories.current .thumbnails.extendable img").click (e) ->
      e.preventDefault()
      small_src = $(this).attr("src")
      large_src = $(this).data("large")
      initializeEasyZoom()
      window.$api.swap(small_src, large_src)

    $(".products .categories.current .thumbnails.static img").click (e) ->
      e.preventDefault()
      src = $(this).data("large")
      teardownEasyZoom()
      $(".products .categories.current .easyzoom img").attr("src", src)

  $(".products .block ul a").unbind().click (e) ->
    e.preventDefault()
    id = $(this).attr("href")
    displayCategory(id)

  $(".products .navigation_frames li").unbind().click (e) ->
    id = $(this).attr('id')
    displayCategory("##{id}")

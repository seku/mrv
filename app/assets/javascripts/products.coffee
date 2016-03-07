$(document).ready ->
  displayCategory = (id) ->
    $(".categories").hide()
    $(".categories" + id).show()
    $(".frames").hide()  
    $easyzoom = $('.easyzoom').easyZoom()
    api = $easyzoom.data('easyZoom')

  $(".products .block ul a").click (e) ->
    e.preventDefault()
    id = $(this).attr("href")
    displayCategory(id)

  $(".products .frames li").click (e) ->
    id = $(this).attr('id')
    displayCategory("##{id}")

  $(".products .thumbnails.extendable img").click (e) ->
    e.preventDefault()
    small_src = $(this).attr("src")
    large_src = $(this).data("zoom-image")
    main = $(".products .categories:visible .main_img:visible")
    main.attr("src", small_src)
    main.attr("data-zoom-image", large_src)
    main.unbind().removeData()

  $(".products .thumbnails.static img").click (e) ->
    e.preventDefault()
    src = $(this).attr("src")
    main = $(".products .categories:visible .main_img:visible")
    main.attr("src", src)

  # easyzoom.js
  # $easyzoom = $('.easyzoom').easyZoom()
  # api = $easyzoom.data('easyZoom')

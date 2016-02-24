$(document).ready ->
  $.each $("nav li"), (index, el) ->
    xx = $(el).find("a").attr("href")
    if window.location.pathname == "/" + xx
      $(el).addClass("current")   

  $(".products .block ul a, .products .frames a").click (e) ->
    e.preventDefault()
    id = $(this).attr("href")
    $(".categories").hide()
    $(".categories" + id).show()
    $(".frames").hide() 

  $(".products .thumbnails img").click (e) ->
    e.preventDefault()
    src = $(this).attr("src")
    $(".products .categories:visible .main_img").attr("src", src)

  # http://www.elevateweb.co.uk/image-zoom/examples
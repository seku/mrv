$(document).ready ->
  $(".search").autocomplete
    source: [ "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby" ]
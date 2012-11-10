e = undefined

$(".right-menu").mouseenter(->
  clearTimeout(e)
  $("#dropdown").show()
).mouseleave ->
  e = setTimeout(->
    $("#dropdown").hide()
  , 600)
  return

$(document).ready ->
  $('.expandable').mouseover( ->
    $(this).addClass('dark-background')
  ).mouseleave ->
    $(this).removeClass('dark-background')

  $('.expandable').click (e) ->
    $(this).removeClass('dark-background')
    $(this).unbind('mouseover')
    $(this).unbind('click')
    content = $(this).children(".content")
    content.show()
    top = $(this).offset().top
    $('html, body').animate
      scrollTop: top
    , 1000

    return false


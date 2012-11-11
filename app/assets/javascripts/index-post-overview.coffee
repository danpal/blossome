$('.expandable').mouseover( ->
  $(this).addClass('dark-background')
).mouseleave ->
  $(this).removeClass('dark-background')

$('.expandable').click (e) ->
  $(this).removeClass('dark-background')
  $(this).unbind('mouseover')
  content = $(this).children(".content")
  content.show()
  top = $(this).offset().top
  $(window).scrollTop(top)


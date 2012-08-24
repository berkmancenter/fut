$(".aspect-answer").on "click", ->
  $(this).next().toggle 200
  arrow = $(this).children("td:last-child").children("img")
  if arrow.hasClass("closed")
    arrow.removeClass "closed"
  else
    arrow.addClass "closed"
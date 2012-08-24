$(".tab-content").find(".tab-pane").eq(0).addClass "active"
$("#aspects a").click (e) ->
  e.preventDefault()
  $(this).tab "show"

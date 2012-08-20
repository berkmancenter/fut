$("input[type=radio]").click ->
  
  #To highlight the checked answer
  $(this).siblings("span").addClass "input-checked"
  $(this).closest(".answer").siblings(".answer").children("label").children("span").removeClass "input-checked"
  
  #To light the corresponded lamp
  $this = $(this)
  fair = ["1", "2", "3", "4", "5", "6", "7", "10", "11", "12", "14", "21", "23"]
  notfair = ["9", "13", "17", "18", "19", "20", "22"]
  name = $this.attr("name")
  value = $this.val()
  lamp = $("div[name*=\"" + name + "\"]")
  unless ($.inArray(value, fair)) is -1
    lamp.css "background", "green"
  else unless ($.inArray(value, notfair)) is -1
    lamp.css "background", "red"
  else
    lamp.css "background", "orange"


#Hide Questions and show them one by one
$(".question-box:nth-child(1)").show()
$("button[name*=\"next\"]").click ->
  $(this).closest(".question-box").fadeOut().next().fadeIn()

$("button[name*=\"back\"]").click ->
  $(this).closest(".question-box").fadeOut().prev().fadeIn()

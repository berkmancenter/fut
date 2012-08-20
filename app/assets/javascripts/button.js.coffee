#To Disable Submit button until answering all questions
$("input:radio").change ->
  names = []
  allChecked = true
  $("input:radio").each ->
    names.push $(this).attr("name")  if names.indexOf($(this).attr("name")) is -1

  i = 0
  cnt = names.length

  while i < cnt
    allChecked = false  unless $("input[name=\"" + names[i] + "\"]").is(":checked")
    i++
  if allChecked
    if $("#submit")
      $("#submit").removeAttr("disabled").addClass "btn-warning"
     if $("#result-btn")
      $("#result-btn").removeAttr("disabled").css "background-color", "red"


#To Activate tooltip hint
$(".info").tooltip()
(->
  $(".js-bosses").change ->
    console.info("as")
    $(@).parent().toggleClass "active"
)()


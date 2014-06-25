class SunsetRider.Pages.Scores
  init: ->
    @initCheckBosses()

  initCheckBosses: ->
    $(".js-bosses").change ->
      $(@).parent().toggleClass "active"

$ ->
  new SunsetRider.Pages.Scores().init()

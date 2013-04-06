Winston.Views ||= {}

class Winston.Views.Index extends Backbone.View
  
  indexTemplate: JST["backbone/templates/index"]
  aboutTemplate: JST["backbone/templates/static/about"]
  
  el: "body"
  staticElement: ".static"
  
  initialize: (works) ->
    $(@el).html(@indexTemplate())
    @works = works
  
  setImage: (url) ->
    $(".background-container").css("background-image", "url(" + url + ")")
    
  resetLinks: (param) ->
    $(".nav a").removeClass("active")
    $(".nav a[data-param='#{param}']").addClass("active")
  
  # Transitions
  fadeOut: ->
    $(".background-container").stop().animate({"opacity":"0"}, 400)
    $(".header-container h1").stop().animate({"opacity":"0"}, 400)
  
  fadeIn: (home) ->
    $(".background-container").stop().animate({"opacity":"0.5"}, 1200)
    if home
      $(".header-container h1").stop().show().css("opacity","0").animate({"opacity":"0.9"}, 1200)
  
  transitionBackground: (url) ->
    @fadeOut()
    _.delay(@setImage, 500, url)
    _.delay(@fadeIn, 600)
   
  renderStatic: (model) ->
    text = model.get("content")
    param = model.get("paralink")
    console.log model
    @resetLinks(param)
    #$(@staticElement).html(@staticTemplate(text: text))
  
  clearStatic: ->
    $(@staticElement).html("")
  
  # About
  renderAbout: (model) ->
    $(".header-container h1").hide()
    @transitionBackground("/assets/background/2.jpg")
    text = model.get("content")
    @resetLinks("about")
    $(@staticElement).html(@aboutTemplate(text: text))
  
  # Resume
  renderResume: (model) ->
    #@setImage("/assets/background/3.jpg")
    #text = model.get("content")
    @resetLinks("resume")
  
  # Index  
  render: ->
    @transitionBackground("/assets/background/1.jpg")
    @fadeIn(true)
    @resetLinks("home")
    @clearStatic()
  
  fadedRender: ->
    @setImage("/assets/background/1.jpg")
    $(".background-container").css("opacity","1")
    _.delay(@fadeIn, 500, true)
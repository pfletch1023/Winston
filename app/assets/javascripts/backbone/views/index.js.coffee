Winston.Views ||= {}

class Winston.Views.Index extends Backbone.View
  
  indexTemplate: JST["backbone/templates/index"]
  aboutTemplate: JST["backbone/templates/static/about"]
  
  el: "body"
  
  initialize: (options) ->
    $(@el).html(@indexTemplate(image: "/assets/background/1.jpg", state: options.state))
  
  toggleHeader: (state) ->
    if state == "open"
      $(".container").html("").hide()
      $(".header").removeClass "closed"
    else
      $(".header").addClass "closed"
      $(".container").show(300)
      
  setImage: (url) ->
    $(".background-container").css("background-image", "url(" + url + ")")
    
  resetLinks: (param) ->
    $(".nav a").removeClass("active")
    $(".nav a[data-param='#{param}']").addClass("active")

  # Statics (About, Resume, Press, Contact)
  renderStatic: (collection, param) ->
    @toggleHeader("closed")
    @resetLinks(param)
    @staticView = new Winston.Views.Static(collection, param)
  
  # /Works
  renderWorks: (works) ->
    @toggleHeader("closed")
    @resetLinks("works")
    @worksView = new Winston.Views.Works(works)
  
  # /Gallery
  renderGallery: (works) ->
    @toggleHeader("closed")
    @resetLinks("gallery")
  
  # Home  
  render: ->
    @toggleHeader("open")
    @resetLinks("home")
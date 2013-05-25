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
  renderStatic: (param) ->
    @toggleHeader("closed")
    @resetLinks(param)
    if @statics && @staticView
      @staticView.reset(@statics, param)
    else
      @statics = new Winston.Collections.Statics
      @statics.fetch success: (data) =>
        @staticView = new Winston.Views.Static(@statics, param)
  
  # /Works
  renderWorks: (works) ->
    @toggleHeader("closed")
    @resetLinks("works")
    if @worksCollection && @worksView
      @worksView.reset()
    else
      @worksCollection = new Winston.Collections.Works
      @worksCollection.url = "/types/performance/works"
      @worksCollection.fetch success: (data) =>
        @worksView = new Winston.Views.Works(@worksCollection)
  
  # /Gallery
  renderGallery: (works) ->
    @toggleHeader("closed")
    @resetLinks("gallery")
    if @galleryCollection && @galleryView
      @galleryView.reset()
    else
      @galleryCollection = new Winston.Collections.Works
      @galleryCollection.url = "/gallery/works"
      @galleryCollection.fetch success: (data) =>
        @galleryView = new Winston.Views.Gallery(@galleryCollection)
  
  # Home  
  render: ->
    @toggleHeader("open")
    @resetLinks("home")
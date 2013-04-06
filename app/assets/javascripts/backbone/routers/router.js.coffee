class Winston.Routers.Router extends Backbone.Router
  
  initialize: (options) ->
    @works = new Winston.Collections.Works
    @works.add(options.works.models)
    @view = new Winston.Views.Index(@works)
    @welcome = true
  
  toggleHeader: (state) ->
    if state == "open"
      $(".header").removeClass("closed")
    else
      $(".header").addClass("closed")
  
  routes:
    ".*" : "index"
    "about" : "about"
    "resume" : "resume"
    "works" : "works"
    "gallery" : "gallery"
    "press" : "press"
    "contact" : "contact"
    
  index: ->
    if @welcome
      @view.fadedRender()
    else
      @view.render()
      @toggleHeader("open")
      @welcome = false
  
  about: ->
    @welcome = false
    @toggleHeader("open")
    if @aboutModel
      @view.renderAbout(@aboutModel)
    else
      @aboutModel = new Winston.Models.Static
      @aboutModel.url = "/statics/about"
      @aboutModel.fetch success: (model) =>
        @view.renderAbout(@aboutModel)
  
  resume: ->
    @welcome = false
    #@toggleHeader("closed")
    if @resumeModel
      @view.renderResume(@resumeModel)
    else
      @resumeModel = new Winston.Models.Static
      @resumeModel.url = "/statics/resume"
      @resumeModel.fetch success: (model) =>
        @view.renderResume(@resumeModel)
  
  works: ->
    @welcome = false
    #@toggleHeader("closed")
  
  gallery: ->
    @welcome = false
    #@toggleHeader("closed")
  
  press: ->
    @welcome = false
    #@toggleHeader("closed")
    if @pressModel
      @view.renderStatic(@pressModel)
    else
      @pressModel = new Winston.Models.Static
      @pressModel.url = "/statics/press"
      @pressModel.fetch success: (model) =>
        @view.renderStatic(@pressModel)
  
  contact: ->
    @welcome = false
    #@toggleHeader("closed")
    if @contactModel
      @view.renderStatic(@contactModel)
    else
      @contactModel = new Winston.Models.Static
      @contactModel.url = "/statics/contact"
      @contactModel.fetch success: (model) =>
        @view.renderStatic(@contactModel)
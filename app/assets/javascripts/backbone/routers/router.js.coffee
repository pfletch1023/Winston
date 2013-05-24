class Winston.Routers.Router extends Backbone.Router
  
  initialize: (options) ->
    # Nothing yet
  
  routes:
    "works" : "works"
    "gallery" : "gallery"
    ":param" : "static"
    ".*" : "index"
    
  index: ->
    @view = new Winston.Views.Index(state: "open") unless @view
    @view.render()
  
  static: (param) ->
    @view = new Winston.Views.Index(state: "closed") unless @view
    if @statics
      @view.renderStatic(@statics, param)
    else
      @statics = new Winston.Collections.Statics
      @statics.fetch success: (data) =>
        @view.renderStatic(@statics, param)
  
  works: ->
    @view = new Winston.Views.Index(state: "closed") unless @view
    @view.renderWorks()
  
  gallery: ->
    @view = new Winston.Views.Index(state: "closed") unless @view
    @view.renderGallery()

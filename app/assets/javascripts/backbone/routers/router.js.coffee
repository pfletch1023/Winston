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
    @view.render(@welcome)
  
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
    if @worksCollection
      @view.renderWorks(@worksCollection)
    else
      @worksCollection = new Winston.Collections.Works
      @worksCollection.url = "/types/performance/works"
      @worksCollection.fetch success: (data) =>
        @view.renderWorks(data)
  
  gallery: ->
    @view = new Winston.Views.Index(state: "closed") unless @view
    if @galleryCollection
      @view.renderGallery(@galleryCollection)
    else
      @galleryCollection = new Winston.Collections.Works
      @galleryCollection.url = "/gallery/works"
      @galleryCollection.fetch success: (data) =>
        @view.renderGallery(data)

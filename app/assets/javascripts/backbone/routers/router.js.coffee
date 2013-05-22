class Winston.Routers.Router extends Backbone.Router
  
  initialize: (options) ->
    @works = new Winston.Collections.Works(options.works)
  
  routes:
    "works" : "works"
    "gallery" : "gallery"
    ":param" : "static"
    ".*" : "index"
    
  index: ->
    @view = new Winston.Views.Index(works: @works, state: "open") unless @view
    @view.render(@welcome)
  
  static: (param) ->
    @view = new Winston.Views.Index(works: @works, state: "closed") unless @view
    if @statics
      @view.renderStatic(@statics, param)
    else
      @statics = new Winston.Collections.Statics
      @statics.fetch success: (data) =>
        @view.renderStatic(@statics, param)
  
  works: ->
    @view = new Winston.Views.Index(works: @works, state: "closed") unless @view
  
  gallery: ->
    @view = new Winston.Views.Index(works: @works, state: "closed") unless @view

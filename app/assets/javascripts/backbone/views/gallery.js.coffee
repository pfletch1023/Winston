Winston.Views ||= {}

class Winston.Views.Gallery extends Backbone.View
  
  template: JST["backbone/templates/gallery"]
  imageTemplate: JST["backbone/templates/image"]
  slideTemplate: JST["backbone/templates/slide"]
  
  el: ".container"
  className: "gallery"
  
  initialize: (collection) =>
    @collection = collection
    $(@el).html("").addClass "loading"
    _.delay(@render, 500)
  
  addOne: (model) ->
    $(".gallery-works #slideshow").append(@slideTemplate(model.toJSON()))
  
  addSelected: (model) ->
    $(".gallery-works #selected").html(@imageTemplate(model.toJSON()))
    id = model.get('id')
    $(".image").removeClass "active"
    $("#slideshow .image[data-id='" + id + "']").addClass "active"
    
  render: =>
    $(@el).removeClass("loading").html(@template())
    for model in  @collection.models
      @addOne(model)
    @addSelected(@collection.models[0])
    return this
  
  events: 
    "click .image" : "changeSelected"
    "click #selected img" : "expandImage"
  
  changeSelected: (event) ->
    id = $(event.target).data('id')
    model = @collection.get(id)
    @addSelected(model)
  
  expandImage: (event) ->
    id = $(event.target).data('id')
    model = @collection.get(id)
    $("#expanded-image").html(@imageTemplate(model.toJSON()))
    $("#expanded-image").addClass "open"
  
  contractImage: (event) ->
    $(".gallery-works").css("background-image", "none")
    $("#selected img").removeClass "transparent"
    
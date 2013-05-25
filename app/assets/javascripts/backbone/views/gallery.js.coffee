Winston.Views ||= {}

class Winston.Views.Gallery extends Backbone.View
  
  template: JST["backbone/templates/gallery"]
  imageTemplate: JST["backbone/templates/image"]
  slideTemplate: JST["backbone/templates/slide"]
  
  el: ".container"
  className: "gallery"
  
  initialize: (collection) =>
    @collection = collection
    @reset()
    
  reset: ->
    $(@el).html("").addClass "loading"
    $('body').on("keyup", @key)
    _.delay(@render, 500)
  
  addOne: (model) ->
    $(".gallery-works #slideshow").append(@slideTemplate(model.toJSON()))
  
  setArrows: ->
    width = $("#selected img").width() + 100
    $("#left").css("margin-left", "-" + (width / 2) + "px");
    $("#right").css("margin-right", "-" + (width / 2) + "px");
  
  setExpandedArrows: ->
    width = $("#expanded-image img").width() - 60
    $("#expanded-image #left").css("margin-left", "-" + (width / 2) + "px");
    $("#expanded-image #right").css("margin-right", "-" + (width / 2) + "px");
    
  addSelected: (model) ->
    i = @collection.indexOf(model)
    $(".gallery-works #selected").html(@imageTemplate(image: model.toJSON(), i: i))
    if $("#expanded-image").hasClass "open"
      $("#expanded-image #image").html(@imageTemplate(image: model.toJSON(), i: i))
      $("#expanded-image img").load @setExpandedArrows
    id = model.get('id')
    $(".image").removeClass "active"
    $("#slideshow .image[data-id='" + id + "']").addClass "active"
    $("#selected img").load @setArrows
    
  nextIndex: (i) ->
    length = @collection.length
    if i < (length - 1)
      return i + 1
    else if i == (length - 1)
      return 0
  
  previousIndex: (i) ->
    length = @collection.length
    if i > 0
      return i - 1
    else if i == 0
      return length - 1
    
  render: =>
    $(@el).removeClass("loading").html(@template())
    for model in  @collection.models
      @addOne(model)
    @addSelected(@collection.models[0])
    return this
  
  events: 
    "click .image" : "changeSelected"
    "click #selected img" : "expandImage"
    "click #left" : "left"
    "click #right" : "right"
    "click #expanded-image" : "exit"
  
  changeSelected: (event) ->
    id = $(event.target).data('id')
    model = @collection.get(id)
    @addSelected(model)
  
  expandImage: (event) ->
    id = $(event.target).data('id')
    model = @collection.get(id)
    i = $(event.target).data('index')
    $("#expanded-image #image").html(@imageTemplate(image: model.toJSON(), i: i))
    $("#expanded-image").addClass "open"
    $("#expanded-image img").load @setExpandedArrows

  left: (event) ->
    i = $("#selected img").data("index")
    index = @previousIndex(i)
    @addSelected(@collection.at(index))

  right: (event) ->
    i = $("#selected img").data("index")
    index = @nextIndex(i)
    @addSelected(@collection.at(index))
  
  exit: (event) ->
    if $(event.target).hasClass "background"
      $("#expanded-image #image").html("")
      $("#expanded-image").removeClass "open"
    
  key: (event) =>
    if event.keyCode == 27
      $("#expanded-image #image").html("")
      $("#expanded-image").removeClass "open"
    else if event.keyCode == 39
      @right(event)
    else if event.keyCode == 37
      @left(event)
    
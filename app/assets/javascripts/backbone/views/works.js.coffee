Winston.Views ||= {}

class Winston.Views.Works extends Backbone.View
  
  template: JST["backbone/templates/works"]
  workTemplate: JST["backbone/templates/work"]
  
  el: ".container"
  className: "works"
  
  initialize: (collection) =>
    @collection = collection
    $(@el).html("").addClass "loading"
    _.delay(@render, 500)
  
  addOne: (model, i) ->
    console.log model
    $(".works .column[data-id='" + i + "']").append(@workTemplate(model.toJSON()))
  
  nextI: (num) ->
    if num < 3
      return num + 1
    else
      return 0
      
  render: =>
    $(@el).removeClass("loading").html(@template())
    i = 0
    for model in @collection.models
      @addOne(model, i)
      i = @nextI(i)
    return this
    
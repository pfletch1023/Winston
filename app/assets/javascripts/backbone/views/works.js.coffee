Winston.Views ||= {}

class Winston.Views.Works extends Backbone.View
  
  template: JST["backbone/templates/works"]
  workTemplate: JST["backbone/templates/work"]
  
  el: ".container"
  className: "works"
  
  initialize: (collection) =>
    @collection = collection
    @reset()
  
  reset: ->
    $(@el).html("").addClass "loading"
    _.delay(@render, 500)
  
  addOne: (model, i) ->
    $(".works .column[data-id='" + i + "']").append(@workTemplate(model.toJSON()))
  
  nextI: (num) ->
    if num < 3
      return num + 1
    else
      return 0
  
  renderResults: (results) ->
    $("#search input[type='submit']").val("→").removeClass("loading")
    $("#clear").show()
    for work in results.models
      id = work.get('id')
      $(".work[data-id='" + id + "']").removeClass "disabled"
  
  render: =>
    $(@el).removeClass("loading").html(@template())
    i = 0
    for model in @collection.models
      @addOne(model, i)
      i = @nextI(i)
    return this
  
  events: 
    "submit #search" : "search"
    "click #clear" : "clear"
  
  search: (event) ->
    event.preventDefault()
    s = $("#text").val()
    if s != ""
      $("#search input[type='submit']").html("").addClass "loading"
      $(".work").addClass "disabled"
      results = new Winston.Collections.Works
      results.url = "/search/" + s
      results.fetch( success: (data) =>
        @renderResults(data)
      )
    else
      $("#text").focus()      
  
  clear: (event) ->
    $(".work").removeClass "disabled"
    $("#text").val("").focus()
    $(event.target).hide()
    
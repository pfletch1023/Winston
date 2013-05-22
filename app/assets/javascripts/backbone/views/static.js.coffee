Winston.Views ||= {}

class Winston.Views.Static extends Backbone.View
  
  aboutTemplate: JST["backbone/templates/statics/about"]
  resumeTemplate: JST["backbone/templates/statics/resume"]
  pressTemplate: JST["backbone/templates/statics/press"]
  contactTemplate: JST["backbone/templates/statics/contact"]
  
  el: ".container"
  className: "wrapper"

  # Determine template
  template: (collection, param) ->
    if param == "about"
      return @aboutTemplate(collection: collection, param: param)
    else if param == "resume"
      return @resumeTemplate(collection: collection, param: param)
    else if param == "press"
      return @pressTemplate(collection: collection, param: param)
    else if param == "contact"
      return @contactTemplate(collection: collection, param: param)
  
  initialize: (collection, param) =>
    $(@el).html("").addClass "loading"
    _.delay(@render, 500, collection, param)
    
  render: (collection, param) =>
    $(@el).removeClass("loading").html( @template(collection, param) )
    $(@el).addClass("active")
    return this
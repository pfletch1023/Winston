Winston.Views ||= {}

class Winston.Views.Home extends Backbone.View
  
  template: JST["backbone/templates/pages/home"]
  
  className: "home page"

  initialize: ->
    console.log 'home view'
  
  render: ->
    $(@el).addClass("active")
    $(@el).html( @template() )
    return this
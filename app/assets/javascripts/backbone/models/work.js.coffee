class Winston.Models.Work extends Backbone.Model
  
  paramRoot: 'work'

  defaults:
    "name": null

class Winston.Collections.Works extends Backbone.Collection
  
  model: Winston.Models.Work
  url: '/works'

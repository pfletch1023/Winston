class Winston.Models.Static extends Backbone.Model
  
  paramRoot: 'static'

  defaults:
    "paralink" : null
    "content" : null

class Winston.Collections.Statics extends Backbone.Collection
  
  model: Winston.Models.Static
  url: '/statics'

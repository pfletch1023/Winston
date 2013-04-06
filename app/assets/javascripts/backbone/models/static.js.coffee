class Winston.Models.Static extends Backbone.Model
  
  paramRoot: 'static'

  defaults:
    "paralink" : null
    "content" : null

class Winston.Collections.StaticsCollection extends Backbone.Collection
  
  model: Winston.Models.Static
  url: '/statics'

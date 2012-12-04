define ['backbone'], (Backbone) ->
  class Task extends Backbone.Model
    defaults:
      desc: ''
      done: false

    initialize: ->
      @on 'change', -> console.log 'change'
define ['backbone'], (Backbone) ->
  class Task extends Backbone.Model
    defaults:
      desc: ''
      done: false
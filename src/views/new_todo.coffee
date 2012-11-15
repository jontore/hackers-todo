define [
  'jquery'
  'backbone'
  'text!./new_todo.html'], ($, Backbone, html) ->

  class NewTodo extends Backbone.View

    el: '#add-task'

    events:
      'keypress': 'onKeyPress'

    initialize: (tasks) ->
      @tasks = tasks

    render: ->
      @input = $(html)
      @$el.append this.input
      @input.focus()

    onKeyPress: (e) ->
      if e.keyCode is 13 and @input.val()
        @tasks.add
          desc: @input.val()
        @input.val('')
define [
  'jquery'
  'backbone'
  'rivets'
  'text!./todo_item.html'
], ($, Backbone, rivets, html) ->

  class TodoList extends Backbone.View

    tagName: 'li'

    events:
      'click': 'onClick'

    initialize: (task) ->
      @task = task
      task.on 'change', @onTaskCompleted

    render: ->
      @$el.append html
      rivets.bind @$el, task: @task

    onTaskCompleted: =>
      @$el.slideUp 'slow', =>
        @$el.remove()

    onClick: (e) ->
      @task.set('done', true)
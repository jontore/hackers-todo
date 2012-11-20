define [
  'jquery'
  'backbone'
  'rivets'
  'text!./todo_item.html'
], ($, Backbone, rivets, html) ->

  class TodoList extends Backbone.View

    tagName: 'li'

    events:
      'click i': 'onCheckClick'
 
    initialize: (task) ->
      @task = task
      task.on 'change', @onTaskCompleted

    render: ->
      @$el.append html
      rivets.bind @$el, task: @task

    onTaskCompleted: =>
      @$el.slideUp 'slow', =>
        @remove()

    onCheckClick: (e) ->
      @task.set('done', true)
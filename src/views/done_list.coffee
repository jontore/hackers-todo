define [
  'jquery'
  'backbone'
  'cs!./todo_item'
  'text!./done_list.html'
], ($, Backbone, TodoItem, html) ->

  class DoneList extends Backbone.View

    el: '#done-list'

    initialize: (tasks) ->
      tasks.on 'change', @onTaskCompleted

    render: ->
      @ul = $(html)
      @$el.append this.ul

    onTaskCompleted: (task) =>
      todoItem = new TodoItem task
      @ul.append todoItem.$el
      todoItem.render()
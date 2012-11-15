define [
  'jquery'
  'backbone'
  'cs!./todo_item'
  'text!./todo_list.html'
], ($, Backbone, TodoItem, html) ->

  class TodoList extends Backbone.View

    el: '#todo-list'

    initialize: (tasks) ->
      tasks.on 'add', @onTaskAdded

    render: ->
      @ul = $(html)
      @$el.append this.ul

    onTaskAdded: (task) =>
      todoItem = new TodoItem task
      @ul.append todoItem.$el
      todoItem.render()
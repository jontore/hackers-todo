define [
  'jquery'
  'backbone'
  'cs!./todo_item'
  'text!./todo_list.html'
], ($, Backbone, TodoItem, html) ->

  class TodoList extends Backbone.View

    el: '#todo-list'

    initialize: (tasks) ->
      @tasks = tasks
      @tasks.on 'add', @onTaskAdded

    render: ->
      @ul = $(html)
      @$el.append this.ul

      @tasks.fetch
        success: =>
          @tasks.each @onTaskAdded

    onTaskAdded: (task) =>
      todoItem = new TodoItem task
      @ul.append todoItem.$el
      todoItem.render()
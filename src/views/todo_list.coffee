define ['jquery', 'backbone', 'cs!./todo_item'], ($, Backbone, TodoItem) ->
  class TodoList extends Backbone.View

    el: '#todo-list'

    initialize: (tasks) ->
      @tasks = tasks
      tasks.on 'add', @onTaskAdded

    render: ->
      @ul = $('<ul class="nav nav-tabs nav-stacked" data-toggle="tabs"></ul>')
      @$el.append this.ul

    onTaskAdded: (task) =>
      todoItem = new TodoItem task
      @ul.append todoItem.$el
      todoItem.render()
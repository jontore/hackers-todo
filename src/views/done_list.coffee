define ['jquery', 'backbone', 'cs!./todo_item'], ($, Backbone, TodoItem) ->
  class DoneList extends Backbone.View

    el: '#done-list'

    initialize: (tasks) ->
      tasks.on 'change', @onTaskCompleted

    render: ->
      @ul = $('<ul class="nav nav-tabs nav-stacked" data-toggle="tabs" style="opacity: 0.3"></ul>');
      @$el.append this.ul

    onTaskCompleted: (task) =>
      todoItem = new TodoItem task
      @ul.append todoItem.$el
      todoItem.render()
define ['jquery', 'backbone'], ($, Backbone) ->
  class DoneList extends Backbone.View

    el: '#done-list'

    initialize: (tasks) ->
      tasks.on 'change', @onTaskCompleted

    render: ->
      @ul = $('<ul class="nav nav-tabs nav-stacked" data-toggle="tabs" style="opacity: 0.3"></ul>');
      @$el.append this.ul

    onTaskCompleted: (task) =>
      @ul.append("<li><a data-task-id=#{task.cid}>#{task.get('desc')}</a></li>");
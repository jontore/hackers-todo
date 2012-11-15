define ['jquery', 'backbone'], ($, Backbone) ->
  class TodoList extends Backbone.View

    el: '#todo-list'

    events:
      'click': 'onClick'

    initialize: (tasks) ->
      @tasks = tasks
      tasks.on 'add', @onTaskAdded
      tasks.on 'change', @onTaskCompleted

    render: ->
      @ul = $('<ul class="nav nav-tabs nav-stacked" data-toggle="tabs"></ul>')
      @$el.append this.ul

    onTaskAdded: (task) =>
      taskEl = $("<li><a data-task-id=#{task.cid}>#{task.get('desc')}</a></li>")
      @ul.append taskEl

    onTaskCompleted: (task) =>
      taskEl = @$el.find("[data-task-id=#{task.cid}]").parents('li')
      taskEl.slideUp 'slow', ->
        taskEl.remove()

    onClick: (e) ->
      cid = $(e.target).attr('data-task-id')
      @tasks.getByCid(cid).set('done', true)
define ['jquery', 'backbone'], ($, Backbone) ->
  class TodoList extends Backbone.View

    tagName: 'li'

    events:
      'click': 'onClick'

    initialize: (task) ->
      @task = task
      task.on 'change', @onTaskCompleted

    render: ->
      taskEl = $("<a data-task-id=#{@task.cid}>#{@task.get('desc')}</a>")
      @$el.append taskEl

    onTaskCompleted: =>
      @$el.slideUp 'slow', =>
        @$el.remove()

    onClick: (e) ->
      @task.set('done', true)
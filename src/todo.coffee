$ ->

  class Task extends Backbone.Model
    defaults:
      desc: ''
      done: false

  class TaskList extends Backbone.Collection
    model: Task

  class NewTodo extends Backbone.View

    el: '#add-task'

    events:
      'keypress': 'onKeyPress'

    initialize: (tasks) ->
      @tasks = tasks

    render: ->
      @input = $('<input id="add-task" type="text" placeholder="Add task" />')
      @$el.append this.input
      @input.focus()

    onKeyPress: (e) ->
      if e.keyCode is 13 and @input.val()
        @tasks.add
          desc: @input.val()
        @input.val('')

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

  class DoneList extends Backbone.View

    el: '#done-list'

    initialize: (tasks) ->
      tasks.on 'change', @onTaskCompleted

    render: ->
      @ul = $('<ul class="nav nav-tabs nav-stacked" data-toggle="tabs" style="opacity: 0.3"></ul>')
      @$el.append this.ul

    onTaskCompleted: (task) =>
      @ul.append "<li><a data-task-id=#{task.cid}>#{task.get('desc')}</a></li>"

  tasks = new TaskList

  new TodoList(tasks).render()
  new DoneList(tasks).render()
  new NewTodo(tasks).render()
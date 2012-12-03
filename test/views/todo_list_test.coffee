define [
  'cs!src/views/todo_list'
  'cs!src/models/tasklist'
], (TodoList, Tasklist) ->

  buster.testCase 'todo list'

    'fetches data from backend on render': ->
      view = new TodoList
        on: ->
        each: (cb) -> cb {desc: 'foo'}
        fetch: (opts) -> opts.success()
      
      view.onTaskAdded = @spy()

      view.render()

      assert.calledOnce view.onTaskAdded
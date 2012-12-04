define [
  'cs!src/views/todo_list'
], (TodoList) ->

  buster.testCase 'todo list'

    'fetches data from tasklist on render': ->
      view = new TodoList
        on: ->
        each: (cb) -> cb {desc: 'foo'}
        fetch: (opts) -> opts.success()
      view.onTaskAdded = @spy()
      
      view.render()

      assert.calledOnce view.onTaskAdded
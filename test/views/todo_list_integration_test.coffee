define [
  'cs!src/views/todo_list'
  'cs!src/models/tasklist'
], (TodoList, Tasklist) ->

  buster.testCase 'todo list integration test'

    'tearDown': ->
      @xhr?.restore()

    'fetches data from server on render': (done) ->
      list = new Tasklist
      view = new TodoList list
      view.onTaskAdded = @spy()

      @xhr = sinon.useFakeXMLHttpRequest()
      @xhr.onCreate = (xhr) =>
        _.defer ->
          xhr.respond 200, {}, '[{"desc": "foo"}]'
          assert.calledOnce view.onTaskAdded
          done()

      view.render()
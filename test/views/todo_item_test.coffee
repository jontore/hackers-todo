define [
  'cs!src/views/todo_item'
  'cs!src/models/task'
], (TodoItem, Task) ->
  buster.testCase 'todo item'

    'setUp': ->
      @task = new Task
        desc: 'test'
      @view = new TodoItem @task
      @view.render()

    'contains all elements': ->
      assert.equals @view.$el.find('i').size(), 1
      assert.equals @view.$el.find('span').size(), 1

    'removes item on task completed': (done) ->
      @view.remove = @spy()

      @view.onTaskCompleted @task, {}, =>
        assert.calledOnce @view.remove
        done()

    'on task completed click updates model': ->
      @view.$el.find('i').click()

      assert @task.get('done')
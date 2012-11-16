define [
  'cs!src/models/task'
], (Task) ->
  buster.testCase 'task model'
    'setUp': ->
      @model = new Task

    'has sensible default values': ->
      assert.equals @model.get('desc'), ''
      refute @model.get 'done'
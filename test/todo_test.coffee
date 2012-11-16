define [
  'cs!src/todo'
], (Todo) ->

  buster.testCase 'Todo'
    'exists': ->
      assert Todo
define [
  'cs!./models/tasklist'
  'cs!./views/todo_list'
  'cs!./views/done_list'
  'cs!./views/new_todo'
], (TaskList, TodoList, DoneList, NewTodo) ->
  class Todo
    constructor: ->
      tasks = new TaskList
      new TodoList(tasks).render()
      new DoneList(tasks).render()
      new NewTodo(tasks).render()
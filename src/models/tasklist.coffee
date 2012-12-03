define ['backbone', 'cs!./task'], (Backbone, Task) ->
  class TaskList extends Backbone.Collection
    url: '/api'
    model: Task
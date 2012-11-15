$(function() {

  var Task = Backbone.Model.extend({
    defaults: {
      desc: '',
      done: false
    }
  });

  var TaskList = Backbone.Collection.extend({
    model: Task
  });

  var NewTodo = Backbone.View.extend({

    el: '#add-task',

    events: {
      'keypress': 'onKeyPress'
    },

    initialize: function(tasks) {
      this.tasks = tasks;
    },

    render: function() {
      this.input = $('<input id="add-task" type="text" placeholder="Add task" />');
      this.$el.append(this.input);
      this.input.focus();
    },

    onKeyPress: function(e) {
      if (e.keyCode == 13 && this.input.val()) {
        this.tasks.add({
          desc: this.input.val()
        });
        this.input.val('');
      }
    }
  });

  var TodoList = Backbone.View.extend({

    el: '#todo-list',

    events: {
      'click': 'onClick'
    },

    initialize: function(tasks) {
      this.tasks = tasks;
      tasks.on('add', _.bind(this.onTaskAdded, this));
      tasks.on('change', _.bind(this.onTaskCompleted, this));
    },

    render: function() {
      this.ul = $('<ul class="nav nav-tabs nav-stacked" data-toggle="tabs"></ul>')
      this.$el.append(this.ul);
    },

    onTaskAdded: function(task) {
      var taskEl = $('<li><a data-task-id="' + task.cid + '">' + task.get('desc') + '</a></li>');
      this.ul.append(taskEl);
    },

    onTaskCompleted: function(task) {
      var taskEl = this.$el.find('[data-task-id=' + task.cid + ']').parents('li');
      taskEl.slideUp('slow', function() {
        taskEl.remove();
      });
    },

    onClick: function(e) {
      var cid = $(e.target).attr('data-task-id');
      this.tasks.getByCid(cid).set('done', true);
    }

  });

  var DoneList = Backbone.View.extend({

    el: '#done-list',

    initialize: function(tasks) {
      tasks.on('change', _.bind(this.onTaskCompleted, this));
    },

    render: function() {
      this.ul = $('<ul class="nav nav-tabs nav-stacked" data-toggle="tabs" style="opacity: 0.3"></ul>');
      this.$el.append(this.ul);
    },

    onTaskCompleted: function(task) {
      this.ul.append('<li><a data-task-id="' + task.cid + '">' + task.get('desc') + '</a></li>');
    }

  });

  var tasks = new TaskList();

  new TodoList(tasks).render();
  new DoneList(tasks).render();
  new NewTodo(tasks).render();

});
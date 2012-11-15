$(function() {

  var Task = Backbone.Model.extend({});

  var TaskList = Backbone.Collection.extend({
    model: Task
  });

  var AddTaskView = Backbone.View.extend({

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
        var frag = "<li><a>" + this.input.val() + "</a></li>";
        $('#todo-list ul').append(frag);
        this.input.val('');
      }      
    }
  });

  var TaskView = Backbone.View.extend({

    el: '#todo-list',

    events: {
      'click': 'onClick'
    },

    initialize: function(tasks) {
      this.tasks = tasks;
    },

    render: function() {
      this.$el.append('<ul class="nav nav-tabs nav-stacked" data-toggle="tabs"></ul>');
    },

    onClick: function(e) {
      $(e.target).parents('li').remove();
    }

  });

  var tasks = new TaskList();

  new TaskView(tasks).render();
  
  new AddTaskView(tasks).render();

});
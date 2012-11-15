$(function() {

  function addTask(e) {
    if (e.keyCode == 13 && $(this).val()) {
      var frag = "<li><a>" + $(this).val() + "</a></li>";
      $('#todo-list').append(frag);
      $(this).val('');
    }
  }

  function removeTask(e) {
    var el = $(e.target).parents('li').remove();
    $('#done-list').append(el);
  }

  $('#add-task').keypress(addTask).focus();
  $('#todo-list').click(removeTask);

});
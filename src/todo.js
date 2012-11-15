$(function() {

  function addTask(e) {
    if (e.keyCode == 13 && $(this).val()) {
      var frag = "<li><a>" + $(this).val() + "</a></li>";
      $('#todo-list').append(frag);
      $(this).val('');
    }
  }

  function removeTask(e) {
    $(e.target).parents('li').remove();
  }

  $('#add-task').keypress(addTask).focus();
  $('#todo-list').click(removeTask);

});
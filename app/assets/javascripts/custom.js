$(document).ready(function(){
  $.ajaxSetup({ cache: true });
  
  // For quick add task form submission
  $('#task_submit_dummy').click(function() {
    
    $('form#quick_add_task').submit();
  });

  // $('#task_task').keydown(function (e){
  //   if(e.keyCode == 13){
  //     $('form#quick_add_task').submit();
  //   }
  // });

  

  // // Toggle quick add task
  // $('#quick_add').click(function() {
  //   $('#quick_add_task').slideToggle();
  // });

  // // Pending task area
  // $('#pending_toggle').click(function() {
  //   $('#pending').slideToggle();
  // });

  // Completed task area
  $('#completed_toggle').click(function() {
    $('#completed').slideToggle(600);
  });

  // // Toggle tag input popover form
  // $('#tag_trigger').popover({
  //   my: 'center top',
  //   at: 'center bottom',
  //   offset: '-5px -50px'
  // });

  // /* Activating Best In Place */
  // jQuery(".best_in_place").best_in_place();

  $('#completed').on('ajax:success', '[data-bip-attribute="completed"]', function(e) {
    var row = $(e.target).closest('tr');
    row.prependTo('#pending_tbl tbody').slideDown();

    var cur_completed_count = parseInt($('#completed_count').html());
    cur_completed_count--;
    $('#completed_count').html(cur_completed_count);
    $('#completed_pluralized').html(pluralize_task(cur_completed_count));


    var cur_pending_count = parseInt($('#pending_count').html());
    cur_pending_count++;
    $('#pending_count').html(cur_pending_count);
    $('#pending_pluralized').html(pluralize_task(cur_pending_count));

    handle_task_nil(cur_pending_count, cur_completed_count);

  });

  $('#pending').on('ajax:success', '[data-bip-attribute="completed"]', function(e) {
    var row = $(e.target).closest('tr');
    row.prependTo('#completed_tbl tbody').slideDown();
    
    var cur_completed_count = parseInt($('#completed_count').html());
    cur_completed_count++;
    $('#completed_count').html(cur_completed_count);
    $('#completed_pluralized').html(pluralize_task(cur_completed_count));

    var cur_pending_count = parseInt($('#pending_count').html());
    cur_pending_count--;
    $('#pending_count').html(cur_pending_count);
    $('#pending_pluralized').html(pluralize_task(cur_pending_count));

    handle_task_nil(cur_pending_count, cur_completed_count);
  });


  
});

$('.best_in_place').best_in_place();

function pluralize_task(count) {
  return count == 1 ? 'task' : 'tasks';
}

function handle_task_nil(pending_count, completed_count) {
  if (pending_count === 0) {
    $('#pending_nil').show();
  } else {
    $('#pending_nil').hide();
  }
  if (completed_count === 0) {
    $('#completed_nil').show();
  } else {
    $('#completed_nil').hide();
  }
}
$(document).ready(function(){

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
    row.prependTo('#pending tbody').slideDown();

  });

  $('#pending').on('ajax:success', '[data-bip-attribute="completed"]', function(e) {
    var row = $(e.target).closest('tr');
    row.prependTo('#completed tbody').slideDown();
  });

  
  
});

$('.best_in_place').best_in_place();
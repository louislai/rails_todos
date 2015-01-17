// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.purr
//= require best_in_place
//= require foundation
//= require jquery-popover
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function(){

  // For quick add task form submission
  $('#task_submit_dummy').click(function() {
    
    $('form#quick_add_task').submit();
  });

  $('#task_task').keydown(function (e){
    if(e.keyCode == 13){
      $('form#quick_add_task').submit();
    }
  })

  // Open quote
  $('#inspirator').click(function() {
    alert('dfadsfadsafdfsdfsdfda');
    $('#randomQuote').slideToggle();
  })

  // Toggle quick add task
  $('#quick_add').click(function() {
    $('#quick_add_task').slideToggle();
  })

  // Pending task area
  $('#pending_toggle').click(function() {
    $('#pending').slideToggle(200);
  })

  // Completed task area
  $('#completed_toggle').click(function() {
    $('#completed').slideToggle(200);
  })

  // Toggle tag input popover form
  $('#tag_trigger').popover({
    my: 'center top',
    at: 'center bottom',
    offset: '-5px -50px'
  });

  // Toggle calendar input popover form
  $('#calendar_trigger').popover({
    my: 'center top',
    at: 'center bottom',
    offset: '-5px -50px'
  });

  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();

  
  
});

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
//= require foundation
//= require jquery-popover
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function(){
  $('.datetimepicker').datetimepicker({
    format: 'd/m/Y H:i'
  });

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
    $('#randomQuote').slideToggle();
  })

  // Toggle quick add task
  $('#quick_add').click(function() {
    $('#quick_add_task').slideToggle();
    event.stopPropagation();
  })

  // Pending task area
  $('#pending_toggle').click(function() {
    $('#pending').slideToggle();
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
  
});

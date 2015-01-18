$(document).ready(function(){
  $.ajaxSetup({ cache: true });

  $('.add_task').on('ajax:success', function(e, data) {
    alert(data);
  })
});
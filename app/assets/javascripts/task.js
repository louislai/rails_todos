// Toggle completed tasks
$('.yeah').on('ajax:success', '[data-bip-attribute="completed"]', function(e, data, status, xhr) {
  console.log('Uolo');
  var a = $(e.target).closest('tr');
  alert(a);
});

$('#completed').on('ajax:success', '[data-bip-attribute="completed"]', function(e, data, status, xhr) {
  $(e.target).closest('tr').appendTo('#pending tbody');
});
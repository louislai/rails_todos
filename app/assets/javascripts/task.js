// Toggle completed tasks
$('#pending').on('ajax:success', '[data-bip-attribute="completed"]', function(e, data, status, xhr) {
  $(e.target).closest('tr').appendTo('#completed tbody').slideDown();
});

$('#completed').on('ajax:success', '[data-bip-attribute="completed"]', function(e, data, status, xhr) {
  $(e.target).closest('tr').appendTo('#pending tbody');
});
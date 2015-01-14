$(document).ready(function() {
  
  // Retrieve current Pathname
  path = $(location).attr("pathname");
  
  // Removes everything before and including the first /
  page = path.split("/")[1];
  
  // Make sure we are working console.log page
  $("#" + page).addClass("active");
});
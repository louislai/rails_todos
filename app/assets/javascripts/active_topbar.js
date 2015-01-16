$(document).ready(function() {
  
  // Retrieve current Pathname
  path = $(location).attr("pathname");
  
  // Get active page
  pages = path.split("/");
  page = check_page(pages);
  // Active the tab
  $("#" + page).addClass("active");
});

function check_page(pages) {
  for (index = pages.length - 1; index >= 0; --index) {
    switch(pages[index]) {
      case "login":
        return "login";
      case "signup":
        return "signup";
      case "users": 
        return "users";
      case "tasks":
        return "tasks";
    }
  }
  return "login";
}
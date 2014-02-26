$("form").on("submit", function(e){
  e.preventDefault();
  var url = $(this).attr('action');
  var data = $(this).serialize();
  $.post(url, data, function(serverResponse, status, request){
    $("ul.post-comments").append("<li>" + serverResponse.content + "(" + serverResponse.author + ")</li>")
  },"json");
})

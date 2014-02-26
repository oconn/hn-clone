$(".comment-link").on('click', function(e){
  e.preventDefault();
  var url = $(this).attr('href');
  var ul = $(this).parent().parent()
  $.get(url,function(serverResponse, status, request){
    console.log(serverResponse);
    ul.next().html(serverResponse)
  }, "html")
})

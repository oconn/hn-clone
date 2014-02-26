get "/vote/post/:post_id" do
  PostVote.create(post_id: params[:post_id], user_id: current_user.id)
  redirect to '/'
end

get "/vote/comment/:comment_id" do
  CommentVote.create(comment_id: params[:comment_id], user_id: current_user.id)
  @post = Comment.find(params[:comment_id]).post
  redirect to "/comment/new/#{@post.id}"
end

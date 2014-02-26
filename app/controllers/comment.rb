get '/comment/new/:post_id' do
  @post = Post.find(params[:post_id])
  erb :"comment_views/new"
end

get '/comment/edit/:id' do
  @comment = Comment.find(params[:id])
  erb :"comment_views/edit"
end

get '/comment/user' do
  @comments = current_user.comments
  erb :"user_views/comments"
end

get '/comment/:id' do
  @comment = Comment.find(params[:id])
  erb :"comment_views/comment"
end

post '/comment/delete/:id' do
  @comment = Comment.find(params[:id]).destroy
  redirect to "/post/#{@comment.post_id}"
end

post '/comment/edit/:id' do
  Comment.update(params[:id], content: params[:content])
  redirect to ("/comment/#{params[:id]}")
end

post "/comment/new/:post_id" do
  @comment = Comment.create(content: params[:content], post_id: params[:post_id])
  redirect to("/")
end



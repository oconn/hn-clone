get '/comment/new/:post_id' do
  @post = Post.find(params[:post_id])
  erb :"comment_views/new"
end

get '/comment/edit/:id' do
  @comment = Comment.find(params[:id])
  erb :"comment_views/edit"
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
  @post = Post.find(params[:post_id])
  @comment = Comment.create(content: params[:content],
                            post_id: params[:post_id],
                            user_id: current_user.id)
  redirect to "/post/#{params[:post_id]}" if @post.url.empty?
  redirect to("/")
end



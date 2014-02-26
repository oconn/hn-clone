get '/comment/new/:post_id' do
  @post = Post.find(params[:post_id])
  if request.xhr?
    erb :"forms/_new_comment_form", layout: false
  else
    erb :"comment_views/new"
  end
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
  if request.xhr?
    {content: @comment.content, author: @comment.author}.to_json
  else
    redirect to("/comment/new/#{params[:post_id]}")
  end
end



get '/comment/new/' do
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
  erb :
end

post '/comment/edit/:id' do
  Comment.update(params[:id], content: params[:content])
  redirect to ("/comment/#{params[:id]}")
end

post "/comment/new/:post_id" do
  @comment = Comment.create(content: params[:content], post_id: params[:post_id])
  redirect to("/comment/#{@comment.id}")
end



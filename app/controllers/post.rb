get '/post/new' do
  erb :"post_views/new"
end

get '/post/delete/:id' do
  @post = Post.find(params[:id]).destroy
  redirect to ("/user/#{current_user.id}")
end

get '/post/edit/:id' do
  @post = Post.find(params[:id])
  redirect to "/" if current_user.id != @post.user_id
  erb :"post_views/edit"
end

get '/post/:id' do
  @posts = Post.where(id: params[:id])
  redirect to ('/') if @posts.empty?
  @post = @posts.first
  redirect to (@post.url) if !@post.url.empty?
  erb :"post_views/show"
end

post '/post/edit/:id' do
  Post.update(params[:id],
              title: params[:title],
              url: params[:url],
              text: params[:text])
  redirect to ("/comment/#{params[:id]}")
end

post "/post/new/" do
  @post = Post.create(title: params[:title],
                       user_id: current_user.id,
                       url: params[:url],
                       text: params[:text]
                       )
  redirect to("/user/#{current_user.id}")
end

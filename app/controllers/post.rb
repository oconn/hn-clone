get '/post/new' do
  erb :"post_views/new"
end

get '/post/delete/:post_id' do
  @post = Post.find(params[:post_id]).destroy
  redirect to ("/user/#{current_user.id}")
end

get '/post/edit/:post_id' do
  @post = Post.find(params[:post_id])
  redirect to "/" if current_user.id != @post.user_id
  erb :"post_views/edit"
end

get '/post/:post_id' do
  @posts = Post.where(id: params[:post_id])
  redirect to ('/') if @posts.empty?
  @post = @posts.first
  redirect to (@post.url) if !@post.url.empty?
  erb :"post_views/show"
end

post '/post/edit/:post_id' do
  Post.update(params[:post_id],
              title: params[:title],
              url: params[:url],
              text: params[:text])
  redirect to ("/comment/#{params[:post_id]}")
end

post "/post/new/" do
  @post = Post.create(title: params[:title],
                       user_id: current_user.id,
                       url: params[:url],
                       text: params[:text]
                       )
  redirect to("/user/#{current_user.id}")
end

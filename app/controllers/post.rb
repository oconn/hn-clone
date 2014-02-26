get '/post/new' do
  erb :"post_views/new"
end

get '/post/edit' do
  @post = Post.find(params[:id])
  erb :"post_views/edit"
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :"post_views/post"
end

post '/post/delete/:id' do
  @post = Post.find(params[:id]).destroy
  erb :
end

post '/post/edit/:id' do
  Post.update(params[:id],
              title: params[:title],
              url: params[:url],
              text: params[:text])
  redirect to ("/comment/#{params[:id]}")
end

post "/post/new/:user_id" do
  @post = Post.create(title: params[:title],
                       user_id: params[:user_id],
                       url: params[:url],
                       text: params[:text]
                       )
  redirect to("/post/#{@post.id}")
end

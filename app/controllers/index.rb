get '/' do
  @posts = Post.all.order(created_at: :desc)
  erb :index
end

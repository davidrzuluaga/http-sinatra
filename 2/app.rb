require 'bundler/setup'
Bundler.require(:default)
require './models.rb'

set :database, "sqlite3:myblogdb.sqlite3"

get '/' do
    if request.cookies["email"] && request.cookies["password"]
        @posts = Post.all
        @name = 'David Ricardo Zuluaga'
        erb :home
    else
        redirect '/login'
    end
end

get '/login' do
    erb :login
end
 
post '/login' do
    response.set_cookie('email', value: params[:email])
    response.set_cookie('password', value: params[:password])
    redirect '/'
end

post '/hello' do
    mail=params[:email]
    password=params[:password]
    "Hola #{password}#{mail}"
end

post '/post' do
    @post = Post.create(title: params[:title], body: params[:body])
    redirect '/'
end

get '/post/:id' do
    @post = Post.find(params[:id])
    erb :post_page
end

delete '/post/:id' do
    @post = Post.find(params[:id])
    @post.destroy
    redirect '/'
  end
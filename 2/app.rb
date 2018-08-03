require 'sinatra'

# get '/' do

# erb :form
# end

get '/' do
    if request.cookies["email"] && request.cookies["password"]
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

# post '/hello' do
#     mail=params[:email]
#     password=params[:password]
#   "Hola #{password}#{mail}"
# end


require 'sinatra'

get '/' do
    @name = "davidrzuluaga"
    @saluda = "welcome to my first app"
    @phone = "my phone is 12353, mail: asd@das.io"

 erb :index
end

get '/home' do
    @saluda = "welcome to my first app"
 erb :home
end

get '/contact' do
    @phone = "my phone is 12353, mail: asd@das.io"
 erb :contact
end

get '/products' do
    @products = ["Camel","Hipo","Zebra","Horse","Jiraff"]
 erb :products, layout: :layouthome
end

get '/greet' do
    "hola #{params[:name]}"
end

get '/agein5years/:age' do
    @age = params[:age].to_i
    "edad en 5 años: #{@age + 5}"
end

get '/standar' do
status 201
headers "content-type" => "test/html"
erb :index
end

post '/makeapost' do
    [200, {"Content-Type" => "test/html"}, "acabas de hacer un post"]
end

put '/makeaput' do
    [200, {"Content-Type" => "test/html"}, "acabas de hacer un put"]
end

delete '/makeadelete' do
    [200, {"Content-Type" => "test/html"}, "acabas de hacer un delete"]
end

get '/triangle' do
    @base = params[:base].to_i
    "el area del cuadrado es: #{@base * 2}"
end
#http://localhost:4567/triangle?base=5 en el navegador

#en la consola response = HTTParty.put('http://localhost:4567/makeaput', :headers => {"Content-Type" => "application/json"})

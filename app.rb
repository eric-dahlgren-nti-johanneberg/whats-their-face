require "sinatra/base"
require "sinatra/reloader"


class App < Sinatra::Base

    enable :sessions

    get '/' do
        session[:number] = (session[:number] || 0 ) + 1
        @number = session[:number]
        @correct = Person.random

       

        erb :index
    end
end
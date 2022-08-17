require "sinatra/base"
require "sinatra/reloader"


class App < Sinatra::Base

    enable :sessions

    get '/' do

        quiz = Person.quiz

        @correct = quiz[:correct]
        @alternatives = quiz[:alternatives]       

        erb :index
    end
end
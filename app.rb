require "sinatra/base"
require "sinatra/reloader"


class App < Sinatra::Base

    enable :sessions

    get '/' do

        quiz = Person.quiz

        $correct = quiz[:correct]
        @alternatives = quiz[:alternatives]       

        erb :index
    end

    post '/guess' do
        answer = params["test"]

        if answer == $correct[0]
            session["response"] = "Rätt"
        else
            session["response"] = "Fel"
        end
        redirect('/')
    end
end
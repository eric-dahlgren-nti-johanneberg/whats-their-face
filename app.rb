require "sinatra/base"
require "sinatra/reloader"


class App < Sinatra::Base

    enable :sessions

    get '/' do
        @queue = Queue::restore(session)
        @queue = Queue::new(Person::PEOPLE, nil) if @queue.nil?

        quiz = Person.quiz(@queue)

        $correct = quiz[:correct]
        @alternatives = quiz[:alternatives]       

        @queue.save(session)

        erb :index
    end

    get '/svar' do
        @correct = $correct

        erb :svar
    end

    post '/guess' do
        answer = params["test"]
        @queue = Queue::restore(session)

        if answer == $correct[1]
            session["response"] = "Rätt"
        else
            session["response"] = "Fel"
        end
        redirect('/svar')

    end
end
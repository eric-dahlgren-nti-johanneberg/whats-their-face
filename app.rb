require "sinatra/base"
require "sinatra/reloader"


class App < Sinatra::Base

    enable :sessions

    get '/' do
        @queue = Queue::restore(session)
        p @queue
        @queue = Queue::new(PEOPLE, nil) if @queue.nil?

        quiz = Person.quiz(@queue)

        
        session[:correct] = quiz[:correct]
        @alternatives = quiz[:alternatives]       
        
        @queue.save(session)
        erb :index
    end

    get '/svar' do
        @correct = session[:correct]

        erb :svar
    end

    post '/guess' do
        answer = params["test"]
        queue = Queue::restore(session)
        if !(session && session[:correct])
            return redirect('/')
        end



        if answer == session["correct"][1]
            queue.remove_from_queue(session["correct"][0])
            queue.save(session)
            session["response"] = "Rätt"
        else
            session["response"] = "Fel"
        end

        if queue.get_left == 0
            redirect("/finished")
            
        end

        redirect('/svar')

    end

    get '/finished' do
        queue = Queue::new(Person::PEOPLE, nil)
        queue.save(session)

        redirect('/')
    end

    get '/resultat' do
        
        erb :resultat
    end
end
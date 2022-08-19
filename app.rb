# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

##
# Huvudklassen
class App < Sinatra::Base
  enable :sessions

  get '/' do
    @queue = Queue.restore(session)
    @queue = Queue.new(Person::PEOPLE, nil) if @queue.nil?

    quiz = Person.quiz(@queue)

    session[:correct] = quiz[:correct]
    @alternatives = quiz[:alternatives]

    @queue.save(session)
    erb :index
  end

  get '/svar' do
    @correct = session[:correct]

    redirect '/' if @correct.nil?

    erb :svar
  end

  post '/guess' do
    answer = params['test']
    queue = Queue.restore(session)
    return redirect('/') unless session && session[:correct]

    if answer == session['correct'][1]
      queue.remove_from_queue(session['correct'][0])
      queue.save(session)
      session['response'] = 'Rätt'
    else
      session['response'] = 'Fel'
    end

    redirect('/finished') if queue.get_left.zero?

    redirect('/svar')
  end

  get '/finished' do
    queue = Queue.new(Person::PEOPLE, nil)
    queue.save(session)

    redirect('/')
  end

  get '/resultat' do

    erb :resultat
  end

end

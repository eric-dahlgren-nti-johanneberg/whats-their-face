# frozen_string_literal: true

require 'securerandom'
require 'sinatra/base'
require 'sinatra/reloader'

##
# Huvudklassen
class App < Sinatra::Base
  enable :sessions

  get '/' do
    random = (PEOPLE_ARRAY[rand(0..(PEOPLE_ARRAY.length - 1))])
    @random = Person.new(random)

    session[:rounds] = 1
    erb :index
  end

  get '/quiz' do
    redirect '/' if session[:settings].nil?
    last = session[:last]

    @alternatives = QuizDB.get_people(session[:settings][:option_select], last)
    session[:correct] = @alternatives.sample
    session[:last] = session[:correct].id

    p session[:correct].name

    erb :quiz
  end

  post '/guess' do
    answer = params['test']
    correct = QuizDB.guess(session[:id], session[:last], answer)

    session['response'] = correct ? 'Rätt' : 'Fel'

    session[:rounds] = 1 if session[:rounds].nil?
    redirect '/resultat' if session[:rounds] >= session[:settings][:rounds].to_i
    session[:rounds] += 1
    redirect('/svar')
  end

  get '/svar' do
    @correct = session[:correct]
    redirect '/quiz' if @correct.nil?
    erb :svar
  end

  post '/setup' do
    settings = params
    session[:settings] = settings

    session[:id] = session[:session_id].to_s + SecureRandom.uuid

    redirect('/quiz')
  end

  get '/resultat' do
    history = QuizDB.get_history(session[:id])

    redirect '/' if history.nil?

    face = history.max_by { |_faces| history.count }

    @worst = QuizDB.find(face['person_id'])

    @correct = history.select { |result| result["result"] == 1 }
    @incorrect = history.reject { |result| result['result'] == 1 }

    erb :resultat
  end

  post '/reset' do
    session[:quiz] = nil

    redirect('/')
  end

  get '/timeout' do
    QuizDB.guess(session[:id], session[:last], 'Out Of Time')

    session[:rounds] = 1 if session[:rounds].nil?
    redirect '/resultat' if session[:rounds] >= session[:settings][:rounds].to_i
    session[:rounds] += 1

    session['response'] = 'Fel'
    redirect('/svar')
  end
end

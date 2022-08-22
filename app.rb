# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

##
# Huvudklassen
class App < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/quiz' do
    redirect '/' if session[:settings].nil?

    @quiz = Quiz.restore(session)
    @quiz = Quiz.new if @quiz.nil?

    session["response"] = -1

    turn = @quiz.create_turn(session[:settings])

    session[:correct] = turn[:correct]
    @alternatives = turn[:alternatives]

    @quiz.save(session)

    erb :quiz
  end

  post '/guess' do
    answer = params['test']
    return redirect('/') unless session && session[:correct]

    quiz = Quiz.restore(session)
    is_correct = quiz.answer(answer)
    quiz.save(session)
    session['response'] = is_correct ? 'Rätt' : 'Fel'

    redirect('/resultat') if quiz.done?

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
    redirect('/quiz')
  end

  get '/resultat' do
    quiz = Quiz.restore(session)
    p quiz

    history = quiz.history.history

    @correct = history.select { |result| result[1] }
    @incorrect = history.reject { |result| result[1] }

    erb :resultat
  end

  post '/reset' do
    quiz = Quiz.new
    quiz.save(session)
    redirect('/')
  end
end

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
    @quiz = Quiz.restore(session)
    @quiz = Quiz.new if @quiz.nil?

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

    session['response'] = is_correct ? 'Rätt' : 'Fel'

    redirect('/result') if quiz.done?

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
    erb :resultat
  end

  post '/reset' do
    quiz = Quiz.new
    quiz.save(session)
    redirect('/')
  end
end

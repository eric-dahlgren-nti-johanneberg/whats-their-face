# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

##
# Huvudklassen
class App < Sinatra::Base
  enable :sessions

  get '/' do
    @quiz = Quiz.restore(session)
    @quiz = Quiz.new if @quiz.nil?

    turn = @quiz.create_turn

    session[:correct] = turn[:correct]
    @alternatives = turn[:alternatives]

    @quiz.save(session)
    erb :index
  end

  get '/svar' do
    @correct = session[:correct]

    redirect '/' if @correct.nil?

    erb :svar
  end

  post '/guess' do
    answer = params['test']
    return redirect('/') unless session && session[:correct]

    quiz = Quiz.restore(session)
    is_correct = quiz.answer(answer)

    session['response'] = is_correct ? 'Rätt' : 'Fel'

    redirect('/finished') if quiz.done?

    redirect('/svar')
  end

  get '/finished' do
    quiz = Quiz.new
    quiz.save(session)

    redirect('/')
  end
end

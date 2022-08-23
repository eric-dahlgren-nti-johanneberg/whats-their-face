# frozen_string_literal: true

require 'bundler'

Bundler.require

require_relative 'app'
require_relative 'models/person'
require_relative 'models/avatar'
require_relative 'db/quiz'

QuizDB.init!
puts 'Laddade om db'
run App

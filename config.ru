# frozen_string_literal: true

require 'bundler'

Bundler.require

require_relative 'app'
require_relative 'models/person'
require_relative 'models/queue'
require_relative 'models/history'
require_relative 'models/avatar'
require_relative 'models/quiz'

run App

# frozen_string_literal: true

require 'bundler'

Bundler.require

require_relative 'app'
require_relative 'models/person'
require_relative 'models/queue'
require_relative 'models/history'

run App

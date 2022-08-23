# frozen_string_literal: true

require 'securerandom'

class Person
  attr_reader :id, :name, :avatar

  def initialize(name, id = SecureRandom.uuid)
    @id = id
    @name = name
    @avatar = Avatar.new(name)
  end
end

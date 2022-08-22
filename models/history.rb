# frozen_string_literal: true

##
# Klass för hantering av historik
class History
  attr_reader :history

  def initialize(history = [])
    @history = history || []
  end

  ##
  # Lägger till en person i historiken
  #
  # @param [Number] person id:t för personen
  # @param [Boolean] correct är det korrekt svar
  def add_result(person, correct)
    @history.push([person, correct])
  end

  def clear
    @history = []
  end

  def each(&block)
    if block_given?
      @history.each(&block)
    else
      @history.each
    end
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data' => {
        'history' => @history
      }
    }.to_json(*a)
  end

  def self.json_create(o)
    new(o['data']['queue'])
  end
end

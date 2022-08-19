# frozen_string_literal: true

##
# Klass för hantering av historik
class History
  def initialize
    @history = []
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

  def full_history
    @history
  end

  def each(&block)
    if block_given?
      @history.each(&block)
    else
      @history.each
    end
  end
end

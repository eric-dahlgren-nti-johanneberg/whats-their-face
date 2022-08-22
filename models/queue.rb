require 'json'

##
#
# Klass för hantering av namn som kommer på tur
class Queue
  attr_reader :initial, :last

  def initialize(people, last, initial = people)
    @queue = people
    @initial = initial.map(&:clone)
    @last = last
  end

  def remove_from_queue(id)
    changed = @queue.reject do |person|
      person.id == id
    end

    @queue = changed
  end

  def left
    @queue.length
  end

  # ser till att samma person inte väljs två gånger i rad, om den inte är sist kvar.
  def sample
    avalible = @queue.reject do |person|
      person.id == @last
    end
    avalible = @queue if @queue.length == 1

    returning = avalible.sample
    @last = returning.id
    returning
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data' => {
        'queue' => @queue,
        'last' => @last
      }
    }.to_json(*a)
  end

  def self.json_create(o)
    new(o['data']['queue'].map { |person| Person.json_create(person) }, o['data']['last'])
  end
end

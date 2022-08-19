Default_people_array = PEOPLE_ARRAY.map { |person| Person.new(person[:id], person[:name]) }

class Quiz
  attr_reader :queue, :history

  def initialize(queue = Queue.new(Default_people_array, nil), history = History.new)
    @queue = queue
    @history = history
  end

  def create_turn(settings)
    correct = @queue.sample

    avalible = @queue.initial.filter do |person|
      person.id != correct.id
    end
    options = avalible.sample(settings['option_select'].to_i - 1)
    options << correct

    { correct: correct, alternatives: options.shuffle }
  end

  def answer(answer)
    correct = @queue.initial.find { |person| person.id == @queue.last }
    if correct.name == answer
      @queue.remove_from_queue(correct.id)
      success = true
    else
      success = false
    end

    success
  end

  def done?
    @queue.left.zero?
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data' => {
        'queue' => @queue,
        'history' => @history
      }
    }.to_json(*a)
  end

  def self.json_create(o)
    new(Queue.json_create(o['data']['queue']), History.json_create(o['data']['history']))
  end

  def save(session)
    session[:quiz] = to_json
  end

  def self.restore(session)
    return unless session && session[:quiz]

    data = JSON.parse(session[:quiz])
    json_create(data)
  end
end

require "json"

##
#
# Klass för hantering av namn som kommer på tur 
class Queue
    def initialize(people, last)
        @queue = people
        @last = last

    end

    def self.restore(session)
        if session && session[:queue]
            data = JSON.parse(session[:queue])
            return json_create(data)
        end
    end

    def save(session)
        session[:queue] = to_json
    end

    def remove_from_queue(id)
        changed = @queue.reject do |person|
            person[0] == id
        end

        @queue = changed

    end

    def get_left
        @queue.length
    end

    # ser till att samma person inte väljs två gånger i rad, om den inte är sist kvar.
    def sample
        avalible = @queue.reject do |person|
            person[0] == @last
        end
        avalible = @queue if @queue.length == 1

        returning = avalible.sample
        @last = returning[0]
        return returning
    end

    def to_json(*a)
        {
            "json_class" => self.class.name,
            "data" => {
                "queue" => @queue,
                "last" => @last
            }
        }.to_json(*a)
    end

    def self.json_create(o)
        new(o["data"]["queue"], o["data"]["last"])
    end

end
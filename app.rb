class App < Sinatra::Base

    get '/hej' do
        erb :index
    end

    get '/fruits/index'
        @fruits = Fruit.all
        erb :'fruits.index'
    end

    post '/fruits' do
        name = params['name']
        tastiness = params['tastiness']
        Fruit.create(name, tastiness)
        redirect '/fruits'
    end

    get '/fruits/new' do
        erb :'fruits/new'
    end

    get '/fruits/:id' do |id|
        @fruit = Fruit.find_by_id(id)
        erb :'fruits/show'
    end
end
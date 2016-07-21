class ListsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/lists/new' do
    erb :'lists/new'
  end
end
# encoding: utf-8
class Boudin < Sinatra::Base
  
  get '/apikeys' do
    # Create a default User

    @apikeys = Apikey.all
    erb :'apikeys/index'

  end
    
end
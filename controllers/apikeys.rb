# encoding: utf-8
class Boudin < Sinatra::Base
  
  # Show all APIKeys
  get '/apikeys' , :provides => [:html, :json] do
    @apikeys = Apikey.all
    respond_to do |format|
		format.html { erb :'apikeys/index' }
		format.json { @apikeys.to_json }
	end
  end
    
end
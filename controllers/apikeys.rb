# encoding: utf-8
class Boudin < Sinatra::Base
  
  namespace '/admin' do 
    require_relative '../helpers/admin'
    helpers AdminHelpers
    # Don't load these as they are loaded into the namespace 'admin'

    before { env['warden'].authenticate! }
    
	  # Show all APIKeys
	  get '/apikeys' , :provides => [:html, :json] do
      @apikeys = Apikey.all
      respond_to do |format|
        format.html { erb :'apikeys/index' }
        format.json { @apikeys.to_json }
      end
    end  
	end
    
end
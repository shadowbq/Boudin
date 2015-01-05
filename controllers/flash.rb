# encoding: utf-8
class Boudin < Sinatra::Base
  
  # Create a default User
  post '/set-flash' do
    # Set a flash entry
    flash[:success] = "Make flash success fire!"

    # Get a flash entry
    flash[:notice] # => "Make flash success fire!!"

    # Set a flash entry for only the current request
    flash.now[:success] = "Make flash success fire!"
  end

  # Create a default User
  get '/set-flash' do
    # Set a flash entry
    flash[:success] = "Make flash success fire!"
    redirect '/'
  end
  
end
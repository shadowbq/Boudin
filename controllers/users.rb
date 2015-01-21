# encoding: utf-8
class Boudin < Sinatra::Base
  
  get '/users' do
    env['warden'].authenticate!

    # Create a default User
    if User.count == 0
      @user = User.create(username: "admin")
      @user.password = "password"
      @user.email = "admin@domain.org"
      @user.api_key = generate_key
      @user.save
    end

    @users = User.all
    erb :'users/index'

  end

  get '/users/:id' do |id|
    env['warden'].authenticate!
    if id.to_i != env['warden'].user.id
      throw(:warden)
    end

    @user = User.get!(id)
    erb :'users/show'
  end

  def generate_key
    require "securerandom"
    return SecureRandom.uuid
  end
    
end
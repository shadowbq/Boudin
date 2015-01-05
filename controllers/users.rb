# encoding: utf-8
class Boudin < Sinatra::Base
  
  get '/users' do
    # Create a default User
    if User.count == 0
      @user = User.create(username: "admin")
      @user.password = "password"
      @user.email = "admin@domain.org"
      @user.save
    end

    @users = User.all
    erb :'users/index'

  end
    
end
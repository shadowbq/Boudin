class Boudin < Sinatra::Base
  
  register Sinatra::ConfigFile
  register Sinatra::RespondWith
  register Sinatra::Namespace
  
  configure do
    config_file 'config/config.yml'
    set :method_override, true
    #set :environment, :production
  end
    
  require_relative 'models/init'
  
  
  use Warden::Manager do |config|
    # Tell Warden how to save our User info into a session.
    # Sessions can only take strings, not Ruby code, we'll store
    # the User's `id`
    config.serialize_into_session{|user| user.id }
    # Now tell Warden how to take what we've stored in the session
    # and get a User from that information.
    config.serialize_from_session{|id| User.get(id) }

    config.scope_defaults :default,
      # "strategies" is an array of named methods with which to
      # attempt authentication. We have to define this later.
      strategies: [:password],
      # The action is a route to send the user to when
      # warden.authenticate! returns a false answer. We'll show
      # this route below.
      action: 'auth/unauthenticated'
    # When a user tries to log in and cannot, this specifies the
    # app to send the user to.
    config.failure_app = self
  end

  #

  Warden::Manager.before_failure do |env,opts|
    env['REQUEST_METHOD'] = 'POST'
  end

  Warden::Strategies.add(:password) do
    def valid?
      (params['user']['username'] && params['user']['password']) rescue false
    end

    def authenticate!
      
      user =  User.first(username: params['user']['username'])
      #binding.pry
      if user.nil?
        fail!("Unknown username password combination.")
        #flash[:error] = ""
      elsif user.authenticate(params['user']['password'])
        #flash[:success] = "Successfully Logged In"
        success!(user)
      else
        fail!("Unknown username password combination.(2)")
      end
      
    end
  end
  
  ## Hack to fix the extension to accept json params
  before /.*/ do
    if request.url.match(/.json$/)
    request.accept.unshift('application/json')
    request.path_info = request.path_info.gsub(/.json$/,'')
    end
  end
  
  get '/' do
    haml :index
  end
  
  require_relative 'controllers/init'

end

require_relative 'helpers/init'

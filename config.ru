$LOAD_PATH << '.'

require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra'
require 'sinatra/config_file'
require 'sinatra/respond_with'
require 'sinatra/namespace'
require 'sinatra/param'

require 'haml'
require 'erb'
require 'warden'
require 'rack/csrf'

require 'rack/protection'

require 'data_mapper'
require 'bcrypt'

require 'rack-flash'

require 'pry'

require 'threshold'

use Rack::Alpaca

use Rack::ShowExceptions
use Rack::Session::Cookie, :secret => "MySup3rS3cr3tS@ltIsTh1s!"

use Rack::Csrf, :raise => true
use Rack::Protection
#use Rack::Protection::EscapedParams

use Rack::Flash


require 'app'

run Boudin
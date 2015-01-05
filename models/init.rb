## DataMapper BootStrap

# If you want the logs displayed you have to do this before the call to setup
DataMapper::Logger.new($stdout, :debug)

puts "Boudin.environment:#{Boudin.environment}"
if Boudin.environment == :production
  # A Postgres connection:
  DataMapper.setup(:default, settings.db_connection)
else  
  # This is the database location
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/db/development.db")
end


## Locate & Load the Models

Dir.foreach("#{Dir.pwd}/models") do |item|
  next if item == '.' or item == '..' or item == 'init.rb'
  require_relative item
end


# This tries to make the schema match the model. It will CREATE new tables, and add columns to existing tables. 
# It won't change any existing columns though (say, to add a NOT NULL constraint) and it doesn't drop any columns. 
DataMapper.finalize

# This checks the models for validity and initializes all properties associated with relationships. 
# It is likely if you use a web-framework such as merb or rails, this will already be done for you. 
# In case you do not, be sure to call it at an appropriate time.
DataMapper.auto_upgrade!
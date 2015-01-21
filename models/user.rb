class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial, key: true
  property :username, String, length: 128
  property :email, String
  property :description, String
  property :expire, DateTime
  property :api_key, UUID

  property :password, BCryptHash

  def authenticate(attempted_password)
    #puts "attempted_password:#{attempted_password}"
    #puts "self.password:#{self.password}"

    if self.password == attempted_password
      true
    else
      false
    end
  end

end
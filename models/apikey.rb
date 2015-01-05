class Apikey
  include DataMapper::Resource

  storage_names[:default] = 'apikeys'
  
  property :id, Serial, key: true
  property :uuid, UUID
  property :uuid_alias, Text
  property :description, Text

  property :parentid, UUID

  property :revoked, Boolean
  property :restricted_access, Boolean

  property :write, Boolean
  property :created, DateTime
  property :expires, DateTime

end


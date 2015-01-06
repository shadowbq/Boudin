class Inffastflux
  include DataMapper::Resource
  is :read_only
  
  storage_names[:default] = 'infrastructure_fastflux'
  
  property :id, Serial, key: true
  property :uuid, UUID
  property :guid, UUID
  property :sha1hash, Text, :field => 'hash'
  property :address, Text
  
  property :confidence, Float
 
  property :reporttime, DateTime
  property :created, DateTime

end
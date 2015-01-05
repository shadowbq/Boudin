class Article
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, Text
  property :created_at, DateTime
end

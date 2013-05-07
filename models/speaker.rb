require 'data_mapper'

class Speaker
  include DataMapper::Resource

  property :id,      Serial
  property :name,    String
  property :github,  String
  property :twitter, String
  property :url,     String

  property :created_at, DateTime, :default=>Time.now
  property :updated_at, DateTime, :default=>Time.now

  has n, :talks
end

require 'data_mapper'

class Sponsor
 include DataMapper::Resource
 property :id,      Serial
  property :name,    String
  property :url,    String
  property :type,   Enum[:blog, :copper, :silver, :gold, :platinum]
 
  property :created_at, DateTime, :default=>Time.now
  property :updated_at, DateTime, :default=>Time.now
end

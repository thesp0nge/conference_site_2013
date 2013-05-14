require 'data_mapper'

class Talk
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :abstract, Text
  property :slides, String

  property :created_at, DateTime, :default => Time.now
  property :updated_at, DateTime, :default => Time.now

  belongs_to :speaker
  belongs_to :slot
end

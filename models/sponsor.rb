require 'data_mapper'

class Sponsor
  include DataMapper::Resource

  PLANS = %w(platinum gold silver bronze)

  property :id, Serial
  property :name, String
  property :description, Text
  property :image_name, String
  property :url, String
  property :type, String

  validates_within :type, set: PLANS

  property :created_at, DateTime, :default => Time.now
  property :updated_at, DateTime, :default => Time.now
end

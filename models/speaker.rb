require 'data_mapper'
require 'uri'

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

  def github=(username)
    github_url =  "https://github.com/#{username}"
    begin
      uri = URI(username)

      instance_variable_set(:@github, "#{username}")    if uri.host == "github.com"
      instance_variable_set(:@github, "#{github_url}")  if uri.host.nil?
      instance_variable_set(:@github, "")               if uri.host != "github.com" and ! uri.host.nil?
    rescue
      instance_variable_set(:@github, "") 
    end
  end
end

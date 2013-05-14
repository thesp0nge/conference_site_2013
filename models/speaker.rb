require 'data_mapper'
require 'uri'
require 'digest/md5'

class Speaker
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :github, String
  property :twitter, String
  property :email, String
  property :url, String

  property :created_at, DateTime, :default => Time.now
  property :updated_at, DateTime, :default => Time.now

  has n, :talks

  before :save, :fix_urls

  def gravatar_url
    return "" if self.email.nil? or self.email.empty?
    hash = Digest::MD5.hexdigest(self.email.downcase)
    "http://www.gravatar.com/avatar/#{hash}"
  end

  private
  def fix_urls
    fix_url
    fix_github
    fix_twitter
  end

  def fix_url
    begin
      uri = URI(self.url)
    rescue
      self.url = ""
    end
  end

  def fix_github
    github_url = "https://github.com/#{self.github}"
    begin
      uri = URI(self.github)

      self.github = github_url if uri.host.nil?
      self.github = "" if uri.host != "github.com" and !uri.host.nil?
    rescue
      self.github = ""
    end
  end

  def fix_twitter
    twitter_url = "https://twitter.com/#{self.twitter}"
    begin
      uri = URI(self.twitter)

      self.twitter = twitter_url if uri.host.nil?
      self.twitter = "" if uri.host != "twitter.com" and !uri.host.nil?
    rescue
      self.twitter = ""
    end
  end


  # def twitter=(username)
  #   twitter_url =  "https://twitter.com/#{username}"
  #   begin
  #     uri = URI(username)

  #     instance_variable_set(:@twitter, "#{username}")     if uri.host == "twitter.com"
  #     instance_variable_set(:@twitter, "#{twitter_url}")  if uri.host.nil?
  #     instance_variable_set(:@twitter, "")                if uri.host != "twitter.com" and ! uri.host.nil?
  #   rescue
  #     instance_variable_set(:@twitter, "") 
  #   end
  # end

  # def github=(username)
  #   github_url =  "https://github.com/#{username}"
  #   begin
  #     uri = URI(username)

  #     instance_variable_set(:@github, "#{username}")    if uri.host == "github.com"
  #     instance_variable_set(:@github, "#{github_url}")  if uri.host.nil?
  #     instance_variable_set(:@github, "")               if uri.host != "github.com" and ! uri.host.nil?
  #   rescue
  #     instance_variable_set(:@github, "") 
  #   end
  # end
end

require 'data_mapper'

class Slot
  include DataMapper::Resource

  property :id, Serial
  property :ordinal, Integer, :default => -1
  property :schedule, DateTime
  property :type, Enum[:coffee, :launch, :keynote, :lightning, :talk]

  property :created_at, DateTime, :default => Time.now
  property :updated_at, DateTime, :default => Time.now

  has 1, :talk
  before :create, :set_ordinal

  def self.slots_kind
    %w(coffee launch keynote lightning talk)
  end

  def self.talks
    self.all({ :type => :talk, :talk => nil })
  end

  private
  def set_ordinal
    self.ordinal = Slot.count
  end
end

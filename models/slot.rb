require 'data_mapper'

class Slot
  include DataMapper::Resource

  
  property :id,       Serial
  property :ordinal,  Integer, :default=> -1
  property :schedule, DateTime
  property :type,     Enum[:coffee, :launch, :keynote, :lightning, :talk]

  property :created_at, DateTime, :default=>Time.now
  property :updated_at, DateTime, :default=>Time.now

  has 1, :talk
  before :create, :set_ordinal

  private
  def set_ordinal
    self.ordinal = Slot.count
  end
end

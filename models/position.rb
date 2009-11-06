class Position
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :nullable => false, :length => (1..255)
  property :description, Text
  property :need, Integer, :default => 0
  property :filed, Integer, :default => 0
  property :created_at, DateTime, :default => proc { DateTime.now }

  belongs_to :category

  validates_present :category

  def state
=begin
    if need == 0
      if filled == 0
        i18n.recruiting
      else
        i18n.offered(position.filled)
      end
    else
      "#{position.filled}/#{position.need}"
    end
=end
    "#{position.filled}/#{position.need}"
  end
end

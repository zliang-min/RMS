class Position
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :length => (1..255)
  property :description, Text

  belongs_to :category

  validates_present :category
end

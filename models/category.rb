class Category
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :length => (1..255)
  property :description, String, :length => 500

  has n, :positions

=begin
  TODO Uncomment this when it's necessary.
  is :state_machine, :initial => :valid, :column => :state do
    state :valid
    state :deleted

    event(:delete) { transition :from => :valid, :to => :deleted }
  end

  def delete
    positions.each { |p| p.delete }
    if positions.empty?
      destroy!
    else
      delete!
    end
  end
=end
end

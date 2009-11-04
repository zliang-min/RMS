class Profile
  include DataMapper::Resource

  property :id, Serial

  is :state_machine, :initial => :new, :column => :state do
    state :new
  end
end

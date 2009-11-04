require 'test_helper'

context "A new profile" do
  setup { Profile.new }

  should("in state :new") { topic.state }.equals('new')
end

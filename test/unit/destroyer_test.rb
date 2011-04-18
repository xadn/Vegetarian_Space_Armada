require 'test_helper'

class DestroyerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Destroyer.new.valid?
  end
end

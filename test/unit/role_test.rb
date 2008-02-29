require File.dirname(__FILE__) + '/../test_helper'

class RoleTest < ActiveSupport::TestCase
  
  def test_invalid_without_attributes
    role = Role.new
    assert !role.valid?
    assert role.errors.invalid?(:name)
  end
  
  def test_unique_name
    role = Role.new(:name => roles(:admin_role).name)
 
    assert !role.save
    assert_equal "has already been taken", role.errors.on(:name) 
  end
end

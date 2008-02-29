require File.dirname(__FILE__) + '/../test_helper'

class ProfileTest < ActiveSupport::TestCase
  
  def test_public_attributes
    assert_included :location,      profiles(:profile_for_quentin).public_attributes
    assert_included :website,       profiles(:profile_for_quentin).public_attributes
    assert_included :real_name,     profiles(:profile_for_quentin).public_attributes
    
    assert_not_included :id,         profiles(:profile_for_quentin).public_attributes
    assert_not_included :user_id,    profiles(:profile_for_quentin).public_attributes
    assert_not_included :created_at, profiles(:profile_for_quentin).public_attributes
    assert_not_included :updated_at, profiles(:profile_for_quentin).public_attributes
  end
end

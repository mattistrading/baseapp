# TODO: Specify profile fields in db/migrate/002_create_profiles.rb
# TODO: Write more specific profile tests in test/unit/profile_test.rb

# TODO: (base_app) Add avatar/photo upload
class Profile < ActiveRecord::Base
  # These fields in a profile are private, and will not be shown to other users.
  PRIVATE_FIELDS = ["id", "created_at", "updated_at", "user_id"]
  
  # TODO: Add validations, if any, for your profile fields
  
  belongs_to :user
  
  # Filter out the private attributes
  def public_attributes
    self.attribute_names.select{|a| !Profile::PRIVATE_FIELDS.include?(a)}
  end
end

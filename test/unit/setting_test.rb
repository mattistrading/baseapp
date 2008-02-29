require File.dirname(__FILE__) + '/../test_helper'

class SettingTest < ActiveSupport::TestCase
  
  def test_invalid_without_attributes
    setting = Setting.new
    assert !setting.valid?
    assert setting.errors.invalid?(:label)
    assert setting.errors.invalid?(:value)
  end
  
  def test_unique_identifier
    setting = Setting.new(:label        => 'Some label', 
                          :value        => 'Some value', 
                          :identifier   => settings(:site_name).identifier, 
                          :description  => 'Some description',
                          :field_type   => 'string')
    assert !setting.save
    assert_equal "has already been taken", setting.errors.on(:identifier) 
  end
  
  def test_unique_label
    setting = Setting.new(:label        => settings(:site_name).label, 
                          :value        => 'Some value', 
                          :identifier   => 'Some identifier', 
                          :description  => 'Some description',
                          :field_type   => 'string') 
    assert !setting.save 
    assert_equal "has already been taken", setting.errors.on(:label) 
  end
  
  def test_get_setting_value_by_symbol
    assert_equal settings(:site_name).value, Setting.get(:site_name)
  end
  
  def test_get_non_existing_setting
    assert_nil Setting.get(:this_setting_does_not_exist)
  end
  
  def test_loading_setting_by_symbol
    assert_equal settings(:site_name), Setting.load(:site_name)
  end
  
  def test_serializing_of_value                             
    assert_instance_of String,    settings(:string_setting).value
    assert_instance_of Fixnum,    settings(:integer_setting).value
    assert_instance_of Float,     settings(:float_setting).value
    assert_instance_of Date,      settings(:date_setting).value
    assert_instance_of TrueClass, settings(:boolean_setting).value
  end
  
end

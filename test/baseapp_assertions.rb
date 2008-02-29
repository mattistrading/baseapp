module BaseappAssertions
  
  def assert_included(included_value, array_list)
    included_value = included_value.is_a?(Symbol) ? included_value.to_s : included_value
    assert array_list.include?(included_value), "'#{included_value}' not included in list, but expected"
  end
  
  def assert_not_included(included_value, array_list)
    included_value = included_value.is_a?(Symbol) ? included_value.to_s : included_value
    assert !array_list.include?(included_value), "'#{included_value}' included in list, but not expected"
  end
end
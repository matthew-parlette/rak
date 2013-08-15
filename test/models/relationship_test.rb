require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  test "should not save without title" do
    r = Relationship.new
    assert !r.save, "Saved the relationship without a title"
  end
  
  test "add a new relationship" do
    r = Relationship.new
    r['title'] = "A new relationship"
    r['name'] = "My relationship name"
    r['user_id'] = 1
    assert r.save, "New relationship could not be saved"
  end
  
  test "destroy a relationship" do
    assert Relationship.last.destroy, "Last Relationship was not destroyed"
  end
end

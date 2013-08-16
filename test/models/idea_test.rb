require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test "should not save without title" do
    i = Idea.new
    assert !i.save, "Saved the idea without a title"
  end
  
  test "add a new idea" do
    i = Idea.new
    i['title'] = "A new idea"
    i['description'] = "This idea should do these things: 1, 2, 3"
    i['relationship_id'] = 1
    assert i.save, "New idea could not be saved"
  end
  
  test "update an idea" do
    assert Idea.first.update(:title => "Updated title")
  end
  
  test "destroy an idea" do
    assert Idea.last.destroy, "Last idea was not destroyed"
  end
  
end

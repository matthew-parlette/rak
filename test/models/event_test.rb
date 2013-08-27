require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "should not save without title" do
    e = Event.new
    assert !e.save, "Saved the event without a title"
  end
  
  test "add a new event" do
    e = Event.new
    e['title'] = "A new event"
    e['description'] = "This happened"
    e['date'] = '2013-08-28'
    e['reaction'] = 4.5
    e['idea_id'] = 1
    assert e.save, "New idea could not be saved"
  end
  
  test "update an event" do
    assert Event.first.update(:title => "Updated title")
  end
  
  test "destroy an event" do
    assert Event.last.destroy, "Last event was not destroyed"
  end
end

require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end
  
  test "should create event" do
    assert_difference('Event.count') do
      post :create, Event: {title: 'Some new event'}
    end
   
    assert_redirected_to Event_path(assigns(:event))
    assert_equal 'Event was successfully created.', flash[:notice]
  end
  
  test "should update event" do
    assert_no_difference('Event.count') do
      post :update, event: {id: Event.first.id, title: 'Some updated event'}
    end
   
    assert_redirected_to event_path(Event.first.id)
    assert_equal 'Event was successfully updated.', flash[:notice]
  end
  
  test "should destroy Event" do
    r = Event.first.relationship_id
    assert_difference('Event.count') do
      post :destroy, id: Event.first.id
    end
    
    assert_redirected_to relationship_path(r)
    assert_equal 'Event was successfully deleted.', flash[:notice]
  end

end

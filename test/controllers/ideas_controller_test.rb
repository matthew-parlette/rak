require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_template :index
    assert_template "layouts/application", partial: "_overview"
  end

  test "should get show" do
    get :show, {:id => Idea.first.id}
    assert_template "layouts/application", partial: "_overview"
  end

  test "should get new" do
    get :new
    assert_template "layouts/application", partial: "_form"
  end

  test "should get edit" do
    get :edit, {:id => 1}, {:title => "Updated idea title"}
    assert_template "layouts/application", partial: "_form"
  end
  
  test "should create idea" do
    assert_difference('Idea.count') do
      post :create, idea: {title: 'Some new idea'}
    end
   
    assert_redirected_to idea_path(assigns(:idea))
    assert_equal 'Idea was successfully created.', flash[:notice]
  end
  
  test "should update idea" do
    assert_no_difference('Idea.count') do
      post :update, idea: {id: Idea.first.id, title: 'Some updated idea'}
    end
   
    assert_redirected_to idea_path(Idea.first.id)
    assert_equal 'Idea was successfully updated.', flash[:notice]
  end
  
  test "should destroy idea" do
    r = Idea.first.relationship_id
    assert_difference('Idea.count') do
      post :destroy, id: Idea.first.id
    end
    
    assert_redirected_to relationship_path(r)
    assert_equal 'Idea was successfully deleted.', flash[:notice]
  end

end

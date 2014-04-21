require 'test_helper'

class AmbassadorsControllerTest < ActionController::TestCase
  setup do
    @ambassador = ambassadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ambassadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ambassador" do
    assert_difference('Ambassador.count') do
      post :create, ambassador: { Name: @ambassador.Name, Stack_Username: @ambassador.Stack_Username }
    end

    assert_redirected_to ambassador_path(assigns(:ambassador))
  end

  test "should show ambassador" do
    get :show, id: @ambassador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ambassador
    assert_response :success
  end

  test "should update ambassador" do
    patch :update, id: @ambassador, ambassador: { Name: @ambassador.Name, Stack_Username: @ambassador.Stack_Username }
    assert_redirected_to ambassador_path(assigns(:ambassador))
  end

  test "should destroy ambassador" do
    assert_difference('Ambassador.count', -1) do
      delete :destroy, id: @ambassador
    end

    assert_redirected_to ambassadors_path
  end
end

require 'test_helper'

class ListtasksControllerTest < ActionController::TestCase
  setup do
    @listtask = listtasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listtasks)
  end

  test "should get ffnew" do
    get :ffnew
    assert_response :success
  end

  test "should create listtask" do
    assert_difference('Listtask.count') do
      post :create, listtask: @listtask.attributes
    end

    assert_redirected_to listtask_path(assigns(:listtask))
  end

  test "should show listtask" do
    get :show, id: @listtask.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listtask.to_param
    assert_response :success
  end

  test "should update listtask" do
    put :update, id: @listtask.to_param, listtask: @listtask.attributes
    assert_redirected_to listtasks_path
    #(assigns(:listtask))
  end

  test "should destroy listtask" do
    assert_difference('Listtask.count', -1) do
      delete :destroy, id: @listtask.to_param
    end

    assert_redirected_to listtasks_path
  end
end

require 'test_helper'

class LaboursControllerTest < ActionController::TestCase
  setup do
    @labour = labours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:labours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create labour" do
    assert_difference('Labour.count') do
      post :create, labour: { labour_cost_per_hr: @labour.labour_cost_per_hr, labour_description: @labour.labour_description, labour_name: @labour.labour_name, labour_no: @labour.labour_no }
    end

    assert_redirected_to labour_path(assigns(:labour))
  end

  test "should show labour" do
    get :show, id: @labour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @labour
    assert_response :success
  end

  test "should update labour" do
    put :update, id: @labour, labour: { labour_cost_per_hr: @labour.labour_cost_per_hr, labour_description: @labour.labour_description, labour_name: @labour.labour_name, labour_no: @labour.labour_no }
    assert_redirected_to labour_path(assigns(:labour))
  end

  test "should destroy labour" do
    assert_difference('Labour.count', -1) do
      delete :destroy, id: @labour
    end

    assert_redirected_to labours_path
  end
end

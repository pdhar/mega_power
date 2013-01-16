require 'test_helper'

class ComponentsControllerTest < ActionController::TestCase
  setup do
    @component = components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create component" do
    assert_difference('Component.count') do
      post :create, component: { alternator_sr_no: @component.alternator_sr_no, depreciation: @component.depreciation, eng_model_no: @component.eng_model_no, eng_serial_no: @component.eng_serial_no, model_no: @component.model_no, price: @component.price, serial_no: @component.serial_no }
    end

    assert_redirected_to component_path(assigns(:component))
  end

  test "should show component" do
    get :show, id: @component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @component
    assert_response :success
  end

  test "should update component" do
    put :update, id: @component, component: { alternator_sr_no: @component.alternator_sr_no, depreciation: @component.depreciation, eng_model_no: @component.eng_model_no, eng_serial_no: @component.eng_serial_no, model_no: @component.model_no, price: @component.price, serial_no: @component.serial_no }
    assert_redirected_to component_path(assigns(:component))
  end

  test "should destroy component" do
    assert_difference('Component.count', -1) do
      delete :destroy, id: @component
    end

    assert_redirected_to components_path
  end
end

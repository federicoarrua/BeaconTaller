require 'test_helper'

class MajorRegionsControllerTest < ActionController::TestCase
  setup do
    @major_region = major_regions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:major_regions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create major_region" do
    assert_difference('MajorRegion.count') do
      post :create, major_region: {  }
    end

    assert_redirected_to major_region_path(assigns(:major_region))
  end

  test "should show major_region" do
    get :show, id: @major_region
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @major_region
    assert_response :success
  end

  test "should update major_region" do
    patch :update, id: @major_region, major_region: {  }
    assert_redirected_to major_region_path(assigns(:major_region))
  end

  test "should destroy major_region" do
    assert_difference('MajorRegion.count', -1) do
      delete :destroy, id: @major_region
    end

    assert_redirected_to major_regions_path
  end
end

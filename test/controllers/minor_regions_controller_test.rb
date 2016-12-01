require 'test_helper'

class MinorRegionsControllerTest < ActionController::TestCase
  setup do
    @minor_region = minor_regions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:minor_regions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create minor_region" do
    assert_difference('MinorRegion.count') do
      post :create, minor_region: {  }
    end

    assert_redirected_to minor_region_path(assigns(:minor_region))
  end

  test "should show minor_region" do
    get :show, id: @minor_region
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @minor_region
    assert_response :success
  end

  test "should update minor_region" do
    patch :update, id: @minor_region, minor_region: {  }
    assert_redirected_to minor_region_path(assigns(:minor_region))
  end

  test "should destroy minor_region" do
    assert_difference('MinorRegion.count', -1) do
      delete :destroy, id: @minor_region
    end

    assert_redirected_to minor_regions_path
  end
end

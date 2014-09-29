require 'test_helper'

class ShopsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop" do
    assert_difference('shop.count') do
      post :create, shop: { name:@shop.name, discription:@shop.description, website:@shop.website }
    end
    assert_redirected_to shop_path(assigns(:shop))
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop
    assert_response :success
  end

  test "should get update" do
    get :update
    patch :update, id: @shop, shop: { name: @shop.name, discription: @shop.description, website: @shop.website }
    assert_redirected_to shop_path(assigns(:shop))
    assert_response :success
  end

end

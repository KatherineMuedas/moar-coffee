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

  test "should get create" do
    get :create
    shop :create, shop: { name: @shop.name, discription: @shop.description website: @shop.website}
    assert_redirected_to shop_path(assigns(:shop))
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should get update" do
    get :update
    patch :update, id: @shop, shop: { name: @shop.name, discription: @shop.description website: @shop.website }
    assert_redirected_to shop_path(assigns(:shop))
    assert_response :success
  end

end

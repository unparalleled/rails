require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
    @java = products(:java)
    @go = products(:go)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, cart: @cart.attributes
    end

    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should show cart" do
    get :show, id: @cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cart
    assert_response :success
  end

  test "should update cart" do
    put :update, id: @cart, cart: @cart.attributes
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      session[:cart_id] = @cart.id
      delete :destroy, id: @cart
    end

    assert_redirected_to store_path
  end

  test "add unique products" do
    @cart.add_product(@go.id)
    @cart.add_product(@java.id)

    assert_equal(2, @cart.line_items.size)
  end

  test "add same products" do
    @cart.add_product(@go.id)
    @cart.add_product(@go.id)

    assert_equal(1, @cart.line_items.size)
  end

end

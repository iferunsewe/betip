require 'test_helper'

class TypeOfBetsControllerTest < ActionController::TestCase
  setup do
    @type_of_bet = type_of_bets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_of_bets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_of_bet" do
    assert_difference('TypeOfBet.count') do
      post :create, type_of_bet: { name: @type_of_bet.name }
    end

    assert_redirected_to type_of_bet_path(assigns(:type_of_bet))
  end

  test "should show type_of_bet" do
    get :show, id: @type_of_bet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_of_bet
    assert_response :success
  end

  test "should update type_of_bet" do
    put :update, id: @type_of_bet, type_of_bet: { name: @type_of_bet.name }
    assert_redirected_to type_of_bet_path(assigns(:type_of_bet))
  end

  test "should destroy type_of_bet" do
    assert_difference('TypeOfBet.count', -1) do
      delete :destroy, id: @type_of_bet
    end

    assert_redirected_to type_of_bets_path
  end
end

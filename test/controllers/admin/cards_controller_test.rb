require "test_helper"

class Admin::CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
    @collection = collections(:one)
  end

  test "should get index" do
    get admin_collection_cards_url(@collection)
    assert_response :success
  end

  test "should get new" do
    get new_admin_collection_card_url(@collection)
    assert_response :success
  end

  test "should create admin_card" do
    assert_difference("Card.count") do
      post admin_collection_cards_url(@collection), params: { admin_card: { collection_number: @card.collection_number, name: @card.name } }
    end

    assert_redirected_to admin_collection_card_url(@collection, Card.last)
  end

  test "should show admin_card" do
    get admin_collection_card_url(@collection, @card)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_collection_card_url(@collection, @card)
    assert_response :success
  end

  test "should update admin_card" do
    patch admin_collection_card_url(@collection, @card), params: { admin_card: { collection_number: @card.collection_number, name: @card.name } }
    assert_redirected_to admin_collection_card_url(@collection, @card)
  end

  test "should destroy admin_card" do
    assert_difference("Admin::Card.count", -1) do
      delete admin_collection_card_url(@collection, @card)
    end

    assert_redirected_to admin_collection_cards_url(@collection)
  end
end

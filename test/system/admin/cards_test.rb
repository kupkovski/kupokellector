require "application_system_test_case"

class Admin::CardsTest < ApplicationSystemTestCase
  setup do
    @admin_card = admin_cards(:one)
  end

  test "visiting the index" do
    visit admin_cards_url
    assert_selector "h1", text: "Cards"
  end

  test "should create card" do
    visit admin_cards_url
    click_on "New card"

    fill_in "Collection number", with: @admin_card.collection_number
    fill_in "Name", with: @admin_card.name
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "should update Card" do
    visit admin_card_url(@admin_card)
    click_on "Edit this card", match: :first

    fill_in "Collection number", with: @admin_card.collection_number
    fill_in "Name", with: @admin_card.name
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "should destroy Card" do
    visit admin_card_url(@admin_card)
    click_on "Destroy this card", match: :first

    assert_text "Card was successfully destroyed"
  end
end

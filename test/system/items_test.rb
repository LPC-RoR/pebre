require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    check "Activo" if @item.activo
    fill_in "Grupo", with: @item.grupo_id
    fill_in "Item", with: @item.item
    fill_in "Orden", with: @item.orden
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    check "Activo" if @item.activo
    fill_in "Grupo", with: @item.grupo_id
    fill_in "Item", with: @item.item
    fill_in "Orden", with: @item.orden
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end

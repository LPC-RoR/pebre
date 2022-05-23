require "application_system_test_case"

class ResMesasTest < ApplicationSystemTestCase
  setup do
    @res_mesa = res_mesas(:one)
  end

  test "visiting the index" do
    visit res_mesas_url
    assert_selector "h1", text: "Res Mesas"
  end

  test "creating a Res mesa" do
    visit res_mesas_url
    click_on "New Res Mesa"

    fill_in "Mesa", with: @res_mesa.mesa_id
    fill_in "Reserva", with: @res_mesa.reserva_id
    click_on "Create Res mesa"

    assert_text "Res mesa was successfully created"
    click_on "Back"
  end

  test "updating a Res mesa" do
    visit res_mesas_url
    click_on "Edit", match: :first

    fill_in "Mesa", with: @res_mesa.mesa_id
    fill_in "Reserva", with: @res_mesa.reserva_id
    click_on "Update Res mesa"

    assert_text "Res mesa was successfully updated"
    click_on "Back"
  end

  test "destroying a Res mesa" do
    visit res_mesas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Res mesa was successfully destroyed"
  end
end

require "application_system_test_case"

class TandasTest < ApplicationSystemTestCase
  setup do
    @tanda = tandas(:one)
  end

  test "visiting the index" do
    visit tandas_url
    assert_selector "h1", text: "Tandas"
  end

  test "creating a Tanda" do
    visit tandas_url
    click_on "New Tanda"

    fill_in "Capacidad", with: @tanda.capacidad
    check "Cerrado" if @tanda.cerrado
    fill_in "Horario", with: @tanda.horario
    fill_in "Orden", with: @tanda.orden
    fill_in "Turno", with: @tanda.turno
    click_on "Create Tanda"

    assert_text "Tanda was successfully created"
    click_on "Back"
  end

  test "updating a Tanda" do
    visit tandas_url
    click_on "Edit", match: :first

    fill_in "Capacidad", with: @tanda.capacidad
    check "Cerrado" if @tanda.cerrado
    fill_in "Horario", with: @tanda.horario
    fill_in "Orden", with: @tanda.orden
    fill_in "Turno", with: @tanda.turno
    click_on "Update Tanda"

    assert_text "Tanda was successfully updated"
    click_on "Back"
  end

  test "destroying a Tanda" do
    visit tandas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tanda was successfully destroyed"
  end
end

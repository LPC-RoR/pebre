require "application_system_test_case"

class GruposTest < ApplicationSystemTestCase
  setup do
    @grupo = grupos(:one)
  end

  test "visiting the index" do
    visit grupos_url
    assert_selector "h1", text: "Grupos"
  end

  test "creating a Grupo" do
    visit grupos_url
    click_on "New Grupo"

    check "Activo" if @grupo.activo
    fill_in "Grupo", with: @grupo.grupo
    fill_in "Orden", with: @grupo.orden
    click_on "Create Grupo"

    assert_text "Grupo was successfully created"
    click_on "Back"
  end

  test "updating a Grupo" do
    visit grupos_url
    click_on "Edit", match: :first

    check "Activo" if @grupo.activo
    fill_in "Grupo", with: @grupo.grupo
    fill_in "Orden", with: @grupo.orden
    click_on "Update Grupo"

    assert_text "Grupo was successfully updated"
    click_on "Back"
  end

  test "destroying a Grupo" do
    visit grupos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grupo was successfully destroyed"
  end
end

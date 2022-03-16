require "application_system_test_case"

class CierresTest < ApplicationSystemTestCase
  setup do
    @cierre = cierres(:one)
  end

  test "visiting the index" do
    visit cierres_url
    assert_selector "h1", text: "Cierres"
  end

  test "creating a Cierre" do
    visit cierres_url
    click_on "New Cierre"

    fill_in "Fecha", with: @cierre.fecha
    click_on "Create Cierre"

    assert_text "Cierre was successfully created"
    click_on "Back"
  end

  test "updating a Cierre" do
    visit cierres_url
    click_on "Edit", match: :first

    fill_in "Fecha", with: @cierre.fecha
    click_on "Update Cierre"

    assert_text "Cierre was successfully updated"
    click_on "Back"
  end

  test "destroying a Cierre" do
    visit cierres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cierre was successfully destroyed"
  end
end

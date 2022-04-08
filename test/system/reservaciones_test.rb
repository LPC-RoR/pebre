require "application_system_test_case"

class ReservacionesTest < ApplicationSystemTestCase
  setup do
    @reservacion = reservaciones(:one)
  end

  test "visiting the index" do
    visit reservaciones_url
    assert_selector "h1", text: "Reservaciones"
  end

  test "creating a Reservacion" do
    visit reservaciones_url
    click_on "New Reservacion"

    fill_in "Anombre", with: @reservacion.anombre
    fill_in "Fecha", with: @reservacion.fecha
    fill_in "Hora", with: @reservacion.hora
    fill_in "Mesa", with: @reservacion.mesa
    fill_in "N contacto", with: @reservacion.n_contacto
    fill_in "Pasajeros", with: @reservacion.pasajeros
    fill_in "Servicio", with: @reservacion.servicio
    fill_in "Zona", with: @reservacion.zona
    click_on "Create Reservacion"

    assert_text "Reservacion was successfully created"
    click_on "Back"
  end

  test "updating a Reservacion" do
    visit reservaciones_url
    click_on "Edit", match: :first

    fill_in "Anombre", with: @reservacion.anombre
    fill_in "Fecha", with: @reservacion.fecha
    fill_in "Hora", with: @reservacion.hora
    fill_in "Mesa", with: @reservacion.mesa
    fill_in "N contacto", with: @reservacion.n_contacto
    fill_in "Pasajeros", with: @reservacion.pasajeros
    fill_in "Servicio", with: @reservacion.servicio
    fill_in "Zona", with: @reservacion.zona
    click_on "Update Reservacion"

    assert_text "Reservacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservacion" do
    visit reservaciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservacion was successfully destroyed"
  end
end

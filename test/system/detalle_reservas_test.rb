require "application_system_test_case"

class DetalleReservasTest < ApplicationSystemTestCase
  setup do
    @detalle_reserva = detalle_reservas(:one)
  end

  test "visiting the index" do
    visit detalle_reservas_url
    assert_selector "h1", text: "Detalle Reservas"
  end

  test "creating a Detalle reserva" do
    visit detalle_reservas_url
    click_on "New Detalle Reserva"

    fill_in "Fecha", with: @detalle_reserva.fecha
    fill_in "Horario", with: @detalle_reserva.horario
    fill_in "Mesa", with: @detalle_reserva.mesa
    fill_in "Salon", with: @detalle_reserva.salon
    fill_in "Servicio", with: @detalle_reserva.servicio
    click_on "Create Detalle reserva"

    assert_text "Detalle reserva was successfully created"
    click_on "Back"
  end

  test "updating a Detalle reserva" do
    visit detalle_reservas_url
    click_on "Edit", match: :first

    fill_in "Fecha", with: @detalle_reserva.fecha
    fill_in "Horario", with: @detalle_reserva.horario
    fill_in "Mesa", with: @detalle_reserva.mesa
    fill_in "Salon", with: @detalle_reserva.salon
    fill_in "Servicio", with: @detalle_reserva.servicio
    click_on "Update Detalle reserva"

    assert_text "Detalle reserva was successfully updated"
    click_on "Back"
  end

  test "destroying a Detalle reserva" do
    visit detalle_reservas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Detalle reserva was successfully destroyed"
  end
end

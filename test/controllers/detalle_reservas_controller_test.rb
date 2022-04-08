require 'test_helper'

class DetalleReservasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_reserva = detalle_reservas(:one)
  end

  test "should get index" do
    get detalle_reservas_url
    assert_response :success
  end

  test "should get new" do
    get new_detalle_reserva_url
    assert_response :success
  end

  test "should create detalle_reserva" do
    assert_difference('DetalleReserva.count') do
      post detalle_reservas_url, params: { detalle_reserva: { fecha: @detalle_reserva.fecha, horario: @detalle_reserva.horario, mesa: @detalle_reserva.mesa, salon: @detalle_reserva.salon, servicio: @detalle_reserva.servicio } }
    end

    assert_redirected_to detalle_reserva_url(DetalleReserva.last)
  end

  test "should show detalle_reserva" do
    get detalle_reserva_url(@detalle_reserva)
    assert_response :success
  end

  test "should get edit" do
    get edit_detalle_reserva_url(@detalle_reserva)
    assert_response :success
  end

  test "should update detalle_reserva" do
    patch detalle_reserva_url(@detalle_reserva), params: { detalle_reserva: { fecha: @detalle_reserva.fecha, horario: @detalle_reserva.horario, mesa: @detalle_reserva.mesa, salon: @detalle_reserva.salon, servicio: @detalle_reserva.servicio } }
    assert_redirected_to detalle_reserva_url(@detalle_reserva)
  end

  test "should destroy detalle_reserva" do
    assert_difference('DetalleReserva.count', -1) do
      delete detalle_reserva_url(@detalle_reserva)
    end

    assert_redirected_to detalle_reservas_url
  end
end

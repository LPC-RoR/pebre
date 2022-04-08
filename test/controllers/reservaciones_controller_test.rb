require 'test_helper'

class ReservacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservacion = reservaciones(:one)
  end

  test "should get index" do
    get reservaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_reservacion_url
    assert_response :success
  end

  test "should create reservacion" do
    assert_difference('Reservacion.count') do
      post reservaciones_url, params: { reservacion: { anombre: @reservacion.anombre, fecha: @reservacion.fecha, hora: @reservacion.hora, mesa: @reservacion.mesa, n_contacto: @reservacion.n_contacto, pasajeros: @reservacion.pasajeros, servicio: @reservacion.servicio, zona: @reservacion.zona } }
    end

    assert_redirected_to reservacion_url(Reservacion.last)
  end

  test "should show reservacion" do
    get reservacion_url(@reservacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservacion_url(@reservacion)
    assert_response :success
  end

  test "should update reservacion" do
    patch reservacion_url(@reservacion), params: { reservacion: { anombre: @reservacion.anombre, fecha: @reservacion.fecha, hora: @reservacion.hora, mesa: @reservacion.mesa, n_contacto: @reservacion.n_contacto, pasajeros: @reservacion.pasajeros, servicio: @reservacion.servicio, zona: @reservacion.zona } }
    assert_redirected_to reservacion_url(@reservacion)
  end

  test "should destroy reservacion" do
    assert_difference('Reservacion.count', -1) do
      delete reservacion_url(@reservacion)
    end

    assert_redirected_to reservaciones_url
  end
end

require 'test_helper'

class TandasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tanda = tandas(:one)
  end

  test "should get index" do
    get tandas_url
    assert_response :success
  end

  test "should get new" do
    get new_tanda_url
    assert_response :success
  end

  test "should create tanda" do
    assert_difference('Tanda.count') do
      post tandas_url, params: { tanda: { capacidad: @tanda.capacidad, cerrado: @tanda.cerrado, horario: @tanda.horario, orden: @tanda.orden, turno: @tanda.turno } }
    end

    assert_redirected_to tanda_url(Tanda.last)
  end

  test "should show tanda" do
    get tanda_url(@tanda)
    assert_response :success
  end

  test "should get edit" do
    get edit_tanda_url(@tanda)
    assert_response :success
  end

  test "should update tanda" do
    patch tanda_url(@tanda), params: { tanda: { capacidad: @tanda.capacidad, cerrado: @tanda.cerrado, horario: @tanda.horario, orden: @tanda.orden, turno: @tanda.turno } }
    assert_redirected_to tanda_url(@tanda)
  end

  test "should destroy tanda" do
    assert_difference('Tanda.count', -1) do
      delete tanda_url(@tanda)
    end

    assert_redirected_to tandas_url
  end
end

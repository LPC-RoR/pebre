require 'test_helper'

class ResMesasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @res_mesa = res_mesas(:one)
  end

  test "should get index" do
    get res_mesas_url
    assert_response :success
  end

  test "should get new" do
    get new_res_mesa_url
    assert_response :success
  end

  test "should create res_mesa" do
    assert_difference('ResMesa.count') do
      post res_mesas_url, params: { res_mesa: { mesa_id: @res_mesa.mesa_id, reserva_id: @res_mesa.reserva_id } }
    end

    assert_redirected_to res_mesa_url(ResMesa.last)
  end

  test "should show res_mesa" do
    get res_mesa_url(@res_mesa)
    assert_response :success
  end

  test "should get edit" do
    get edit_res_mesa_url(@res_mesa)
    assert_response :success
  end

  test "should update res_mesa" do
    patch res_mesa_url(@res_mesa), params: { res_mesa: { mesa_id: @res_mesa.mesa_id, reserva_id: @res_mesa.reserva_id } }
    assert_redirected_to res_mesa_url(@res_mesa)
  end

  test "should destroy res_mesa" do
    assert_difference('ResMesa.count', -1) do
      delete res_mesa_url(@res_mesa)
    end

    assert_redirected_to res_mesas_url
  end
end

require 'test_helper'

class CierresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cierre = cierres(:one)
  end

  test "should get index" do
    get cierres_url
    assert_response :success
  end

  test "should get new" do
    get new_cierre_url
    assert_response :success
  end

  test "should create cierre" do
    assert_difference('Cierre.count') do
      post cierres_url, params: { cierre: { fecha: @cierre.fecha } }
    end

    assert_redirected_to cierre_url(Cierre.last)
  end

  test "should show cierre" do
    get cierre_url(@cierre)
    assert_response :success
  end

  test "should get edit" do
    get edit_cierre_url(@cierre)
    assert_response :success
  end

  test "should update cierre" do
    patch cierre_url(@cierre), params: { cierre: { fecha: @cierre.fecha } }
    assert_redirected_to cierre_url(@cierre)
  end

  test "should destroy cierre" do
    assert_difference('Cierre.count', -1) do
      delete cierre_url(@cierre)
    end

    assert_redirected_to cierres_url
  end
end

require 'test_helper'

class AlugueresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aluguer = alugueres(:one)
  end

  test "should get index" do
    get alugueres_url
    assert_response :success
  end

  test "should get new" do
    get new_aluguer_url
    assert_response :success
  end

  test "should create aluguer" do
    assert_difference('Aluguer.count') do
      post alugueres_url, params: { aluguer: {  } }
    end

    assert_redirected_to aluguer_url(Aluguer.last)
  end

  test "should show aluguer" do
    get aluguer_url(@aluguer)
    assert_response :success
  end

  test "should get edit" do
    get edit_aluguer_url(@aluguer)
    assert_response :success
  end

  test "should update aluguer" do
    patch aluguer_url(@aluguer), params: { aluguer: {  } }
    assert_redirected_to aluguer_url(@aluguer)
  end

  test "should destroy aluguer" do
    assert_difference('Aluguer.count', -1) do
      delete aluguer_url(@aluguer)
    end

    assert_redirected_to alugueres_url
  end
end

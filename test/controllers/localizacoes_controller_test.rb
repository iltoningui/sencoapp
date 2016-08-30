require 'test_helper'

class LocalizacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @localizacao = localizacoes(:one)
  end

  test "should get index" do
    get localizacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_localizacao_url
    assert_response :success
  end

  test "should create localizacao" do
    assert_difference('Localizacao.count') do
      post localizacoes_url, params: { localizacao: { latitude: @localizacao.latitude, longitude: @localizacao.longitude } }
    end

    assert_redirected_to localizacao_url(Localizacao.last)
  end

  test "should show localizacao" do
    get localizacao_url(@localizacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_localizacao_url(@localizacao)
    assert_response :success
  end

  test "should update localizacao" do
    patch localizacao_url(@localizacao), params: { localizacao: { latitude: @localizacao.latitude, longitude: @localizacao.longitude } }
    assert_redirected_to localizacao_url(@localizacao)
  end

  test "should destroy localizacao" do
    assert_difference('Localizacao.count', -1) do
      delete localizacao_url(@localizacao)
    end

    assert_redirected_to localizacoes_url
  end
end

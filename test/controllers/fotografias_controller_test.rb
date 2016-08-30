require 'test_helper'

class FotografiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fotografia = fotografias(:one)
  end

  test "should get index" do
    get fotografias_url
    assert_response :success
  end

  test "should get new" do
    get new_fotografia_url
    assert_response :success
  end

  test "should create fotografia" do
    assert_difference('Fotografia.count') do
      post fotografias_url, params: { fotografia: {  } }
    end

    assert_redirected_to fotografia_url(Fotografia.last)
  end

  test "should show fotografia" do
    get fotografia_url(@fotografia)
    assert_response :success
  end

  test "should get edit" do
    get edit_fotografia_url(@fotografia)
    assert_response :success
  end

  test "should update fotografia" do
    patch fotografia_url(@fotografia), params: { fotografia: {  } }
    assert_redirected_to fotografia_url(@fotografia)
  end

  test "should destroy fotografia" do
    assert_difference('Fotografia.count', -1) do
      delete fotografia_url(@fotografia)
    end

    assert_redirected_to fotografias_url
  end
end

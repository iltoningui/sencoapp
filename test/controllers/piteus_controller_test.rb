require 'test_helper'

class PiteusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @piteu = piteus(:one)
  end

  test "should get index" do
    get piteus_url
    assert_response :success
  end

  test "should get new" do
    get new_piteu_url
    assert_response :success
  end

  test "should create piteu" do
    assert_difference('Piteu.count') do
      post piteus_url, params: { piteu: {  } }
    end

    assert_redirected_to piteu_url(Piteu.last)
  end

  test "should show piteu" do
    get piteu_url(@piteu)
    assert_response :success
  end

  test "should get edit" do
    get edit_piteu_url(@piteu)
    assert_response :success
  end

  test "should update piteu" do
    patch piteu_url(@piteu), params: { piteu: {  } }
    assert_redirected_to piteu_url(@piteu)
  end

  test "should destroy piteu" do
    assert_difference('Piteu.count', -1) do
      delete piteu_url(@piteu)
    end

    assert_redirected_to piteus_url
  end
end

require 'test_helper'

class ParlaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parlays_index_url
    assert_response :success
  end

  test "should get show" do
    get parlays_show_url
    assert_response :success
  end

end

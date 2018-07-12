require 'test_helper'

class CurrentParlaysControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get current_parlays_show_url
    assert_response :success
  end

end

require 'test_helper'

class SureadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sureads_index_url
    assert_response :success
  end

  test "should get create" do
    get sureads_create_url
    assert_response :success
  end

end

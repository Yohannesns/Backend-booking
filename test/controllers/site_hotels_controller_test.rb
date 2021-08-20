require 'test_helper'

class SiteHotelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_hotels_index_url
    assert_response :success
  end

end

# frozen_string_literal: true

require 'test_helper'

class AboutpageControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get aboutpage_show_url
    assert_response :success
  end
end

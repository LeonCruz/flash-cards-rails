require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'acessar a págna raiz' do
    get root_path
    assert_response :success
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'registar um usuário' do
    user = users :user1
    assert user.save
  end

  test 'não registar um usuário sem email' do
    user = users :user2
    assert_not user.save
  end

  test 'não registar um usuário sem senha' do
    user = users :user3
    assert_not user.save
  end
end

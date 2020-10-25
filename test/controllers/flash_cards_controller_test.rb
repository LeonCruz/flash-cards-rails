require 'test_helper'

class FlashCardsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/accounts/sign_in'
    sign_in users(:user1)
    post new_user_session_path
  end

  test 'acessa a página que lista os flash cards com sucesso' do
    user = users(:user1)

    get user_flash_cards_path(user_id: user.id)
    assert_response :success
  end

  test 'criar um novo flash card' do
    user = users(:user1)

    assert_difference('FlashCard.count') do
      post(user_flash_cards_path(user_id: user.id), params: { flash_card: {
             category: 'categoria', question: 'pergunta', answer: 'resposta', user_id: user.id
           } })
    end

    assert_redirected_to user_flash_cards_path
  end

  test 'remove um flash card' do
    user = users(:user1)

    assert_difference 'FlashCard.count', -1 do
      delete user_flash_card_path(id: 1, user_id: user.id)
    end

    assert_redirected_to user_flash_cards_path
  end

  test 'altera um campo de um flash card' do
    user = users :user1
    flash_card = flash_cards :card1

    pergunta = 'nova pergunta'
    resposta = 'nova resposta'

    put user_flash_card_path(id: flash_card.id, user_id: user.id), params: { flash_card: {
      question: pergunta, answer: resposta
    } }

    assert_equal pergunta, FlashCard.find(flash_cards(:card1).id).question
    assert_equal resposta, FlashCard.find(flash_cards(:card1).id).answer
  end

  test 'comparar uma resposta certa' do
    user = users :user1
    flash_card = flash_cards :card1

    post user_flash_card_compare_path(flash_card_id: flash_card.id, user_id: user.id), params: {
      your_answer: 'resposta'
    }

    get user_flash_cards_path

    assert_equal 'Você acertou', flash[:notice]
  end

  test 'comparar uma resposta errada' do
    user = users :user1
    flash_card = flash_cards :card1

    post user_flash_card_compare_path(flash_card_id: flash_card.id, user_id: user.id), params: {
      your_answer: 'resposta errada'
    }

    get user_flash_cards_path

    assert_equal 'Você errou', flash[:notice]
  end
end

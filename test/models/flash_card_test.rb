require 'test_helper'

class FlashCardTest < ActiveSupport::TestCase
  test 'adicionar um novo flash card' do
    flash_card = flash_cards :card1
    assert flash_card.save
  end

  test 'não adicionar um flash card sem categoria' do
    flash_card = flash_cards :card2
    assert_not flash_card.save
  end

  test 'não adicionar um flash card sem pergunta' do
    flash_card = flash_cards :card3
    assert_not flash_card.save
  end

  test 'não adicionar um flash card sem resposta' do
    flash_card = flash_cards :card4
    assert_not flash_card.save
  end
end

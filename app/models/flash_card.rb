class FlashCard < ApplicationRecord
  belongs_to :user

  validates_presence_of :category, :question, :answer
end

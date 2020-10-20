class Hashtag < ApplicationRecord
  REGEXP = /#[[:word:]-]+/

  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  scope :with_questions, -> { left_joins(:hashtag_questions).where.not(hashtag_questions: {hashtag_id: nil}) }

  validates :text, presence: true, uniqueness: true
end

class Hashtag < ApplicationRecord
  has_many :question

  validates :text, presence: true, uniqueness: true

  before_save :text_downcase

  private

  def text_downcase
    self.text = text.downcase
  end
end

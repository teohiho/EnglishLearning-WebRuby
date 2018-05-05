class Word < ApplicationRecord
  belongs_to :lesson
  validates :word,  presence: true, uniqueness: true
end

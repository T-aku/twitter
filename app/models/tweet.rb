class Tweet < ApplicationRecord
  validates :content, presence: true, length: { minimum: 3, maximum: 140 }
end

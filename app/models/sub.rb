class Sub < ApplicationRecord
  
  has_many :topics, dependent: :destroy
  validates :title, presence: true
  validates :title, lengh: {minimum: 2}
  
end

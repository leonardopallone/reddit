class Sub < ApplicationRecord
  validates :title, presence: true
  validates :title, lengh: {minimum: 2}
  
end

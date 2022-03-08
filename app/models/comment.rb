class Comment < ApplicationRecord

  before_save :check_author
  belongs_to :topic

  validates :body, precense: true

  #if this def is here will conflict with the validation (presence true)
  # def check_author 
  #   if self.author.blank?
  #     self.author = 'anon'
  #   end
# end
end

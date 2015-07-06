class Comment < ActiveRecord::Base
  belongs_to :twixt
  validates :body, presence: true
end

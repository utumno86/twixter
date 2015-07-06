class Comment < ActiveRecord::Base
  belongs_to :twixt
  belongs_to :user
  validates :body, presence: true
end

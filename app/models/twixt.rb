class Twixt < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, length: { maximum: 140 }

  def self.populate!
    30.times do
      t = Twixt.new
      t.user_id = Random.rand(1..User.count)
      t.content = Faker::Hacker.say_something_smart
      t.save
    end
  end
end

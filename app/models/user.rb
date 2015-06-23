class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :twixts, dependent: :destroy

  acts_as_followable
  acts_as_follower

  def display_name
    name.blank? ? email : name
  end

  def self.populate!
    30.times do
      u = User.new
      u.name = Faker::Name.name
      u.email = Faker::Internet.email(u.name)
      u.password = Faker::Internet.password(8)
      u.password_confirmation = u.password
      u.avatar = Faker::Avatar.image
      u.save
    end

  end
end


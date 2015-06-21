class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :twixts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower                                 
  
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


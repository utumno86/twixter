class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
  
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

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
        user = User.create(name: data["name"],
           email: data["email"],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

end


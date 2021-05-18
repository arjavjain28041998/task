class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[facebook linkedin spotify]

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0, 20]
     user.name = auth.info.name 
     user.image = auth.info.image 
     user.skip_confirmation!
   end
 end

 def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
 end

 def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
 end
 def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.spotify_data"] && session["devise.spotify_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
 end
end

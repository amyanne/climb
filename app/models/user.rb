class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    devise :omniauthable, :omniauth_providers => [:facebook]
    has_secure_password
    
    has_many :logs
    has_many :routes, through: :logs
    has_many :comments, through: :logs

    accepts_nested_attributes_for :routes

    def self.new_with_session(params, session)
        super.tap do |user|
          if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
            user.email = data["email"] if user.email.blank?
          end
        end
      end
      
      def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
         
        end
      end

end

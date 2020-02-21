class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    
    has_secure_password

    def self.find_or_create_by_omniauth(auth)
        @user = User.find_by(email: auth["info"]["email"])
        if @user
            @user.update(uid: auth["uid"])
            @user
        else
            @user = User.find_or_create_by(uid: auth["uid"]) do |u|
                u.email = auth["info"]["email"]
                u.password = SecureRandom.hex
            end 
        end 
    end 
end

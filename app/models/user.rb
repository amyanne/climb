class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    
    has_secure_password
    
    has_many :logs
    has_many :routes, through: :logs
    has_many :comments, through: :logs

    accepts_nested_attributes_for :routes

    def self.find_or_create_by_omniauth(auth)
        @user = User.find_by(email: auth["info"]["email"])
        if @user
            @user.update(user_id: auth["user_id"])
            @user
        else
            @user = User.find_or_create_by(user_id: auth["user_id"]) do |u|
                u.email = auth["info"]["email"]
                u.password = SecureRandom.hex
            end 
        end 
    end 

end

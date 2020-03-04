class Route < ApplicationRecord
    has_many :logs
    has_many :comments, through: :logs
    

    scope :search, -> (query, user) { query ? user.routes.where("name LIKE ?", "%#{query}%") : user.routes }
end

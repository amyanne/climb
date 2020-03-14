class Route < ApplicationRecord
    has_many :logs
    has_many :comments, through: :logs
    

    scope :search, -> (query) { query ? @routes.where("name LIKE ?", "%#{query}%") : @routes }


end

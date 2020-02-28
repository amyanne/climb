class Route < ApplicationRecord
    validates :user_id, presence: true
    belongs_to :user 

    scope :search, -> (query, user) { query ? user.routes.where("name LIKE ?", "%#{query}%") : user.routes }
end

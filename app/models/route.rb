class Route < ApplicationRecord
    validates :user_id, presence: true
    has_many :logs
    has_many :comments through :logs
    belongs_to :user 

    scope :search, -> (query, user) { query ? user.routes.where("name LIKE ?", "%#{query}%") : user.routes }
end

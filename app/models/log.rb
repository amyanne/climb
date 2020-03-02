class Log < ApplicationRecord
    validates :route_id, presence: true
    belongs_to :route
    has_many :comments
end

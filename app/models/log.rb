class Log < ApplicationRecord
    validates :route_id, presence: true
    belongs_to :user
    has_one :route

end

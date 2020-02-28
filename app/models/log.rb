class Log < ApplicationRecord
    belongs_to :routes
    has_many :comments
end

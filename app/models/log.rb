class Log < ApplicationRecord
    belongs_to :route
    has_many :comments
end

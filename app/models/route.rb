class Route < ApplicationRecord
    has_many :logs
    has_many :comments, through: :logs
    

    

end

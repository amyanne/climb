class Route < ApplicationRecord
    has_many :logs
    has_many :comments, through: :logs
    

    scope :search, -> (query) { query ? @routes.where("name LIKE ?", "%#{query}%") : @routes }

    # def logs
    #     Log.where(Log.route.id == self.id).find_each do |log|
    #         logs << log
        
        
    #     end
 
    # end 

end

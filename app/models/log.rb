class Log < ApplicationRecord
    belongs_to :user
    has_one :route
    has_many :comments, dependent: :destroy 

    scope :search, -> (query, user) { query ? user.logs.where("log_date LIKE ?", "%#{query}%") : user.logs }
    # accepts_nested_attributes_for :route

    def route_attributes=(route_attributes)
        @route = Route.find_or_create_by(route_attributes)
        self[:route_id] = @route.id
    end 

    def comment_attributes=(comment_attributes)
            @comment = Comment.create(comment_attributes)
            self.comments << @comment

    end 

    def log_id 
        self.id
    end 
 
    
    def route
        Route.find_by_id(self.route_id)
    end

    
end

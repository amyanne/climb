class Log < ApplicationRecord
    belongs_to :user
    has_one :route
    has_many :comments, dependent: :destroy 

    scope :search, -> (query, user) { query ? user.logs.where("log_date LIKE ?", "%#{query}%") : user.logs }

    scope :longest_log, -> {where(log: "longest_log")}
    # accepts_nested_attributes_for :route

    def route_attributes=(route_attributes)
        @route = Route.find_or_create_by(route_attributes)
        self[:route_id] = @route.id
    end 

    def comment_attributes=(comment_attributes)
            @comment = Comment.create(comment_attributes)
            self.comments << @comment

    end 

    def self.longest_log
        longest_log_element = ""
        Log.all.each do |l|
            if l.log_date.length > longest_log_element.length
                longest_log_element = l.log_date
            end 
        end 
        longest_log_element
    end 

    def log_id 
        self.id
    end 
 
    
    def route
        Route.find_by_id(self.route_id)
    end

    
end

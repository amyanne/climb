class Log < ApplicationRecord
    #validates :route_id, presence: true
    belongs_to :user
    has_one :route

    scope :search, -> (query, user) { query ? user.logs.where("log_date LIKE ?", "%#{query}%") : user.logs }
    # accepts_nested_attributes_for :route

    def route_attributes=(route_attributes)
        @route = Route.find_or_create_by(route_attributes)
        puts "omg I wish this worked #{@route.inspect}"
        @route.save!
        puts "omg I wish this worked #{@route.inspect}"
        puts "here is the route id #{@route.id}"
        self[:route_id] = @route.id
    end 

    
end

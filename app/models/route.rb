class Route < ApplicationRecord
    has_many :logs
    has_many :comments, through: :logs
    
    scope :grades, -> { where(grade: 'grade') }
    #scope :search, -> (grade) { grade ? @routes.where("grade LIKE ?", "%#{grade}%") : @routes }

    def self.grades(grade)
        where(grade: 'grade')
    end
    

end

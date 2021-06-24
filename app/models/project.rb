class Project < ApplicationRecord
  has_many :todos
  validates :title, presence: true

    def as_json(options = {})
    super (options || { }).merge( 
      :include => { 
         :todos => { 
         :only => [:todoId, :text, :isCompleted] },     
      }, 
        :except => [:created_at, :updated_at] )
 end
end

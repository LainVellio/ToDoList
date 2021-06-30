class Project < ApplicationRecord
  has_many :todos, -> { order(:id) }
  validates :title, presence: true

    def as_json(options = {})
    super (options || { }).merge( 
      :include => { 
         :todos => { 
         :only => [:id, :text, :isCompleted] },     
      }, 
        :except => [:created_at, :updated_at] )
 end
end

class Todo < ApplicationRecord
  belongs_to :project
  validates :text, presence: true

  def as_json(options = {})
    super(
      :only => [:todoId, :text, :isCompleted, :errors]
    )
  end
end
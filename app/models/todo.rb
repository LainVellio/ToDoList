class Todo < ApplicationRecord
  belongs_to :project
  validates :text, presence: true

  def as_json(options = {})
    super(
      :only => [:id, :text, :isCompleted, :errors]
    )
  end
end
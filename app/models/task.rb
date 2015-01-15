class Task < ActiveRecord::Base
  belongs_to :tasklist, inverse_of: :tasks
  belongs_to :user, inverse_of: :tasks
  has_and_belongs_to_many :tags, inverse_of: :tasks
  validates :task, presence: true
end

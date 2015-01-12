class Task < ActiveRecord::Base
  belongs_to :tasklist, inverse_of: :tasks
  has_and_belongs_to_many :tags, inverse_of: :tasks
end

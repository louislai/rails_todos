class Tasklist < ActiveRecord::Base
  has_many :tasks, inverse_of: :tasklist, dependent: :destroy
  belongs_to :user, inverse_of: :tasklists
end

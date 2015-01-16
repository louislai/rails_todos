class Task < ActiveRecord::Base
  belongs_to :tasklist, inverse_of: :tasks
  belongs_to :user, inverse_of: :tasks
  has_and_belongs_to_many :tags, inverse_of: :tasks
  validates :task, presence: true

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
  
  def all_tags
    self.tags.map(&:name).join(", ")
  end
end

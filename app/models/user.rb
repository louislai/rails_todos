class User < ActiveRecord::Base
	has_many :tasklists, inverse_of: :user, dependent: :destroy
	has_many :tasks, through: :tasklist, dependent: :destroy
	has_many :tags, dependent: :destroy
end

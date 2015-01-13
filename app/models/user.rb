class User < ActiveRecord::Base
	has_many :tasklists, inverse_of: :user, dependent: :destroy
	has_many :tasks, through: :tasklist, dependent: :destroy
	has_many :tags, dependent: :destroy

  validates :email, :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :email, length: { maximum: 255 }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 8 }

end

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

  
  attr_accessor :remember_token

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end


  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
end

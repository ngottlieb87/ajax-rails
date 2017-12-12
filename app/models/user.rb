class User < ApplicationRecord
  # has_secure_password
  has_one :account
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates_confirmation_of :password
  attr_accessor :password
  before_save :encrypt_password
  validate :password_complexity
  
  def password_complexity
    if password.present?
       if !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{7,15}$/)
         errors.add :password, "Password complexity requirement not met"
       end
    end
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by "email = ?", email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def previous_orders
    self.account.orders.where(status: 2).includes(order_items: :product)
  end
end

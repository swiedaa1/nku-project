class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  validates :name, presence: true,                                                                                                                                                                            
                    length: { minimum: 2 } 
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  has_secure_password
end

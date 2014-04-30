class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  validates :name, presence: true,                                                                                                                                                                            
                    length: { minimum: 2 } 
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password
end

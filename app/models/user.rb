class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  validates :name, presence: true,                                                                                                                                                                            
                    length: { minimum: 2 } 
  has_secure_password
end

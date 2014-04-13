class User < ActiveRecord::Base
  validates :name, presence: true,                                                                                                                                                                            
                    length: { minimum: 2 } 
  has_secure_password
end

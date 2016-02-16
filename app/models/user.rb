class User < ActiveRecord::Base
  has_secure_password
  has_many :articles

  def to_s
  	"#{self.first_name} #{self.last_name}"
  end
end

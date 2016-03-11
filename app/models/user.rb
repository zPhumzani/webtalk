class User < ActiveRecord::Base
  has_secure_password
  has_many :articles
  validates :first_name, :last_name, :password, presence: true
  validates :password, confirmation: true
  validates :email, presence: true, uniqueness: true


  def to_s
  	"#{self.first_name} #{self.last_name}"
  end
end

class User < ApplicationRecord
	has_secure_password
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, uniqueness: true	
	validates_presence_of :first_name, :email, :last_name
	validates :email, format: { with: VALID_EMAIL_REGEX }
	before_create do
		self.email = self.email.downcase if self.email.present?
	end
end

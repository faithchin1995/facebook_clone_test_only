class User < ActiveRecord::Base

	has_secure_password
	has_many :statuses, dependent: :destroy 
	has_many :likes, dependent: :destroy 

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :email, :presence => true, :uniqueness => true, format: {with: VALID_EMAIL_REGEX}
	validates :name,  :presence => true
	validates :password, :presence => true, confirmation: true, length: {minimum: 6, maximum: 20}
	validates :password_confirmation, presence: true

	def self.authenticate(params)
		user = User.find_by(email: params[:email])
		if user.authenticate(params[:password]) && user && params[:password] == params[:password_confirmation]
			user
		else
			nil
		end
	end
end
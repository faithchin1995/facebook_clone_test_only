class Status < ActiveRecord::Base

	belongs_to :user
	has_many 	 :likes, dependent: :destroy 

	validates :title, :presence => true, length: {minimum: 8, message: "title is too short"}
	validates :content, :presence => true, length: {minimum: 10, message: "content is too short"}

	def self.first
		self.last 
	end

end
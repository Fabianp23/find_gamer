class Game < ActiveRecord::Base
	has_many :posts

	def to_s
		name
	end
end

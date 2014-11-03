class Card < ActiveRecord::Base
  belongs_to :deck

	def check_answer answer
		answer.downcase == back.downcase
	end
end

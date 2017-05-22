class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user

	validates :description, presence: true
	validates :question_id, presence: true
	validates :user_id, presence: true
	validates :description, length: {in: 1..200}

end
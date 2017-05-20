class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers

	validates :description, presence: true
	validates :user_id, presence: true
	validates :description, length: {in: 1..200}
end
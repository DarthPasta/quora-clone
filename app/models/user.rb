class User < ActiveRecord::Base

	has_many :questions
	has_many :answers, :through => :question
end
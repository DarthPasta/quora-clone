require 'bcrypt'

class User < ActiveRecord::Base

	has_many :questions
	has_many :answers, :through => :question

	validates 	:username, presence: true
	validates	:username, length: { in: 3..15}
	validates	:username, uniqueness: true

	# validates	:email, format: { with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i}
	validates	:email, uniqueness: true

	has_secure_password
	validates	:password_digest, presence: true


end
class CreateUsersQuestionsAnswersTable < ActiveRecord::Migration[5.0]
	def change
		create_table users do |t|
			t.string: username
			t.string: password 

			t.timestamps
		end

		create_table questions do |t|
			t.integer: user_id
			t.text: description

			t.timestamps
		end

		create_table answers do |t|
			t.integer: question_id
			t.integer: user_id 
			t.text: description

			t.timestamps
		end
	end
end

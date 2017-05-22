require 'byebug'

get '/' do
	@questions = Question.all 

  erb :"static/index"
end

get '/question/:id' do 
	@question = Question.find(params[:id])
	@answers = Answer.all
	erb :"static/question"
end

get 'signup' do 
	erb :"static/signup"
end

get '/signup' do 
	erb :"static/signup"
end

post '/signup' do
	x = User.new 
	x.username = params[:username]
	x.email = params[:email]
	x.password = params[:password] 

	if x.save 
		@user = x 
		redirect to '/signup'
	 else 
	 	@user_errors = x 
	end

	erb :"static/index"
end 

get '/signin' do
	erb :"static/signin"
end

post '/login' do  
	@user = User.find_by(email: params[:email])
	if @user
		session[:id] = @user.id
		redirect '/signup'
	else
		redirect to '/signin'
	end
end

get '/login' do 
	if logged_in?
		redirect '/'
	else
		erb :"static/index"
	end
end

get '/logout' do 
	session[:id] = nil

	redirect to '/signup'
end

post '/question/:id/answer' do 	
		x = Answer.new
		x.description = params[:description]
		@question = Question.find(params[:id])
		x.question_id = @question.id
		x.user_id = current_user.id
		x.save
		redirect back

end

get '/new' do 
	erb :"static/question_new"
end

post '/create' do 
	x = Question.new
	x.description = params[:description]
	x.user_id = current_user.id 
	x.save

	redirect to '/'
end


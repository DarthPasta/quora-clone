get '/' do

  erb :"static/index"
end

post '/signup' do
	x = User.new 
	x.username = params[:username]
	x.email = params[:email]
	x.password = params[:password] 

	if x.save 
		@user = x 
		redirect to '/'
	 else 
	 	@user_errors = x 
	end

	erb :"static/index"
end 
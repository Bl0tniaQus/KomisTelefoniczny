class AppController < ApplicationController
	def index
		if session[:current_user]!=nil then
			@username = session[:current_user_name]
		end
	end

	def register

	end

	def login

	end

	def add
	end
	  
	def registeraction
		if User.find_by_login(params[:login])==nil then
			User.new(login: params[:login], password: Digest::SHA256.hexdigest(params[:password])).save
			redirect_to "/app/index"
		end
	end
	def loginaction
		user = User.find_by_login(params[:login])
		if user!=nil then
			haslo = Digest::SHA256.hexdigest(params[:password])
			if haslo == user.password then
				session[:current_user_name] = user.login
				session[:current_user_id] = user.id
				redirect_to "app/index"
			end
		end
	end
	def addaction
		p params[:producent]
		#p params[:zdjecie].tempfile.path()
		#user = User.find(session[:current_user_id])
	end
end

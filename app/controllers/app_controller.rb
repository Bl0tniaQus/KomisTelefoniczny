class AppController < ApplicationController
	def index
		if session[:current_user_name]!=nil then
			@username = session[:current_user_name]
		end
		
		@lista = Telefon.all.order(:created_at)
		
		
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
				redirect_to "/app/index"
			end
		end
	end
	def addaction
		user = User.find(session[:current_user_id])
		zdj = Base64.encode64(open(params[:zdjecie].tempfile.path()) { |f| f.read })
		telefon = user.telefons.create(producent: params[:producent],nazwa: params[:nazwa],system: params[:system],ekran: params[:ekran],rozdzielczosc: params[:rozdzielczosc],ram: params[:ram],pamiec: params[:pamiec],bateria: params[:bateria],microsd: params[:microsd],dualsim: params[:dualsim],kolor: params[:kolor],aparat: params[:aparat],audio: params[:audio],nfc: params[:nfc],lacznosc: params[:lacznosc],klawiatura: params[:klawiatura],opis: params[:opis],czy_uzywany: params[:czy_uzywany],czy_uszkodzony: params[:czy_uszkodzony],kontakt: params[:kontakt],zdjecie: zdj)
	end
	def telefon
	
	@telefon = Telefon.find(params[:id])
	@sprzedawca = User.find(@telefon.user_id).login
	end
end

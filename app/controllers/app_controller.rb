class AppController < ApplicationController
	def index
		if session[:current_user_name]!=nil then
			@username = session[:current_user_name]
		end
		
		
		if params[:search]==nil or params[:search]=="" then
			@lista = Telefon.all.order('created_at DESC')	
		else
			fraza = "%#{params[:search].downcase}%"
			@frazaprz = params[:search]
			@lista = Telefon.where('lower(producent) LIKE ? or lower(opis) like ? or lower(nazwa) like ?', fraza,fraza,fraza).order('created_at DESC')
		end
		
		if params[:cenamin]!="" and params[:cenamin]!=nil then
			@cenamin = params[:cenamin]
			@lista = @lista.where('cena >= ?', @cenamin)
		end
		
		if params[:cenamax]!="" and params[:cenamax]!=nil then
			@cenamax = params[:cenamax]
			@lista = @lista.where('cena <= ?', @cenamax)
		end
		
	end

	def register
		if session[:logged_in]==true then
			redirect_to "/app/index"
		end
	end

	def login
		if session[:logged_in]==true then
			redirect_to "/app/index"
		end
	end

	def add
		if session[:logged_in]!=true then
			redirect_to "/app/index"
		end
	end
	  
	def registeraction
		if User.find_by_login(params[:login])==nil and session[:logged_in]!=true then
			User.new(login: params[:login], password: Digest::SHA256.hexdigest(params[:password])).save
		end
		redirect_to "/app/index"
	end
	def loginaction
		if session[:logged_in]!=true then
			user = User.find_by_login(params[:login])
			if user!=nil then
				haslo = Digest::SHA256.hexdigest(params[:password])
				if haslo == user.password then
					session[:current_user_name] = user.login
					session[:current_user_id] = user.id
					session[:logged_in] = true
					redirect_to "/app/index"
				end
			end
		end
	end
	def addaction
		if session[:logged_in]==true then
			user = User.find(session[:current_user_id])
			zdj = Base64.encode64(open(params[:zdjecie].tempfile.path()) { |f| f.read })
			telefon = user.telefons.create(producent: params[:producent],nazwa: params[:nazwa],system: params[:system],ekran: params[:ekran],rozdzielczosc: params[:rozdzielczosc],ram: params[:ram],pamiec: params[:pamiec],bateria: params[:bateria],microsd: params[:microsd],dualsim: params[:dualsim],kolor: params[:kolor],aparat: params[:aparat],audio: params[:audio],nfc: params[:nfc],lacznosc: params[:lacznosc],klawiatura: params[:klawiatura],opis: params[:opis],czy_uzywany: params[:czy_uzywany],czy_uszkodzony: params[:czy_uszkodzony],kontakt: params[:kontakt],zdjecie: zdj, cena: params[:cena])
		end
		redirect_to "/app/index"
	end
	def telefon
		@telefon = Telefon.find(params[:id])
		@sprzedawca = User.find(@telefon.user_id).login
	end
	
	def twojeogloszenia
		if session[:logged_in]==true then
			@telefony = Telefon.where('user_id=?', session[:current_user_id]).order('created_at DESC')		
		end
	end
	
	def logout
		if session[:logged_in]==true then
			reset_session
		end
		redirect_to "/app/index"
	end
	
	def usun
		if session[:logged_in]!=true
			redirect_to "/app/index"
		else
			telefon = Telefon.find(params[:id])
			if telefon.user_id = session[:current_user_id] then
				telefon.destroy
			end
			redirect_to "/app/twojeogloszenia"
		end		
	end
		
	def modyfikuj
		@telefon = Telefon.find(params[:id])
	end
	
	def modyfikujaction
		if session[:logged_in] != true then
			redirect_to "/app/index"
		else
			telefon = Telefon.find(params[:idtelefonu])
			p "dupa"
			if telefon.user_id == session[:current_user_id] then
				if params[:zdjecie]==nil then
					zdj = telefon.zdjecie
				else
					zdj = Base64.encode64(open(params[:zdjecie].tempfile.path()) { |f| f.read })
				end
				Telefon.update(params[:idtelefonu], producent: params[:producent],nazwa: params[:nazwa],system: params[:system],ekran: params[:ekran],rozdzielczosc: params[:rozdzielczosc],ram: params[:ram],pamiec: params[:pamiec],bateria: params[:bateria],microsd: params[:microsd],dualsim: params[:dualsim],kolor: params[:kolor],aparat: params[:aparat],audio: params[:audio],nfc: params[:nfc],lacznosc: params[:lacznosc],klawiatura: params[:klawiatura],opis: params[:opis],czy_uzywany: params[:czy_uzywany],czy_uszkodzony: params[:czy_uszkodzony],kontakt: params[:kontakt],zdjecie: zdj, cena: params[:cena])
			end
			redirect_to "/app/twojeogloszenia"
		end
	end
	
end

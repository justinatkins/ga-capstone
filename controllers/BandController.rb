class BandController < Sinatra::Base
	before do 
		puts "filter is running"
		if !session[:logged_in]

			session[:message] = {
				success: false,
				status: "bad",
				message: "Sorry, you must be logged in to do that"
			}
			redirect '/users/login'
	end

	#Index Bands
	get '/' do
		user = User.find_by({ :username => session[:username] })
		@band = user.bands

		erb :band_index	
	end

	#New Bands
	get '/new' do
		erb :band_new	
	end

	#Create Bands
	post '/new' do

		new_band = Band.new
		new_band.band_name = params[:band_name]

		logged_in_user = User.find_by({:username => session[:username]})
		new_band.user_id = logged_in_user.id
		new_band.save

		session[:message] = {
			success: true,
			status: "good",
			message: "#{band_name} has been added."
		}
		redirect '/bands'
	end

	#Show Bands
	get '/bands' do
		erb :bands
	end

	#Edit Bands
	get '/:id/edit' do
		@band = Band.find params[:id]
		erb :band_edit
	end

	#Update Bands
	put '/:id' do
		band_update = Band.find params[:id]
		band_update.band_name = params[:band_name]
		band_update.save

		session[:message] = {
			success: true,
			status: "good",
			message: "Updated band info."
		}
		redirect '/bands'
	end

	#Destroy Bands
	delete '/:id' do 
		recipe = band.find params[:id]
		band.destroy

		session[:message] = {
			success: true,
			status: "good",
			message: "Band deleted."
		}
		redirect '/bands'
	end

	after do
		puts "after filter is running"
	end
end
class GuitarController < Sinatra::Base
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

	#Index Guitars
	get '/' do
		user = User.find_by({ :username => session[:username] })
		@guitar = user.guitars

		erb :guitar_index	
	end

	#New Guitars
	get '/new' do
		erb :guitar_new	
	end

	#Create Guitars
	post '/new' do

		new_guitar = Guitar.new
		new_guitar.guitar_image = params[:guitar_image]
		new_guitar.guitar_make = params[:guitar_name]
		new_guitar.guitar_model = params[:guitar_model]
		new_guitar.guitar_year = params[:guitar_year]
		new_guitar.guitar_finish = params[:guitar_finish]


		logged_in_user = User.find_by({:username => session[:username]})
		new_guitar.user_id = logged_in_user.id
		new_guitar.save

		session[:message] = {
			success: true,
			status: "good",
			message: "#{guitar_name} has been added."
		}
		redirect '/guitars'
	end

	#Show Guitars
	get '/guitars' do
		erb :guitars
	end

	#Edit Guitars
	get '/:id/edit' do
		@guitar = Guitar.find params[:id]
		erb :guitar_edit
	end

	#Update Guitars
	put '/:id' do
		guitar_update = Guitar.find params[:id]
		guitar_update.guitar_image = params[:guitar_image]
		guitar_update.guitar_make = params[:guitar_name]
		guitar_update.guitar_model = params[:guitar_model]
		guitar_update.guitar_year = params[:guitar_year]
		guitar_update.guitar_finish = params[:guitar_finish]
		guitar_update.save

		session[:message] = {
			success: true,
			status: "good",
			message: "Updated guitar info."
		}
		redirect '/guitars'
	end

	#Destroy Guitars
	delete '/:id' do 
		recipe = guitar.find params[:id]
		guitar.destroy

		session[:message] = {
			success: true,
			status: "good",
			message: "Guitar deleted."
		}
		redirect '/guitars'
	end

	after do
		puts "after filter is running"
	end
end
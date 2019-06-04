class UserController < ApplicationController

	get '/login' do 
		erb :login
	end

	post '/login' do
		user = User.find_by username: params[:username]
		pw = params[:password]

		if user && user.authenticate(pw)
			session[:logged_in] = true
			session[:username] = user.username
			session[:message] = {
				success: true,
				status: "good",
				message: "Logged in as #{user.username}"
			}
			redirect '/items'
		else
			session[:message] = {
				success: false,
				status: "bad",
				message: "Invalid username or password."
			}

			redirect '/users/login'
		end
	end

	post '/register' do
		user = User.find_by username: params[:username]

		if !user
			user = User.new
			user.username = params[:username]
			user.password = params[:password]
			user.save

			session[:logged_in] = true
			session[:username] = user.username
			session[:message] = {
				success: true,
				status: "good",
				message: "Welcome to the site, you are now logged in as #{user.username}"
			}

			redirect '/items'

		else
			session[:message] = {
				success: false,
				status: "bad",
				message: "Sorry, username #{params[:username]} is already taken. Try a different one."
			}

			redirect '/users/register'

		end
	end

	get '/logout' do
		username = session[:username]
		session.destroy
		session[:message] = {
			success: true,
			status: "neutral",
			message: "User #{username} logged out."
		}

		redirect '/users/login'
	end
end
class ApplicationController < Sinatra::Base
	require 'bundler'
	Bundler.require()

	enable :sessions

	ActiveRecord::Base.establish_connection(
		:adapter => 'postgresql',
		:database => 'guitars'
	)

	use Rack::MethodOverride
	set :method_override, true

	set :views, File.expand_path('../../views', __FILE__)
	set :public_dir, File.expand_path('../../public', __FILE__)

	get '/' do
		redirect '/home'
	end

	get '/test' do
		test_text = "Guitarmy is live"
		binding.pry
		"Pry finished. #{test_text}"
	end

	get '*' do
		halt 404
	end
end
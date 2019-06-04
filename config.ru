require 'sinatra/base'

require './controllers/ApplicationController'
require './controllers/UserController'

require './models/UserModel'
require './models/BandModel'
require './models/GuitaristModel'
require './models/GuitarModel'


map ('/') {
	run ApplicationController
}

map ('/users') {
	run UserController
}


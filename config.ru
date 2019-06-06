require 'sinatra/base'

require './controllers/ApplicationController'
require './controllers/UserController'
require './controllers/BandController'


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

map ('/bands') {
	run BandController
}

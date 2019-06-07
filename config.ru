require 'sinatra/base'

require './controllers/ApplicationController'
require './controllers/UserController'
require './controllers/BandController'
require './controllers/GuitaristController'
require './controllers/GuitarController'


require './models/UserModel'
require './models/BandModel'
require './models/GuitaristModel'
require './models/GuitarModel'
require './models/InstrumentChoiceModel'


map ('/') {
	run ApplicationController
}

map ('/users') {
	run UserController
}

map ('/bands') {
	run BandController
}

map ('/guitarists') {
	run GuitaristController
}

map ('/guitars') {
	run GuitarController
}



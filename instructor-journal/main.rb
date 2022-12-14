require 'sinatra'
require 'bcrypt'
require './db/db'
require 'httparty'

enable :sessions

# controllers
require './controllers/journals_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'

# models
require './models/journal'
require './models/user'

# helpers
require './helpers/sessions_helper'

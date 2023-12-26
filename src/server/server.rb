require 'puma'
require 'sinatra'

set :server, 'puma'

get '/' do
  'Olá, este é um servidor Sinatra!'
end

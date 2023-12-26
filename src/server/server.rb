require 'puma'
require 'sinatra'
require_relative '../class/ruby_nest'

set :server, 'puma'

get '/users' do
  table = "users"
  
  obj = RubyNest.select_all(table)
  
  if obj.is_a?(Array)
    names = obj.map { |row| row['name'] }
    names.join(", ")
  else
    "Erro ao obter dados do banco de dados."
  end
end

require "puma"
require "sinatra"
require_relative "../class/ruby_nest"

set :server, "puma"

get "/users" do
  table = "users"

  obj = RubyNest.select_all(table)

  if obj.is_a?(Array)
    names = obj.map { |row| row["name"] }
    names.join(", ")
  else
    "Erro ao obter dados do banco de dados."
  end
end

get "/users/:id" do
  table = "users"
  obj = RubyNest.find_by_id(table, params[:id])

  if obj.is_a?(Array)
    names = obj.map { |row| "#{row['name']}, #{row['age']}" }
    names.join(", ")
  else
    "Erro ao obter dados do banco de dados."
  end
end

delete "/users/delete/:id" do |id|
  table = "users"

  obj = RubyNest.delete_by_id(table, id)

  if obj.nil?
    { status: "success", message: "Dados removidos com sucesso" }.to_json
  else
    { status: "error", message: "Erro ao remover usuário" }.to_json
  end
end

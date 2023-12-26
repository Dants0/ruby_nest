require 'mysql2'

@db_host  = "localhost"
@db_user  = "root"
@db_pass  = "admin"
@db_name = "users"

client = Mysql::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)
@cdr_result = client.query("SELECT * from users")

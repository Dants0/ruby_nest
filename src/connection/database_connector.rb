require "mysql2"

module DatabaseConnector
  def self.connect
    Mysql2::Client.new(
      host: "localhost",
      username: "root",
      password: "admin",
      database: "users"
    )
  end
end

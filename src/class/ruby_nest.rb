require_relative "../connection/database_connector"

class RubyNest
  attr_accessor :method, :database, :table, :db

  def initialize(method, database, table)
    @method = method
    @database = database
    @table = table
    connection
  end

  def showInformations
    puts [
           @method, @database, @table
         ]
  end

  def all_table
    if @method == "selectAll" && @table
      results = @db.query("select * from #{@table}")
      get_results(results)
    end
  end

  def connection
    @db = DatabaseConnector.connect
  end

  def get_results(results)
    results.each do |row|
      puts row
    end
  end
end

require_relative "../connection/database_connector"

class RubyNest
  attr_accessor :table, :client_main

  def initialize(table)
    @table = table
    connection
  end

  def self.select_all(table)
    new(table).select_all
  end

  def self.find_by_name(table, name)
    new(table).find_by_name(name)
  end

  def self.find_by_id(table, id)
    new(table).find_by_id(id)
  end

  def select_all
    query = "SELECT * FROM #{@table}"
    results = @client_main.query(query)
    get_results(results)
  end

  def find_by_name(name)
    query = "SELECT * FROM #{@table} WHERE name = '#{name}'"
    results = @client_main.query(query)
    get_results(results)
  end

  def find_by_id(id)
    query = "SELECT * FROM #{@table} WHERE id = #{id}"
    results = @client_main.query(query)
    get_results(results)
  end

  private

  def connection
    @client_main = DatabaseConnector.connect
  end

  def get_results(results)
    results.each do |row|
      puts row
    end
  end

  def get_results_tests(results)
    results
  end
end

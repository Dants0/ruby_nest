require "minitest/autorun"
require "minitest/pride"
require_relative "../class/ruby_nest.rb"

class TestRubyNest < Minitest::Test

  def test_select_all
    ruby_nest = RubyNest.select_all("users")

    results = ruby_nest

    refute_empty results
  end

  def test_find_by_name
    name_to_find = 'name_to_find'
    ruby_nest = RubyNest.find_by_name("users", name_to_find)

    results = ruby_nest

    refute_empty results

  end

  def test_find_by_id
    table = "users"
    ruby_nest = RubyNest.new(table)
    id_to_find = 4
    results = ruby_nest.find_by_id(id_to_find)

    refute_empty results
  end
end

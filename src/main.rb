require_relative "./class/ruby_nest"

# obj = RubyNest.find_by_id("users", 1)
# obj = RubyNest.find_by_name("users", "Guilherme")
obj = RubyNest.select_all("users")

obj

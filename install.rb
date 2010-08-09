require 'rubygems'

this = File.expand_path(File.dirname(__FILE__))

puts "Copying acts_as_attachable/db/migrations to #{RAILS_ROOT}/db/migrations"
if defined?(RAILS_ROOT)
  File.copy(File.join(this, "db", "migrations", "0001_create_attachable_assets.rb"), File.join(RAILS_ROOT, "db", "migrations"))
end

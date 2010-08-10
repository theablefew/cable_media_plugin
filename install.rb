require 'rubygems'
require File.dirname(__FILE__) + "/../../../config/environment"
require 'ftools'


this = File.expand_path(File.dirname(__FILE__))
puts "Copying acts_as_attachable/db/migrations to #{RAILS_ROOT}/db/migrate"
if defined?(RAILS_ROOT)
  time = Time.now.strftime("%Y%m%d%H%M%S")
  File.copy(File.join(this, "db", "migrate", "0001_create_attachable_assets.rb"), File.join(RAILS_ROOT, "db", "migrate", "#{time}_create_attachable_assets.rb"))
end

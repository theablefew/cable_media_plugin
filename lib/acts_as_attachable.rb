require 'rubygems'
require 'active_support'
require 'active_record'
require 'paperclip'

Paperclip::Railtie.insert

this = File.expand_path(File.dirname(__FILE__))

Dir["#{this}/acts_as_attachable/*"].each { |c| require c if File.extname(c) == ".rb" }
Dir["#{this}/../app/models/*"].each { |c| require c if File.extname(c) == ".rb" }
Dir["#{this}/../app/controllers/*"].each { |c| require c if File.extname(c) == ".rb" }
Dir["#{this}/../app/views/*"].each { |c| require c if File.extname(c) == ".erb" }

class AttachableException < Exception; end

ActiveRecord::Base.send(:include, ActsAsAttachable) if defined?(ActiveRecord)

module ActsAsAttachable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def has_attachments(*args)
      send(:include, ActsAsAttachable::InstanceMethods)
      add_collections(args)
    end

    def add_collections(assets)
      all = (assets.size == 1 and assets.first == :all)
      if not all and assets.is_a?(Array)
        assets.each{|a| add_asset(a)}
      else
        if defined?(RAILS_ROOT)
          (
            Dir["#{RAILS_ROOT}/app/models/*"] + 
            Dir["#{RAILS_ROOT}/vendor/plugins/acts_as_attachable/app/models/*"]
          ).each do |e|
              e = File.basename(e)
              if File.extname(e) == '.rb' and e.split('_').first == 'attachable'
                 add_asset(e.split('.').first)
              end
          end
        end 
      end
    end

    def add_asset(asset)
      has_many(asset.pluralize.to_sym, :as => :attachable)
    end
  end

  module InstanceMethods
  end
end

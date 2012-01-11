# automatically reload on each request: (and add to application_controller)
#require_dependency 'jqm_helper/railtie' if defined?(Rails)
#require_dependency 'jqm_helper/tag_helpers' if defined?(Rails)
#require_dependency 'jqm_helper/nav_builder' if defined?(Rails)

require 'jqm_helper/railtie' if defined?(Rails)
require 'jqm_helper/tag_helpers' if defined?(Rails)
require 'jqm_helper/nav_builder' if defined?(Rails)



module JqmHelper
  include ActionView::Helpers::OutputSafetyHelper # raw
  include ActionView::Helpers::TagHelper # content_tag

  def make_options(defaults, custom)
    # todo: move to rails core extension

    [defaults, custom].each do |options|
      # standardize keys:
      if data = options.delete(:data)
        data.each do |k, v|
          options[:"data-#{k}"] = v
        end
      end
    end

    options = defaults.merge(custom)
    options.delete(:'data-prefetch') if options[:'data-prefetch'] == false
    options
  end

end


# doc:
# https://github.com/justinfrench/formtastic/tree/master/lib/formtastic
# http://edgeapi.rubyonrails.org/classes/Rails/Railtie.html
# http://www.igvita.com/2010/08/04/rails-3-internals-railtie-creating-plugins/
# http://www.engineyard.com/blog/2010/extending-rails-3-with-railties/
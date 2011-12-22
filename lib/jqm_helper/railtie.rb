module JqmHelper
  class Railtie < Rails::Railtie
    #p "jqm helper loaded in railture"
    ActiveSupport.on_load(:action_view) do
      #p "active support on load include jqm helper"
      include JqmHelper
    end
  end
end


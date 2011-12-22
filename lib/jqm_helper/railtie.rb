module JqmHelper
  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_view) do
      include JqmHelper
    end
  end
end


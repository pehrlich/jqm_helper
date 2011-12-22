module JqmHelper

  def nav_for(page, &block) # someday: options
    builder = NavBuilder.new(page)
    content_tag :div, capture(builder, &block), make_options({data: {role: 'controlgroup', type: 'horizontal'}}, {})
  end


  class NavBuilder
    include JqmHelper # heh.. this is not circular.. how?
    # someday: why don't these get included by including JqmHelper
    include ActionView::Helpers::OutputSafetyHelper # raw include ActionView::Helpers::OutputSafetyHelper # raw
    include ActionView::Helpers::TagHelper # content_tag

    #include ActionView::Helpers::UrlHelper
    #include ActionDispatch::Routing
    # lib/jqm_helper.rb:23:in `<module:JqmHelper>': undefined method `routes' for nil:NilClass (NoMethodError)
    #include Rails.application.routes.url_helpers


    ACTIVE_CLASS = 'ui-btn-active'
    cattr_accessor :reverse_animation_direction

    def initialize(active_action = '')
      self.reverse_animation_direction = true
      @active_action = active_action.to_s
      # someday: we may be able to replace with rails current_page helper
    end

    def button(action, options, title = nil)

      if active = action.to_s == @active_action
        self.reverse_animation_direction = false
      end

      defaults = {
          :class => active ? ACTIVE_CLASS : '',
          :data => {
              :icon => action,
          }
      }

      # commented from trouble including named routes =/
      #defaults[:href] = method("#{action}_path").call unless options[:href] # incase method 404

      defaults[:data][:direction] = 'reverse' if self.reverse_animation_direction

      jqm_button(title || action.capitalize, '', make_options(defaults, options))
    end
  end

end
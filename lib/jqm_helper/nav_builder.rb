module JqmHelper

  def nav_for(page, &block) # someday: options
    builder = NavBuilder.new(page)
    content_tag :div, capture(builder, &block), make_options({data: {role: 'controlgroup', type: 'horizontal'}}, {})
  end


  class NavBuilder

    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers
    include ActionDispatch::Routing
    include Rails.application.routes.url_helpers

    include JqmHelper # why the heck do we need this?

    # someday: figure out make_options dependency properly
    ACTIVE_CLASS = 'ui-btn-active'
    cattr_accessor :reverse_animation_direction

    def initialize(active_action = '')
      #@reverse_animation_direction = true
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
              :role => :button,
              :icon => action,
              :prefetch => true
          }
      }
      defaults[:href] = method("#{action}_path").call unless options[:href] # incase method 404
      defaults[:data][:direction] = 'reverse' if self.reverse_animation_direction

      content_tag :a, title || action.capitalize, make_options(defaults, options)
    end
  end

end
def jqm_page(title, options = {}, &block)
  defaults = {
      :class => "#{title.downcase}_page",
      :id => "#{title.downcase}_page",
      :data => {
          :role => 'page',
          :title => title.capitalize,
      }
  }

  script = ''

  #session.delete('load_resource') { [] }.each do |name, resource|
  #  o = {}
  #  logger.warn "loading resource: #{name}, #{resource.last}. #{resource.first}"
  #  o[name] = resource.first.where({_id: resource.last})
  #  script << "window.load_resource(#{resource.to_json}');\n"
  #end

  content_tag(:div, raw(%Q{
                  <meta name="assets_version" content="#{Brickbook::Application.config.assets.version}"/>
                  #{csrf_meta_tags}
                  <!--<script type='text/javascript'>#{script}</script>-->
                  #{capture(&block)}
                        }), make_options(defaults, options))
end

#def jqm_list(collection, options, &block)
#  defaults ={
#      data: {
#          role: :listview
#      }
#  }
#  contents = ''
#  collection.each do |item|
#    contents << capture( &block )
#  end
#  out = content_tag(:div, contents, make_options(defaults, options))
#end


def jqm_button(text, href, options = {})
  defaults = {
      href: href,
      data: {
          role: :button,
          prefecth: :true
      }
  }
  defaults[:class] = 'notext' if text.blank? || text=='&nbsp;'

  content_tag(:a, raw(text), make_options(defaults, options))
end

def dialog_button(text, href, options = {})
  defaults = {
      data: {
          rel: :dialog,
          transition: :slidedown,
      }
  }
  jqm_button(text, href, make_options(defaults, options))
end

def forward_button(text, href, options = {})
  defaults = {
      :href => href,
      :data => {
          :role => :button,
          :icon => 'arrow-r',
          :iconpos => 'right'
      }
  }

  content_tag(:a, raw(text), make_options(defaults, options))
end

def backwards_button(text, href, options = {})
  defaults = {
      :href => href,
      :data => {
          :role => :button,
          :icon => 'arrow-l',
          :direction => 'reverse'
      }
  }

  content_tag(:a, raw(text), make_options(defaults, options))
end

def back_button(options = {})
  defaults = {
      data: {
          rel: :back
      }
  }
  backwards_button('Back', '#', make_options(defaults, options))
end

def slider_tag(name, label)
  raw %Q{
   <div data-role="fieldcontain" style="border: 0; margin: 0; padding: 1em 0 0 0;">
               <label style="" for="#{name}">#{label}</label>
               <select name="#{name}" id="#{name}" data-role="slider">
                 <option value="no">Off</option>
                 <option value="yes">On</option>
               </select>
             </div>
   }
end
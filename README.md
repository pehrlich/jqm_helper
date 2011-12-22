= jqm_helper

**ALPHA**

A quick and dirty, but functional, collection of tools for speeding up development with jquery mobile.

Enforces a number of sensible defaults, reducing iritable bugs.

Includes view helpers and will soon include some handy javascript tools (such as for handling json data).


## Install

    gem install streama


## Usage

### buttons

```ruby
    jqm_button 'Open Refridgerator', open_fridge_path
    # <a data-role="button" data-prefetch="true" href="/fridge/open">

    back_button
    # <a data-role="button" data-prefetch="true" data-rel="back" >

    backwards_button('Close Refridgerator', close_fridge_path, {class: 'sears'})
    # <a data-role="button" data-prefetch="true" href="/fridge/close" class="sears"
         data-icon="arrow-l" data-direction="reverse">

    forwards_button('Make Sandwitch', sandwitch_path, {data: {prefetch: false} })
    # <a data-role="button" href="/sandwitch/make"
             data-icon="arrow-r" data-iconpos="right">

    # and even:
    dialog_button 'rm -fr /', '/doom'
    # <a data-role="button" data-prefetch="true" href="/doom"
                data-rel="dialog" data-transition="slidedown">
```

Every method has optional arguments.  They can overwrite the sensible defaults.

A very cool syntax can be used:

```ruby
    { data: { icon: 'star', prefetch: false } }
    # typing that beats the pants off these keyboard gymnastics:
    # { :'data-icon' => 'star, :'data-prefetch' => false }
```

### slider tag

```ruby
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
```

     This could be made more flexible

### page builder

```ruby
    jqm_page 'discovery' do
    # it generates:
    # <div class="discovery_page" data-role="page" data-title="Discovery" id="discovery_page">
    # <meta content="authenticity_token" name="csrf-param">
    # <meta content="Oegb/DVSrtDYKJNdXtjQo63eGCBUwtpW83Bysz8h/nQ=" name="csrf-token">
```


### nav builder

 - Adds class to active page
 - Reverses animation direction as appropriate (very handy)

```ruby
    nav_for :discover do |n| # discover will be the active button
      # any buttons before it will display the reverse animation, any after will be forwards
      n.button('discover',
                   {
                           :href => discover_path,
                           :data =>{
                                   :icon => :search,
                           }
                   })
    end

    # <div data-role="controlgroup" data-type="horizontal" class="ui-corner-all ui-controlgroup ui-controlgroup-horizontal">
    #  <a class="ui-btn-active" data-icon="search" data-prefetch="true" data-role="button" href="/discover">
    #   Discover
    #  </a>
    # </div>
```


= Contributing


Once you've made your great commits

1. Fork
1. Create a topic branch - git checkout -b my_branch
1. Push to your branch - git push origin my_branch
1. Create a Pull Request from your branch
1. That's it!



= Contributors

Peter Ehrlich [http://www.twitter.com/ehrlicp](@ehrlicp)



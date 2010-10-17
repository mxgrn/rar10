class Viewport < Netzke::Base
  js_base_class "Ext.Viewport"
  
  js_property :layout, :border
  
  config do
    {
      :items => [{
        :region => :north,
        :auto_height => true,
        :html => "<h1 class='x-panel-header'>Ruby And Rails 2010 - Netzke demo</h1>",
        :border => false
      },{
        :region => :center,
        :layout => :fit,
        :id => :container,
        :border => false,
        :tbar => [{:text => "Load", :menu => [:server_caller.action, :extended_server_caller.action, :composite.action]}]
      },{
        :region => :south,
        :xtype => :toolbar,
        :height => 25,
        :items => ["->", {:text => "status"}]
      }]
    }
  end
  
  action :server_caller, :handler => :on_load_action
  action :extended_server_caller, :handler => :on_load_action
  action :composite, :icon => :application_tile_horizontal, :handler => :on_load_action
  
  js_method :on_load_action, <<-JS
    function(el){
      this.loadComponent({name: el.name, container: 'container'});
    }
  JS

  component :server_caller, :command => "find . -name '*.rb'", :lazy_loading => true
  component :extended_server_caller, :command => "ls", :lazy_loading => true
  component :composite, :lazy_loading => true
end
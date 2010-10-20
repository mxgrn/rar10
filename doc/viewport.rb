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
        :tbar => [{:text => "Load", :menu => [:simple_component.action, :extended_component.action, :composite.action]}]
      },{
        :region => :south,
        :xtype => :toolbar,
        :height => 25,
        :items => ["->", {:text => "status"}]
      }]
    }
  end
  
  action :simple_component, :handler => :on_load_action
  action :extended_component, :handler => :on_load_action
  action :composite, :icon => :table_multiple, :handler => :on_load_action
  
  js_method :on_load_action, <<-JS
    function(el){
      this.loadComponent({name: el.name, container: 'container'});
    }
  JS

  component :simple_component, :lazy_loading => true
  component :extended_component, :lazy_loading => true
  component :composite, :lazy_loading => true
end
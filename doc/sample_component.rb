class SampleComponent < Netzke::Base
  js_base_class "Ext.TabPanel"
  
  js_properties :title      => "My Component", 
                :border     => true,
                :width      => 500,
                :active_tab => 0
  
  js_method :add_tab, <<-JS
    function(){
      this.add({title: "New Tab"});
    }
  JS
  
  config do
    {
      :items => [
        {title: "Tab One"}, 
        {title: "Tab Two"}
      ]
    }
  end
end


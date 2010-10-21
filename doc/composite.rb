class Composite < Netzke::Base
  js_base_class "Ext.TabPanel"
  js_property :active_tab, 0
  
  config do
    {
      :items => [{
        :class_name => "SimpleComponent"
      },{
        :class_name => "ExtendedComponent"
      },{
        :class_name => "Basepack::GridPanel", :model => "Book", :title => "Books", :rows_per_page => 10
      }]
    }
  end
end
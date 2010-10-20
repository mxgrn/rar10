class Composite < Netzke::Base
  js_base_class "Ext.TabPanel"
  js_property :active_tab, 0
  
  config do
    {
      :items => [{
        :class_name => "SimpleComponent",
        :name => "one",
        :region => :center,
        :command => "ls -al"
      },{
        :class_name => "ExtendedComponent",
        :name => "two",
        :region => :east,
        :split => true,
        :command => "ls -al",
        :width => 600
      },{
        :class_name => "Basepack::GridPanel",
        :model => "Book",
        :title => "Books grid"
      },{
        :class_name => "Basepack::FormPanel",
        :model => "Book",
        :title => "Books form",
        :record_id => Book.first.id
      }]
    }
  end
end
class Composite < Netzke::Base
  js_base_class "Ext.TabPanel"
  js_property :active_tab, 0
  
  config do
    {
      :items => [{
        :class_name => "ServerCaller",
        :name => "one",
        :region => :center,
        :command => "ls -al"
      },{
        :class_name => "ExtendedServerCaller",
        :name => "two",
        :region => :east,
        :split => true,
        :command => "ls -al",
        :width => 600
      }]
    }
  end
end
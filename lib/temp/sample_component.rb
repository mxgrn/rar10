class SampleComponent < Netzke::Base
  # ...
  
  js_method :add_tab, <<-JS
    function(title){
      this.add({title: title});
    }
  JS
  
  # ...
  
  endpoint :create_tab do |params|
    { :add_tab => "New Tab"}
  end
  
end


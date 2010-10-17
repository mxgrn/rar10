class ServerCaller < Netzke::Base
  js_properties :title       => "Simple Server Caller", 
                :width       => 700,
                :border      => true,
                :bbar        => [:run.action],
                :auto_scroll => true
  
  action :run, :icon => :lightning
  
  js_method :on_run, <<-JS
    function(){
      this.runCommand({command: this.command || "ls -al"});
    }
  JS
  
  endpoint :run_command do |params|
    {:update_body => `#{params[:command]}`.gsub("\n", "<br/>"), :set_title => "Run succesfully!"}
  end
  
  js_method :update_body, <<-JS
    function(text){
      this.body.update(text);
    }
  JS
  
end
class ExtendedServerCaller < ServerCaller
  js_property :title, "Extended Server Caller"
  
  # Ruby
  def run_command(params)
    orig = super(params)
    orig.merge(:update_body => orig[:update_body].split("<br/>").sort.reverse.join("<br/>"))
  end
  
  # JS
  js_method :update_body, <<-JS
    function(text){
      var updatedText = "Command result:<br/>" + text;
      Netzke.classes.ExtendedServerCaller.superclass.updateBody.call(this, updatedText);
    }
  JS
end
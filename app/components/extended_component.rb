class ExtendedComponent < SimpleComponent
  js_properties :title       => "Extended Component"
  js_property :auto_scroll, true
  
  action :book_list, :icon => :book_link
  
  def get_book_list(params)
    orig = super
    orig.merge(:update_body => orig[:update_body] + "<br/><b>Total amount:</b> " + @books.count.to_s)
  end
  
  js_method :update_body, <<-JS
    function(text){
      var updatedText = "<b>Received list:</b><br/>" + text;
      Netzke.classes.ExtendedComponent.superclass.updateBody.call(this, updatedText);
    }
  JS
end
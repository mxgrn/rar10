class SimpleComponent < Netzke::Base
  js_properties :title       => "My Simple Component", 
                :border      => true,
                :bbar        => [:books_list.action],
                :auto_scroll => true
  
  action :books_list, :icon => :book
  
  js_method :on_books_list, <<-JS
    function(){
      this.getBooksList({digital:true});
    }
  JS
  
  endpoint :get_books_list do |params|
    @books = Book.all
    {:update_body => @books.map(&:title).join("<br/>"), :set_title => "Success!"}
  end
  
  js_method :update_body, <<-JS
    function(text){
      this.body.update(text);
    }
  JS
  
end
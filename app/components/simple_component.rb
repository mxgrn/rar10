class SimpleComponent < Netzke::Base
  js_property :title, "My Cool Component"
  
  action :book_list, :icon => :book
  
  js_property :bbar, [:book_list.action]
  
  js_method :on_book_list, <<-JS
    function(){
      this.getBookList();
    }
  JS
  
  endpoint :get_book_list do |params|
    @books = Book.limit(config[:limit] || Book.count).all
    { :update_body => @books.map(&:title).join("<br/>"), :set_title => "Success!" }
  end
  
  js_method :update_body, <<-JS
    function(text){
      this.body.update(text);
    }
  JS
  
end
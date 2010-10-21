Netzke.classes.SampleComponent = Ext.extend(Ext.TabPanel, 
  Ext.apply(Netzke.componentMixin(Ext.TabPanel), {
    // ...
    "addTab": function(title){
      this.add({title: title});
    },
    
    // Some event handler
    "onButtonClick": function(){
      var args = {...}
      
      // optionally accepts a callback-function
      this.createTab(args);
    }
}));


$(document).ready(function(){
  /*Show/hide loading everytime that we call ajax,*/
   $("#loading").bind("ajaxSend", function(){
     $(this).show();
   }).bind("ajaxComplete", function(){
     $(this).hide();
     /*Refresh the remote pagination everytime that we call ajax*/
      set_links_functionalities();
  });

});
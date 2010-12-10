$(document).ready(function(){
   $("#loading").bind("ajaxSend", function(){
     $(this).show();
   }).bind("ajaxComplete", function(){
     $(this).hide();
  });

});
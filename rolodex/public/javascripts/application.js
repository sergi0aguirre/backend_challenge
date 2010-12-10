$(document).ready(function(){
   $("#loading").bind("ajaxSend", function(){
     $(this).show();
   }).bind("ajaxComplete", function(){
     $(this).hide();
     /*Refresh the ajax pagination everytime that we call ajax*/
     $('.pagination a').attr('data-remote', 'true');
  });

});
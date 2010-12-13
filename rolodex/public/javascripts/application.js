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

/*Refresh div  for  phone numbers, addresses  and  list*/
function refresh_general_form(txt,name){
  $("#" + name).hide();
  $("#" + name).html(txt);
  $("#" + name).show(400);
  $("#" + name + "_cancel").click(function() {
    $.ajax({
      type: "get",
      dataType: "script",
      url: $(this).attr('rel')
    });
  });
}
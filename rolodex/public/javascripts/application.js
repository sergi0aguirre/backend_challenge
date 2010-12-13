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
  $("#" + name + "_cancel").focus();
}

function set_drag_and_drop(){
  $( ".drag" ).draggable({revert: true});
  $( ".drop" ).droppable({
    drop: function( event, ui ) {
      $.ajax({
        type: "get",
        dataType: "script",
        data:"contact_id=" + $(ui.draggable).attr("rel"),
        url: '/lists/'+$( this ).attr('id')+'/add_contact'
      });
    }
  });
}


/*Refresh  gen Links functionalities*/
function set_general_links(){
  var selected_contacts;
  var ids= new Array();
  /*Set Remote links for  pagination*/
  $('.contact_paginate .pagination a').attr('data-remote', 'true');
  
  /*Set the functionalities for Selecte all and  Select none contacts*/
  $(".gen_all").click(function(){
    $(".check_gen").attr('checked','true');
    return false;
  });
  $(".gen_none").click(function(){
    $(".check_gen").removeAttr('checked');
    return false;
  });
  /*ajax functionality for delete all contacts*/
  $(".gen_cont").click(function(){

    selected_contacts=contacts=$("#list").find("input:checked")
    if (selected_contacts.length > 0){
      if (confirm('Are you sure to delete all the selected contacs?')){
        selected_contacts.each(function(){
          ids= new Array()
          $("#list").find("input:checked").each(function(){
            ids.push($(this).attr("id"))
          })
        });
        $.ajax({
          type: "post",
          url: "/lists/delete_selection",
          dataType: "script",
          data:"ids="+ids+"&id="+$(".drop").attr("id"),
        });
      }
    }else{
      alert("You should Select at least one contact");
    }
    return false;

  });

 add_sort_general_functionality();

}

function add_sort_general_functionality(){
  $("#orderlink_gen").click(function() {
    var order;
    if ($(this).html()== "Order A-Z"){
      order="up"
      $(this).html("Order Z-A");
    }else{
      order="down"
    }
    $('#order_gen').val(order);
    $('#search_gen').submit();
    return false;
  });

}

function load_search_functionality(subfix){
  /*Load Search functionality */
  $("#key"+subfix).keyup(function() {
    $('#search'+subfix).submit();
  });
  $("#clear_search"+subfix).click(function() {
    $('#key'+subfix).val("");
    $('#search'+subfix).submit();
    return false;
  });

}
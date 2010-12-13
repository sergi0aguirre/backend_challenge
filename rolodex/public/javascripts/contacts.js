$(document).ready(function(){
  /*Load Search functionality */
  $("#key").keyup(function() {
    $('#search').submit();
  });
  $("#clear_search").click(function() {
    $('#key').val("");
    $('#search').submit();
    return false;
  });

  /*add Sort functionality to link*/
  add_sort_functionality();
  /*  ------ */
  /*Refresh Links functionalities*/
  set_links_functionalities();
  /*Sent The current contact list page  when we update the contact (Ajax iframe upload)*/
  send_current_page();

  /*Load Drag and Drop*/
  set_drag_and_drop();
});

function send_current_page(){
  var page=$(".pagination em").html();
  var form=$("#contact_form form");
  var action=form.attr('action');
  var order=$("#order").val();
  var searchkey=$("#key").val();
  form.attr('action',action + '?page='+ page + '&order' + order + '&key' + searchkey);
}

/*Refresh the contact form div*/
function refresh_form(txt){
  $("#contact_form").hide();
  $("#contact_form").html(txt);
  $("#contact_form").show(400);
  $("#cancel_form_button").click(function() {
    $('#contact_form').hide();
  });
  $("#close_show").click(function() {
    $('#contact_form').hide();
    return false;
  });
  $("#cancel_form_button_edit").click(function() {
    $.ajax({
      type: "get",
      dataType: "script",
      url: $(this).attr('rel')
    });
  });
}
/*Refresh Links functionalities*/
function set_links_functionalities(){
  var selected_contacts;
  var ids= new Array();
  /*Set Remote links for  pagination*/
  $('#contact_list .pagination a').attr('data-remote', 'true');
  /*Hide the form when we click on delete*/
  $('#contact_list .conctac_destroy').click(function(){
    $("#contact_form").hide();
  });
  /*Set the functionalities for Selecte all and  Select none contacts*/
  $("#selectall").click(function(){
    $(".check_contact").attr('checked','true');
    return false;
  });
  $("#selectnone").click(function(){
    $(".check_contact").removeAttr('checked');
    return false;
  });
  /*ajax functionality for delete all contacts*/
  $("#deletecontacts").click(function(){
    
    selected_contacts=contacts=$("#contact_list").find("input:checked")
    if (selected_contacts.length > 0){
      if (confirm('Are you sure to delete all the selected contacs?')){
        selected_contacts.each(function(){
          ids= new Array()
          $("#contact_list").find("input:checked").each(function(){
            ids.push($(this).attr("id"))
          })
        });
        $.ajax({
          type: "post",
          url: "/contacts/delete_selection",
          data:"ids="+ids,
          success: function(data){
            $("#contact_list").html(data);
          }
        });
      }
    }else{
      alert("You should Select at least one contact");
    }
    return false;

  });

  add_sort_functionality();

}

function add_sort_functionality(){
  $("#orderlink").click(function() {
    var order;
    if ($(this).html()== "Order A-Z"){
      order="up"
      $(this).html("Order Z-A");
    }else{
      order="down"
    }
    $('#order').val(order);
    $('#search').submit();
    return false;
  });

}
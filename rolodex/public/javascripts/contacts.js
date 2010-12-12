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
  /*  ------ */
  /*Refresh Links functionalities*/
  set_links_functionalities();
  /*Sent The current contact list page  when we update the contact (Ajax iframe upload)*/
  send_current_page();
});

function send_current_page(){
  var page=$(".pagination em").html();
  var form=$("#contact_form form");
  var action=form.attr('action');
  form.attr("action",action+'?page='+page);
}

/*Refresh the contact form div*/
function refresh_form(txt){
  $("#contact_form").hide();
  $("#contact_form").html(txt);
  $("#contact_form").show(400);
  $("#cancel_form_button").click(function() {
    $('#contact_form').hide()
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
  }else{
    alert("You should Select at least one contact");
  }
  return false;
  });

}
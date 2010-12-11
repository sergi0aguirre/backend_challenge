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
  /*Set Remote links for  pagination*/
   set_remote_page_links();
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
/*Set Remote links for  pagination*/
function set_remote_page_links(){
  $('#contact_list .pagination a').attr('data-remote', 'true');
  $('#contact_list .conctac_destroy').click(function(){ $("#contact_form").hide();});
}
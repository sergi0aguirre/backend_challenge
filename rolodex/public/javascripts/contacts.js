$(document).ready(function(){
   $("#contact_list .contact_edit").click(function() {$('#contact_form').show();return false;});
   $("#key").keyup(function() {$('#search').submit();});
   $("#clear_search").click(function() {$('#key').val("");$('#search').submit();return false;});
   $('.pagination a').attr('data-remote', 'true');
});
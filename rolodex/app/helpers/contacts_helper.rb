module ContactsHelper
  def ajax_contact_form(stored)
    txtpage=""
    if stored
      txtpage << "$('#contact_errors').hide(300);"
      txtpage << "$('.notice').html('"+escape_javascript(flash[:notice])+"');"
      txtpage << "$('.notice').show(300);"
      txtpage << "$('#contact_list').html('"+escape_javascript( render(:partial => 'contacts') )+"');"
      txtpage << "$('#contact_form').html('"+escape_javascript( render(:partial => 'show') )+"');"
    else
      txtpage << "$('.notice').hide(300);"
      txtpage << "$('#contact_form').html('"+escape_javascript( render(:partial => 'new_or_edit') )+"');"
      txtpage << "$('#contact_errors').html('"+escape_javascript(error_messages_for(@contact))+"');"
      txtpage << "$('#cancel_form_button').click(function() {$('#contact_form').hide()});"
      txtpage << "$('#contact_errors').show(300);"
      txtpage << "$('#cancel_form_button_edit').click(function() {
    $.ajax({
      type: 'get',
      dataType: 'script',
      url: $(this).attr('rel')
       });
      });"
    end
     txtpage << "$('#contact_list .contact_edit').click(function() {$('#contact_form').show();return false;});"
     txtpage << "$('.pagination a').attr('data-remote', 'true');"
     txtpage
  end
end

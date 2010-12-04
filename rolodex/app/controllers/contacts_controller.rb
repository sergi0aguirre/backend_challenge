class ContactsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @with_page='page_contact'
    @contacts=current_user.contacts
  end
end

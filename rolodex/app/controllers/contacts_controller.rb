class ContactsController < ApplicationController
  before_filter :authenticate_user!, :load

  def load
    @with_page='page_contact'
    @contacts = current_user.contacts
    @contact = Contact.new
  end

  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.user=current_user
    if @contact.save
      flash[:notice] = "Successfully created contact."
      @contacts = current_user.contacts
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Successfully updated contact."
      @contacts = current_user.contacts
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact."
    @contacts = current_user.contacts
  end

  def search
    @contacts=Contact.search("%"+params[:key]+"%",current_user.id)
  end
end


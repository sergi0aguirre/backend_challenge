class ContactsController < ApplicationController
  before_filter :authenticate_user!, :load

  def load
    @total_pages=10
    @with_page='page_contact'
  end

  def index
    load_contacts
  end

  def show
    @contact = user_contacts.where(:id=> params[:id]).first
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end

  def new
    @contact = user_contacts.new()
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js
    end
  end

  def create
    @contact = user_contacts.new(params[:contact])
    stored=false
    if @contact.save
      flash[:notice] = "Successfully created contact."
      stored=true
    end
    load_contacts
    responds_to_parent do
      render :update do |page|
        page << ajax_contact_form(stored)
      end
    end

  end
   
  def edit
    @contact = user_contacts.find(params[:id])
    respond_to do |format|
      format.html { redirect_to contacts_path}
      format.js  { render :action => :new }
    end
  end

  def update
    stored=false
    @contact = user_contacts.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Successfully updated contact."
      stored=true
    end
    load_contacts
    responds_to_parent do
      render :update do |page|
        page << ajax_contact_form(stored)
      end
    end
  end

  def destroy
    @contact = user_contacts.find(params[:id])
    @contact.destroy
    flash[:notice] = "Successfully destroyed contact."
    load_contacts
  end

  def search
    load_contacts
    respond_to do |format|
      format.js {render :action=> :index}
    end
  end

  def delete_selection
    contacts=Contact.where_ids(params[:ids],current_user)
    contacts.delete_all
    load_contacts
    respond_to do |format|
      format.js {render :partial => 'contacts'}
    end
  end


  def load_contacts
    @ordertxt= params[:order]=="down" ? "Order A-Z" : "Order Z-A"
    key= params[:key] || ""
    order= params[:order]=="down" ? "first_name DESC" : "first_name ASC"
    params[:page]= 1 if params[:page]=="null"
    @contacts=Contact.filter(key,order,current_user.id).paginate :page => params[:page], :per_page => @total_pages
  end

  def user_contacts
      current_user.contacts
  end

end